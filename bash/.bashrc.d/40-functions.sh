open() { xdg-open "$@" >/dev/null 2>&1 & }
mkcd() { mkdir -p "$1" && cd "$1"; }
