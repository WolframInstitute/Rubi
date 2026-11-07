#!/bin/sh
# Supervise one baseline shard, or eight shards for a local non-container smoke.
# Arguments: RESULT_ROOT METHOD [MAX_NEW_ROWS_PER_SHARD] [SHARD]
# Full runs restart each worker every 100 rows to release cumulative Wolfram
# memory. Exit 20 means a chunk is complete; exit 0 means the shard is complete.
# A 137 exit is confirmed in a fresh recovery kernel. Only a second OOM for the
# same unfinished key writes its prepared F/memory row; other deaths write none.
set -u
if [ "$#" -lt 2 ]; then
  printf 'Usage: RunWorkers.sh RESULT_ROOT METHOD [MAX_NEW_ROWS_PER_SHARD] [SHARD]\n' >&2
  exit 2
fi
result_root=$1
method=$2
maximum=${3:-}
batch_size=100
deadline=172800
mkdir -p "$result_root/$method/logs"

log_memory_peak() {
  peak_shard=$1
  peak_status=$2
  if [ -r /sys/fs/cgroup/memory.peak ]; then
    peak_bytes=
    IFS= read -r peak_bytes < /sys/fs/cgroup/memory.peak || true
    printf 'Shard %s status %s cgroup memory.peak=%s bytes\n' "$peak_shard" "$peak_status" "$peak_bytes" >> "$result_root/$method/logs/shard-$peak_shard.log"
  fi
}

run_shard() {
  shard=$1
  log="$result_root/$method/logs/shard-$shard.log"
  started=${BASELINE_STARTED:-$(date +%s)}
  printf '\nShard %s supervisor started %s\n' "$shard" "$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> "$log"
  while :; do
    remaining=$((deadline - ($(date +%s) - started)))
    if [ "$remaining" -le 0 ]; then
      printf 'Shard %s exhausted cumulative %s second deadline\n' "$shard" "$deadline" >> "$log"
      return 124
    fi
    if [ -n "$maximum" ]; then
      timeout --kill-after=30 "$remaining" wolframscript -file /rubi/tools/baseline/Worker.wls \
        "$result_root" "$method" "$shard" 8 "$maximum" >> "$log" 2>&1
      status=$?
      log_memory_peak "$shard" "$status"
      if [ "$status" -eq 0 ] || [ "$status" -eq 20 ]; then
        return 0
      fi
      printf 'Smoke worker %s exited %s; no automatic recovery\n' "$shard" "$status" >> "$log"
      return "$status"
    fi
    timeout --kill-after=30 "$remaining" wolframscript -file /rubi/tools/baseline/Worker.wls \
      "$result_root" "$method" "$shard" 8 "$batch_size" >> "$log" 2>&1
    status=$?
    log_memory_peak "$shard" "$status"
    case "$status" in
      0)
        printf 'Shard %s complete\n' "$shard" >> "$log"
        return 0
        ;;
      20)
        printf 'Shard %s completed a %s row chunk; restarting fresh\n' "$shard" "$batch_size" >> "$log"
        ;;
      137)
        printf 'Shard %s kernel was OOM-killed; confirming before one fresh-kernel retry\n' "$shard" >> "$log"
        timeout --kill-after=30 "$remaining" wolframscript -file /rubi/tools/baseline/Worker.wls \
          "$result_root" "$method" "$shard" 8 retry-oom >> "$log" 2>&1
        recovery_status=$?
        log_memory_peak "$shard" "recovery-$recovery_status"
        if [ "$recovery_status" -ne 0 ]; then
          printf 'Shard %s OOM recovery failed with status %s\n' "$shard" "$recovery_status" >> "$log"
          return "$recovery_status"
        fi
        ;;
      1|134|139)
        printf 'Shard %s kernel exited %s; resuming without grading an interrupted record\n' "$shard" "$status" >> "$log"
        sleep 2
        ;;
      *)
        printf 'Shard %s stopped on unrecoverable status %s\n' "$shard" "$status" >> "$log"
        return "$status"
        ;;
    esac
  done
}

if [ "$#" -ge 4 ]; then
  run_shard "$4"
  exit "$?"
fi

pids=""
shard=0
while [ "$shard" -lt 8 ]; do
  run_shard "$shard" &
  pids="$pids $!"
  shard=$((shard + 1))
done
status=0
for pid in $pids; do
  if ! wait "$pid"; then
    status=1
  fi
done
exit "$status"
