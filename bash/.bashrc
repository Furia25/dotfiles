#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for f in ~/.bashrc.d/*.sh; do
    [ -r "$f" ] && source "$f"
done
unset f
