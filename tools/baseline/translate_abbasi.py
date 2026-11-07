#!/usr/bin/env python3
"""Translate Abbasi's restricted Maple-like integration records to WL.

This is deliberately a parser, not a collection of textual substitutions.  It
accepts only the grammar present in Blake_Problems.txt and Hebisch_Problems.txt
and rejects unknown functions or trailing tokens.  Run with Python -I when the
input path contains downloaded data.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path
from typing import Any


TOKEN = re.compile(
    r"\s*(?:(?P<number>\d+(?:\.\d+)?)|"
    r"(?P<name>[A-Za-z_][A-Za-z0-9_]*)|"
    r"(?P<op>->|[-+*/^(),\[\]:=]))"
)
FUNCTIONS = {
    "exp": "Exp",
    "ln": "Log",
    "arctan": "ArcTan",
    "arctanh": "ArcTanh",
}
PRECEDENCE = {"->": 5, "+": 10, "-": 10, "*": 20, "/": 20, "^": 30}


class TranslationError(ValueError):
    pass


class Parser:
    def __init__(self, text: str):
        self.text = text
        self.tokens: list[tuple[str, str, int]] = []
        position = 0
        while position < len(text):
            match = TOKEN.match(text, position)
            if match is None:
                if text[position:].strip() == "":
                    position = len(text)
                    break
                excerpt = text[position : position + 40].splitlines()[0]
                raise TranslationError(
                    f"invalid token at byte {position}: {excerpt!r}"
                )
            kind = match.lastgroup
            assert kind is not None
            self.tokens.append((kind, match.group(kind), match.start()))
            position = match.end()
        self.tokens.append(("eof", "", len(text)))
        self.index = 0

    def peek(self, value: str | None = None) -> bool:
        token = self.tokens[self.index]
        return token[1] == value if value is not None else token[0] != "eof"

    def take(self, value: str | None = None) -> tuple[str, str, int]:
        token = self.tokens[self.index]
        if value is not None and token[1] != value:
            raise TranslationError(
                f"expected {value!r} at byte {token[2]}, found {token[1]!r}"
            )
        self.index += 1
        return token

    def parse_file(self) -> Any:
        if self.tokens[self.index][1] == "lst":
            self.take("lst")
            self.take(":")
            self.take("=")
        result = self.expression()
        if self.peek(":"):
            self.take(":")
        self.take("")
        if not isinstance(result, tuple) or result[0] != "list":
            raise TranslationError("top-level expression is not a list")
        for index, record in enumerate(result[1], 1):
            if not isinstance(record, tuple) or record[0] != "list":
                raise TranslationError(f"record {index} is not a list")
            if len(record[1]) != 4:
                raise TranslationError(
                    f"record {index} has {len(record[1])} fields, expected 4"
                )
        return result

    def expression(self, minimum_precedence: int = 0) -> Any:
        token = self.peek_token()
        if token[1] in ("+", "-"):
            self.take()
            left: Any = ("unary", token[1], self.expression(25))
        else:
            left = self.primary()

        while True:
            operator = self.peek_token()[1]
            precedence = PRECEDENCE.get(operator, -1)
            if precedence < minimum_precedence:
                break
            self.take()
            # Exponentiation and arrow are right associative.
            right = self.expression(precedence if operator in ("^", "->") else precedence + 1)
            left = (operator, left, right)
        return left

    def peek_token(self) -> tuple[str, str, int]:
        return self.tokens[self.index]

    def primary(self) -> Any:
        kind, value, position = self.take()
        if kind == "number":
            return ("number", value)
        if kind == "name":
            if self.peek("("):
                self.take("(")
                arguments = []
                if not self.peek(")"):
                    arguments.append(self.expression())
                    while self.peek(","):
                        self.take(",")
                        arguments.append(self.expression())
                self.take(")")
                if value not in FUNCTIONS and value != "RootSum":
                    raise TranslationError(
                        f"unknown function {value!r} at byte {position}"
                    )
                return ("call", value, arguments)
            return ("symbol", value)
        if value == "(":
            result = self.expression()
            self.take(")")
            return result
        if value == "[":
            items = []
            if not self.peek("]"):
                items.append(self.expression())
                while self.peek(","):
                    self.take(",")
                    items.append(self.expression())
            self.take("]")
            return ("list", items)
        raise TranslationError(f"expected expression at byte {position}, found {value!r}")


def serialize(node: Any, slots: dict[str, str] | None = None) -> str:
    slots = {} if slots is None else slots
    kind = node[0]
    if kind == "number":
        return node[1]
    if kind == "symbol":
        return slots.get(node[1], node[1])
    if kind == "list":
        return "{" + ",".join(serialize(item, slots) for item in node[1]) + "}"
    if kind == "unary":
        return f"({node[1]}{serialize(node[2], slots)})"
    if kind in PRECEDENCE:
        if kind == "->":
            raise TranslationError("arrow is only allowed as RootSum's second argument")
        return f"({serialize(node[1], slots)}{kind}{serialize(node[2], slots)})"
    if kind == "call":
        name, arguments = node[1], node[2]
        if name in FUNCTIONS:
            if len(arguments) != 1:
                raise TranslationError(f"{name} expects one argument")
            return f"{FUNCTIONS[name]}[{serialize(arguments[0], slots)}]"
        if name == "RootSum":
            if len(arguments) != 2:
                raise TranslationError("RootSum expects two arguments")
            polynomial_argument, arrow = arguments
            if not isinstance(arrow, tuple) or arrow[0] != "->":
                raise TranslationError("RootSum's second argument must be variable -> expression")
            variable, body = arrow[1], arrow[2]
            if not isinstance(variable, tuple) or variable[0] != "symbol":
                raise TranslationError("RootSum variable must be a symbol")
            polynomial = polynomial_argument
            if isinstance(polynomial_argument, tuple) and polynomial_argument[0] == "->":
                polynomial_variable, polynomial = polynomial_argument[1], polynomial_argument[2]
                if polynomial_variable != variable:
                    raise TranslationError("RootSum arguments use different bound variables")
            inner_slots = dict(slots)
            inner_slots[variable[1]] = "#"
            polynomial_text = serialize(polynomial, inner_slots)
            form = serialize(body, inner_slots)
            return f"RootSum[Function[{polynomial_text}],Function[{form}]]"
    raise TranslationError(f"cannot serialize node {node!r}")


def translate(text: str) -> tuple[str, dict[str, Any]]:
    tree = Parser(text).parse_file()
    records = tree[1]
    lines = ["{"]
    for index, record in enumerate(records):
        suffix = "," if index + 1 < len(records) else ""
        try:
            lines.append(serialize(record) + suffix)
        except TranslationError as error:
            raise TranslationError(f"record {index + 1}: {error}") from error
    lines.append("}")
    output = "\n".join(lines) + "\n"
    stats = {
        "records": len(records),
        "sourceSha256": hashlib.sha256(text.encode()).hexdigest(),
        "outputSha256": hashlib.sha256(output.encode()).hexdigest(),
        "functions": {name: count_calls(tree, name) for name in [*FUNCTIONS, "RootSum"]},
    }
    return output, stats


def count_calls(node: Any, name: str) -> int:
    if not isinstance(node, tuple):
        return 0
    total = int(node[0] == "call" and node[1] == name)
    for child in node[1:]:
        if isinstance(child, tuple):
            total += count_calls(child, name)
        elif isinstance(child, list):
            total += sum(count_calls(item, name) for item in child)
    return total


def self_test() -> None:
    source = (
        "lst:=[[exp(x)^2+ln(x),x,1,arctan(x)+arctanh(x)],"
        "[RootSum(_Z^2-2,_Z->ln(x-_Z)/_Z),x,1,0],"
        "[RootSum(_Z->_Z^2-3,_Z->ln(x-_Z)/_Z),x,1,0]]:"
    )
    output, stats = translate(source)
    assert stats["records"] == 3
    assert "Exp[x]^2" in output
    assert "ArcTan[x]" in output and "ArcTanh[x]" in output
    assert "RootSum[Function[" in output and "_Z" not in output
    for bad in ("lst:=[[sin(x),x,1,0]]:", "lst:=[[exp(x),x,1,0]]: junk"):
        try:
            translate(bad)
        except TranslationError:
            pass
        else:
            raise AssertionError(f"invalid input accepted: {bad}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path, nargs="?")
    parser.add_argument("output", type=Path, nargs="?")
    parser.add_argument("--self-test", action="store_true")
    arguments = parser.parse_args()
    if arguments.self_test:
        self_test()
        print("translator self-test passed")
        return
    if arguments.input is None or arguments.output is None:
        parser.error("input and output are required unless --self-test is used")
    text = arguments.input.read_text(encoding="ascii")
    output, stats = translate(text)
    arguments.output.write_text(output, encoding="ascii")
    print(json.dumps(stats, sort_keys=True))


if __name__ == "__main__":
    try:
        main()
    except (OSError, TranslationError) as error:
        print(f"translation failed: {error}", file=sys.stderr)
        raise SystemExit(1)
