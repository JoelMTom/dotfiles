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

alias grep='grep --color=auto'
