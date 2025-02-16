#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias c='clear'

if command -v exa > /dev/null; then
  alias ls='exa'
  alias ll='exa -lah'
  alias lt='exa --tree -L 2'
  alias lt2='exa --tree -L 3'
fi

if command -v bat > /dev/null; then
  alias cat='bat'
fi

if command -v zoxide > /dev/null; then
  alias cd='z'
  alias zz='z -'
fi

eval "$(zoxide init bash)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias fk)"
eval "$(fzf --bash)"

alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

