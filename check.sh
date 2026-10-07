#!/usr/bin/env bash
fd -e fitch --exec sh -c 'test -s {} && printf "%s: " "{}" && fitchv --no-template {}'
