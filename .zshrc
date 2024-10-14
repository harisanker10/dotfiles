# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# eval "$(starship init zsh)"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
bindkey -v


# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions

zi snippet OMZP::jsontools


zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
ZVM_VI_HIGHLIGHT_BACKGROUND=blue
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

# -----------------------------------------------------
# zinit light Aloxaf/fzf-tab
# zinit light softmoth/zsh-vim-mode

# Disable all tracking of editing keymap, cursor styling, prompt indicators,
# etc.
# VIM_MODE_NO_DEFAULT_BINDINGS=true
# VIM_MODE_TRACK_KEYMAP=no
#
# MODE_CURSOR_VIINS="blinking bar"
# MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
# MODE_CURSOR_VICMD="green block"
# MODE_CURSOR_SEARCH="#ff00ff steady underline"
# MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
# MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"
# -----------------------------------------------------



# Load completions

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

autoload -Uz compinit && compinit

zinit cdreplay -q

# Aliases
alias vim='nvim'
alias c='clear'
alias j='z'
alias k='kubectl'
alias ls='ls --color'
alias la='ls -a'
alias ll='ls -a -l'

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
# source ~/.local/src/fzf-git.sh/fzf-git.sh

# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin/statusbar:$HOME/minecraft:$HOME/.local/bin:$HOME/playgrounds/c/bin/"
export EDITOR="/usr/bin/nvim"
export VISUL="/usr/bin/vlc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
