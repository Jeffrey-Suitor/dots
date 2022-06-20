#!/usr/bin/env bash

THEME="lofi"

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main
