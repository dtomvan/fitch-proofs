#!/usr/bin/env bash
find . -name '*.fitch' -exec sh -c 'i="$1"; test -s "$i" && printf "%s: " "$i" && fitchv --no-template "$1"' shell {} \;
