#!/bin/sh
echo -ne '\033c\033]0;videojuego\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/videojuego.x86_64" "$@"
