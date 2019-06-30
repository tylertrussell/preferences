# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx tmux cloudapp jira)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export GCLOUD_SDK_DIR="/code/google-cloud-sdk"
export APPENGINE_SDK_DIR="$GCLOUD_SDK_DIR/platform/google_appengine"
export FRANKENSERVER_DIR="/code/frankenserver"

# Added by FZF install script
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_COMMAND="ag -l g"

# This is to avoid Ruby nonsense
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# TBT 7/16/2015: alias "dev" to go to my dev dir
alias dev="cd /code/Humble-Bundle"

function make_diff() {
  diff_output_path=${1:-/code/diff.diff}
  git diff --full-index origin/master... > $diff_output_path
}
alias diff="make_diff"

alias amend="git commit --amend --no-edit"

# TBT 7/16/2015: alias "devtools" to go to my dev tools dir
alias devtools="cd /code/Humble-Bundle/tools"

# TBT 7/22/2015: stolen from Brian S
alias post_a_review='git diff `git merge-base master HEAD` --full-index | post-review --diff-filename=- --open --branch=`git rev-parse --abbrev-ref HEAD`  --bugs-closed=`git rev-parse --abbrev-ref HEAD | cut -d/ -f1` --summary=`git rev-parse --abbrev-ref HEAD`'

# TBT 8/12/2015: humblepy settings
export HUMBLEPYSTARTUP=/code/Misc/HumblePy/startup.py

# TBT 2/17/2016: gist_me
alias gist_me="git diff origin/master... | gist -t diff -c -o -p"

alias pyc-clean='find . -name "*.pyc" -exec rm -f {} \;'
alias orig-clean='find . -name "*.orig" -exec rm -f {} \;'

# TBT 3/31/16: python-swiftclient shortcut for humble auth
alias hb-swift='swift -A https://hcs.hwcdn.net/auth/v1.0 -U humblebundle-5b7e:admin -K FgAESiOsFWBs'

# Stash $HUMBLEPYSTARTUP
alias stash-humblepystartup="mv $HUMBLEPYSTARTUP $HUMBLEPYSTARTUP.temp"
alias unstash-humblepystartup="mv $HUMBLEPYSTARTUP.temp $HUMBLEPYSTARTUP"

alias wip="git add . && git commit -m \"WIP\""
alias merge-master="dev && git pull --rebase && cd - && git merge master"
alias reload-zsh="source ~/.zshrc"

set -o vi

# for oh-my-zsh
export EDITOR='vim'

function check_for_old_commits() {
  git stash save
  git checkout master
  git pull
  local commitLine=`git show --decorate HEAD | head -n 1`
  echo $commitLine
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# I guess this is how we install Java on Linux?
export PATH="$PATH:/code/jre1.8.0_211"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv activate gae-cdn

cd /code

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/code/google-cloud-sdk/path.zsh.inc' ]; then . '/code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/code/google-cloud-sdk/completion.zsh.inc' ]; then . '/code/google-cloud-sdk/completion.zsh.inc'; fi


eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
