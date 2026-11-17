#!/usr/bin/env bash
# Runs every tests/<module>/<name>.xq with the xquery tool and compares its output with
# tests/<module>/<name>.expected. Exits 1 if any test fails.
#
#   scripts/test.sh [path-to-xquery]   (default: xquery on PATH)
set -uo pipefail

XQ="${1:-xquery}"
root="$(cd "$(dirname "$0")/.." && pwd)"
pass=0 fail=0

for q in "$root"/tests/*/*.xq; do
  name="${q#"$root"/tests/}"
  expected="${q%.xq}.expected"
  # Run from the test's directory, so the module import paths and static-base-uri() are stable.
  # Line ends are normalized, so the same expected files work on Windows.
  actual="$(cd "$(dirname "$q")" && "$XQ" -f "$(basename "$q")" </dev/null 2>&1 | tr -d '\r')"
  want="$(tr -d '\r' < "$expected")"
  if [ "$actual" == "$want" ]; then
    pass=$((pass + 1))
  else
    fail=$((fail + 1))
    echo "FAIL $name"
    diff <(printf '%s\n' "$want") <(printf '%s\n' "$actual") | sed 's/^/    /'
  fi
done

echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
