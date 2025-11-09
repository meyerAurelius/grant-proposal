#!/bin/sh
printf '\033c\033]0;%s\a' Virtual Lab
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Virtual Lab.x86_64" "$@"
