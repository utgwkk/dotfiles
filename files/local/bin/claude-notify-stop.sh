#!/bin/sh
set -ex

cwd=$(jq -r .cwd < /dev/stdin)
basename=$(basename "$cwd")

say -v Kyoko -r 200 "$basename の作業が終わりました！ どうですか、先生？ 褒めてくれてもいいんですよ？"
