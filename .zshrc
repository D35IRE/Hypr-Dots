typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# ====== Powerlevel10k Instant Prompt ======
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ====== PATH ======
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# ====== Aliases ======
alias i="yay -S"
alias s="yay -Ss"
alias r="yay -Rns"
alias u="yay -Syu"
alias q="yay -Q"

alias ls="exa -l"

# ====== History ======
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS HIST_REDUCE_BLANKS

# ====== Plugins (manual) ======
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555555'

fpath+=~/.zsh/zsh-completions/src
autoload -U compinit && compinit

# ====== Oh My Zsh ======
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
plugins=(git fast-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ====== Powerlevel10k ======
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ====== Syntax Highlighting (keep only one) ======
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ====== FZF for history search ======
fzf-history-widget() {
  local selected=$(fc -l 1 | fzf --height 40% --reverse --border --prompt="History> " | sed 's/ *[0-9]* *//')
  if [[ -n $selected ]]; then
    BUFFER=$selected
    CURSOR=$#BUFFER
    zle reset-prompt
  fi
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget
bindkey '^H' backward-kill-word
kotofetch
