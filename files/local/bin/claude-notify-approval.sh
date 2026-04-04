#!/bin/sh
set -ex

input=$(cat)
cwd=$(echo "$input" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('cwd',''))" 2>/dev/null || true)
dirname=$(basename "$cwd")

if [ -n "$dirname" ]; then
  title="Claude Code ($dirname)"
else
  title="Claude Code"
fi

osascript -e "display notification \"承認をお願いします、先生！\" with title \"$title\""
say -v Kyoko -r 200 "承認をお願いします、先生！"
