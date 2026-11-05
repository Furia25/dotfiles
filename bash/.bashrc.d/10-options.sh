HISTSIZE=50000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

shopt -s autocd cdspell dirspell globstar nocaseglob checkwinsize cmdhist

bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
