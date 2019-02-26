# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/tylertrussell/.oh-my-zsh"

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

# Added by FZF install script
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
source '/Users/tylertrussell/google-cloud-sdk/path.zsh.inc'

# VirtualEnv
source '/Develop/Humble-Bundle/tools/setup/humble_bashrc'

# The next line enables shell command completion for gcloud.
source '/Users/tylertrussell/google-cloud-sdk/completion.zsh.inc'
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=$PATH:/Develop/Humble-Bundle/tools
export PATH=$PATH:/Applications/PyCharm.app/Contents/MacOS

# TBT 7/16/2015: alias "dev" to go to my dev dir
alias dev="cd /Develop/Humble-Bundle"

alias amend="git commit --amend --no-edit"

# TBT 7/16/2015: alias "devtools" to go to my dev tools dir
alias devtools="cd /Develop/Humble-Bundle/tools"

# TBT 7/22/2015: stolen from Brian S
alias post_a_review='git diff `git merge-base master HEAD` --full-index | post-review --diff-filename=- --open --branch=`git rev-parse --abbrev-ref HEAD`  --bugs-closed=`git rev-parse --abbrev-ref HEAD | cut -d/ -f1` --summary=`git rev-parse --abbrev-ref HEAD`'

# TBT 8/12/2015: humblepy settings
export HUMBLEPYSTARTUP=/Develop/Misc/HumblePy/startup.py

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

alias merge-master="git checkout master && git pull && git checkout - && git merge master"

set -o vi

# for oh-my-zsh
export EDITOR='vim'

function create_or_switch_to_tmux_session() {
  local tmux_session_name=$1
  # Make a new TMUX session for our ticket
  if tmux new -d -s $tmux_session_name; then
    echo "Made a new tmux session!"
  fi
  tmux switch -t $tmux_session_name
  echo "Attached to $tmux_session_name"
}

function create_or_switch_to_tmux_window() {
  local tmux_window_name=$1
  # Make a new TMUX window for our ticket
  tmux new-window -n $tmux_window_name
}

function create_or_cd_to_worktree() {
  local target=$1
  local local_worktrees_dir="worktrees"
  local remote_branches_prefix="tyler/worktrees"
  local branch_name="$remote_branches_prefix/$target"
  local dir_name="$local_worktrees_dir/$target"
  local tmux_session_name=$1
  # Ensure there's not already a worktree in the target location
  # if there is, just switch to it now
  if [ ! -d $dir_name ]; then
    git worktree add -b $branch_name $dir_name
  fi
  cd $dir_name
}

function start_on_ticket() {
  dev  # switch to the right directory :P

  local target=$1

  echo "Switching to work on $target"

  create_or_cd_to_worktree $target
  create_or_switch_to_tmux_window $target
}

alias start-ticket="start_on_ticket"
alias reload-zsh="source ~/.zshrc"
