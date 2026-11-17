#!/usr/bin/env bash
# Runs every test and compares its output with the .expected file next to it.
#   tests/<module>/<name>.xq   with the xquery tool:  xquery -f <name>.xq
#   tests/xslt/<name>.xsl      with the xslt tool:    xslt -it main <name>.xsl
# Exits 1 if any test fails.
#
#   scripts/test.sh [path-to-xquery] [path-to-xslt]   (default: xquery and xslt on PATH)
set -uo pipefail

XQ="${1:-xquery}"
XSLT="${2:-xslt}"
root="$(cd "$(dirname "$0")/.." && pwd)"
pass=0 fail=0

check() {  # check <test file> <command...>
  local t="$1"; shift
  local name="${t#"$root"/tests/}"
  # Run from the test's directory, so relative imports and base URIs are stable.
  # Line ends are normalized, so the same expected files work on Windows.
  local actual want
  actual="$(cd "$(dirname "$t")" && "$@" </dev/null 2>&1 | tr -d '\r')"
  want="$(tr -d '\r' < "${t%.*}.expected")"
  if [ "$actual" == "$want" ]; then
    pass=$((pass + 1))
  else
    fail=$((fail + 1))
    echo "FAIL $name"
    diff <(printf '%s\n' "$want") <(printf '%s\n' "$actual") | sed 's/^/    /'
  fi
}

for q in "$root"/tests/*/*.xq; do check "$q" "$XQ" -f "$(basename "$q")"; done
for s in "$root"/tests/xslt/*.xsl; do check "$s" "$XSLT" -it main "$(basename "$s")"; done

echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
