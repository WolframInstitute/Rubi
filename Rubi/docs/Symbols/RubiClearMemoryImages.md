---
Template: Symbol
Name: RubiClearMemoryImages
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/RubiClearMemoryImages
Keywords: [integration, cache, memory image, loading, Rubi]
SeeAlso: [$RubiVersion, $RubiSourceCommit]
RelatedGuides: [Rubi]
---

## Usage

<code>[RubiClearMemoryImages]()[]</code> deletes the current source snapshot's Rubi memory images from the user cache.

## Details & Options

- Memory images are stored below the user cache, not in the paclet installation directory.
- Deleting an image does not remove source rules or affect an already loaded kernel. The next cold load recreates the image when possible.
- Cache identity includes the paclet version, upstream source commit, full kernel identity and loading configuration.
