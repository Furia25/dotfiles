open() { xdg-open "$@" >/dev/null 2>&1 & }

mkcd() { mkdir -p "$1" && cd "$1"; }

up() { local d=""; for ((i=0; i<${1:-1}; i++)); do d+="../"; done; cd "$d"; }

extract() {
  case "$1" in
    *.tar.gz|*.tgz)  tar xzf "$1" ;;
    *.tar.xz)        tar xJf "$1" ;;
    *.tar.bz2)       tar xjf "$1" ;;
    *.tar.zst)       tar --zstd -xf "$1" ;;
    *.zip)           unzip "$1" ;;
    *.7z)            7z x "$1" ;;
    *.rar)           unrar x "$1" ;;
    *) echo "format inconnu : $1" ;;
  esac
}

fo() { local f; f=$(fzf) && open "$f"; }

port() { ss -tulpn | grep ":$1"; }
