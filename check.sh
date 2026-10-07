#!/usr/bin/env bash

if find . -name '*.fitch' -exec sh -c 'for i; do test -s "$i" && printf "%s: " "$i" && fitchv --no-template "$i"; done' shell {} \+ |
    grep -vF "The proof is correct!"; then
    exit 1
fi
