#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias c='clear'

if command -v exa > /dev/null; then
  alias ls='exa --icons=auto'
  alias ll='exa -lah --icons=auto'
  alias lt='exa --tree -L 2 --icons=auto'
  alias lt2='exa --tree -L 3 --icons=auto'
fi

if command -v bat > /dev/null; then
  alias cat='bat'
fi

if command -v zoxide > /dev/null; then
  alias cd='z'
  alias zz='z -'
fi

export EDITOR=nvim
export MANPAGER='nvim +Man!'
export MANWIDTH='999'

eval "$(zoxide init bash)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias fk)"
eval "$(fzf --bash)"

alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

