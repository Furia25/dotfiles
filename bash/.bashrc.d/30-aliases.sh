alias lock=hyprlock

# 50-tools.sh
eval "$(fzf --bash)"             # Ctrl+R : recherche floue dans l'historique, Ctrl+T : fichiers
eval "$(zoxide init bash)"       # `z projet` saute dans un dossier déjà visité
eval "$(starship init bash)"     # prompt avec branche git, code de retour, durée...

alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --git'
alias tree='eza --tree --icons'
alias cat='bat --paging=never'
alias grep='grep --color=auto'

alias update='yay -Syu'
alias pacs='pacman -Ss'
alias pacq='pacman -Qs'
alias orphans='pacman -Qdtq'
alias cleanup='sudo pacman -Rns $(pacman -Qdtq)'   # peut échouer s'il n'y a aucun orphelin
alias cache-clean='sudo paccache -r'               # paquet pacman-contrib
alias mirrors='sudo reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias jctl='journalctl -p 3 -xb'                   # erreurs du boot courant
