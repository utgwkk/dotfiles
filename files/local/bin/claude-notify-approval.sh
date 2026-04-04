#!/bin/sh
set -ex

osascript -e 'display notification "承認をお願いします、先生！" with title "Claude Code"'
say -v Kyoko -r 200 "承認をお願いします、先生！"
