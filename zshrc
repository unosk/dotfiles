#---------------------------------------------------------------------------
# General
#---------------------------------------------------------------------------
export LANG=en_US.UTF-8
export EDITOR=vim
export TERM=xterm-256color
setopt nobeep

#---------------------------------------------------------------------------
# History
#---------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt hist_no_store
setopt hist_reduce_blanks
setopt extended_history
setopt inc_append_history
setopt hist_ignore_space
setopt hist_verify
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#---------------------------------------------------------------------------
# Complement
#---------------------------------------------------------------------------
autoload -U compinit
compinit
setopt auto_pushd
setopt correct
setopt correct_all
setopt hist_expand
setopt list_types
setopt auto_list
setopt auto_menu
setopt list_packed
setopt auto_param_keys
setopt auto_param_slash
setopt mark_dirs
setopt auto_cd
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt nolistbeep

#---------------------------------------------------------------------------
# Appearance
#---------------------------------------------------------------------------
autoload -U colors
colors
setopt prompt_subst
export LSCOLORS=gxfxcxdxbxegedabagacad
zstyle ':completion:*' list-colors 'di=36;49'

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

#---------------------------------------------------------------------------
# Prompt
#---------------------------------------------------------------------------
PROMPT="%{${fg[yellow]}%}%/%{${reset_color}%} "
PROMPT2="%{${fg[yellow]}%}%_%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
RPROMPT="%1(v|%F{green}%1v%f|)"
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{${fg[cyan]}%}%n@${HOST%%.*} ${PROMPT}"

#---------------------------------------------------------------------------
# Alias
#---------------------------------------------------------------------------
alias ll='ls -ltr'
alias la="ls -lhAF --color=auto"

alias diff='colordiff'

alias be='bundle exec'

alias g='git'
alias gci='git commit'
alias gst='git status'
alias glg='git log'
alias gaa='git add .'
alias gdf='git diff'
alias gco='git checkout'

alias gffs='git flow feature start'
alias gfff='git flow feature finish'

#---------------------------------------------------------------------------
# Others
#---------------------------------------------------------------------------
function mkcd() {
  mkdir -p $1 && cd $1
}

function findgrep() {
  find . -type f -print | xargs grep -n --binary-files=without-match $@
}

function findswaps() {
  find -name '*.sw*'
}

function rmswaps() {
  findswaps | xargs rm
}

function reload() {
  source $HOME/.zshrc
}

function chpwd() {
  ls
}

function google() {
  local str opt
  if [ $ != 0 ]; then
    for i in $*; do
      str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt='search?num=50&amp;hl=ja&amp;lr=lang_ja'
    opt="${opt}&amp;q=${str}"
  fi
  w3m http://www.google.co.jp/$opt
}

function alc() {
  if [ $ != 0 ]; then
    w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
  else
    w3m "http://www.alc.co.jp/"
  fi
}

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
