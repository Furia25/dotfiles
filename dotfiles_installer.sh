#!/usr/bin/env bash
# dotfiles-min.sh : les configs essentielles dans ~/dotfiles, liées avec stow
# DRY=1 ./dotfiles-min.sh pour simuler
set -euo pipefail

DOTFILES="$HOME/dotfiles"
DRY="${DRY:-0}"

ITEMS=(
  .bashrc
  .bashrc.d
  .gitconfig
  .config/starship.toml
  .config/hypr
  .config/waybar
  .config/swaync
  .config/kitty
  .config/mpv
  .config/mimeapps.list
  .config/user-dirs.dirs
  .config/VSCodium/User/settings.json
  .config/VSCodium/User/keybindings.json
)

run() { if [[ "$DRY" == 1 ]]; then echo "[dry] $*"; else "$@"; fi; }

pkg_name() {
  local rel="$1" name
  if [[ "$rel" == .config/* ]]; then
    name="${rel#.config/}"; name="${name%%/*}"
  else
    name="${rel#.}"
  fi
  name="${name%.*}"
  echo "${name,,}"
}

declare -A PKGS=()

for rel in "${ITEMS[@]}"; do
  src="$HOME/$rel"
  pkg="$(pkg_name "$rel")"
  dest="$DOTFILES/$pkg/$rel"

  [[ -L "$src" ]] && { echo "déjà lié : $rel"; PKGS[$pkg]=1; continue; }
  [[ -e "$src" ]] || { echo "absent   : $rel"; continue; }
  [[ -e "$dest" ]] && { echo "CONFLIT  : $dest"; continue; }

  echo "déplacé  : $rel -> $pkg"
  run mkdir -p "$(dirname "$dest")"
  run mv "$src" "$dest"
  PKGS[$pkg]=1
done

command -v stow >/dev/null || { echo "stow manquant : sudo pacman -S stow"; exit 1; }

cd "$DOTFILES"
for pkg in "${!PKGS[@]}"; do
  [[ -d "$DOTFILES/$pkg" ]] && run stow -R -t "$HOME" "$pkg"
done
echo "Terminé."
