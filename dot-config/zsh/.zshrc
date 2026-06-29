HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias fk)"
eval "$(fzf --zsh)"

fpath=($ZDOTDIR/completions $fpath)
autoload -Uz compinit

compinit -d "$XDG_CACHE_HOME/zsh/zshcompdump"

compdef exa=ls

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/fzf.zsh"

eval "$(starship init zsh)"

ZPLUGINDIR="$ZDOTDIR/plugins"

source "$ZPLUGINDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "$ZPLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "$ZPLUGINDIR/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
source "$ZPLUGINDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions
