# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
bindkey -v
bindkey '^P' up-line-or-history


# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
bindkey '^e' autosuggest-accept

zi snippet OMZP::jsontools


zinit ice depth=1
# zinit light jeffreytse/zsh-vi-mode
# ZVM_VI_HIGHLIGHT_BACKGROUND=blue
# ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

# -----------------------------------------------------
# zinit light Aloxaf/fzf-tab
zinit light softmoth/zsh-vim-mode

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
alias ls='command -v exa >/dev/null 2>&1 && exa --icons'
alias la='command -v exa >/dev/null 2>&1 && exa --tree --level=1 --all --icons --long --modified'
# alias ll='ls -l'
alias ll='command -v exa >/dev/null 2>&1 && exa --tree --level=1 --icons --long'

alias calc='rofi -show calc -modi calc -no-show-match -no-sort'

alias notes='tjournal'

alias nrun='notify-send "Done: $*" "$(if [ $? -eq 0 ]; then echo succeeded; else echo "failed ($?)"; fi)" &'


eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
# source ~/.config/fzf/fzf-git.sh

export PATH=:$PATH
export EDITOR="/usr/bin/nvim"
export VISUL="/usr/bin/vlc"
export MANPAGER='nvim +Man!'
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin/statusbar:$HOME/minecraft:$HOME/.local/bin:$HOME/playgrounds/c/bin/"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/hari/google/google-cloud-sdk/path.zsh.inc' ]; then . '/home/hari/google/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hari/google/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/hari/google/google-cloud-sdk/completion.zsh.inc'; fi

# fnm
FNM_PATH="/home/hari/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# fnm
FNM_PATH="/home/hari/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
