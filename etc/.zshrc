# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/wuming/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump fd shell-proxy wd web-search history history-substring-search ssh-agent tmux extract gitignore zsh-autosuggestions fzf)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias fd="fdfind"
alias r="ranger"
alias mrm='trash $@'
alias f='fzf'
alias t='trans -b'
alias e='vi $(fzf)'

# emacs设置
# alias emc="emacsclient -a=emacs -c"
# alias memc="emacs -q -l /home/wuming/code/emacs/origin/init.el"
# alias emacs='emacs -nw'
# alias e='emacsclient -t'
export ALTERNATE_EDITOR="vim"

# 别名
#alias ls="python /media/wuming/common/code/shell/ls.py"
#alias cd="python /media/wuming/common/code/shell/cd.py"

alias mls="python /home/wuming/me/config/utils/mls.py"


# DEFAULT_PROXY is deprecated
# export DEFAULT_PROXY=http://127.0.0.1:33375
export SHELLPROXY_URL=http://127.0.0.1:20171
# export https_proxy=https://127.0.0.1:20171

export QT_IM_MODULES=ibus
# export EDITOR="emacsclient -c"
# export PATH=~/.npm-global/bin:$PATH

export PATH="$HOME/.rbenv/bin:$PATH"
# Load rbenv automatically by appending
# the following to ~/.zshrc:

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

#java
JAVA_HOME="/usr/lib/jvm/java-14-openjdk-amd64"
CLASSPATH="$JAVA_HOME/lib"

#android
export PATH="$HOME/soft/app/android-studio/bin:$PATH"
#image
export PATH="$HOME/soft/app/:$PATH"

#composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

#python vscode
export PATH="$HOME/.local/bin:$PATH"

#moven
export MAVEN_HOME=/opt/apache-maven-3.6.3
export PATH=$MAVEN_HOME/bin:$HOME/soft/app/idea-IC-211.6693.111/bin:$HOME/soft/deb/Postman:$PATH

# 当前使用的是 java ide idea 教育版
# export PATH=$MAVEN_HOME/bin:$HOME/soft/app/idea-IU-203.7148.57/bin:$PATH
# /home/wuming/soft/app/idea-IC-211.6693.111

# 函数定义 
# 自定义删除命令 ，代替 rm
function trash()
{
	  pi=()
	  pj=()
	  while [[ $# -ge 1 ]]; do
		    tmp=$1
		    if [[ "${tmp:0:1}" == '-' ]] ;then
			      tmp=${tmp//r/f}
			      tmp=${tmp//d/f}
			      pi=(${pi[@]} $tmp)
		    else
			      pj=(${pj[@]} $tmp)
		    fi
		    shift
	  done
    mv ${pi[@]} ${pj[@]} /tmp
}


function zeal-docs-fix(){
    pushd "$HOME/.local/share/Zeal/Zeal/docsets" >/dev/null || return
    find . -iname 'react-main*.js' -exec rm '{}' \;
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export GEM_HOME="~/.ruby/"
export GEM_PATH="$HOME/.gem/ruby/2.6.0/bin"
export PATH="$PATH:$GEM_PATH:$HOME/.rvm/bin"

# ssh-add ~/.ssh/rsa_gmail
nohup ssh-add ~/.ssh/rsa_gmail >/dev/null 2>&1
# export LC_CTYPE="zh_CN.utf8"
