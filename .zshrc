# WHEN YOU GET STUCK IN THE ^M MODE TYPE
#   stty sane   -> when shell gets in wacky ^M mode
#   ~.          -> to reset ssh hang


# # Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh
#
# # Set name of the theme to load.
# # Look in ~/.oh-my-zsh/themes/
# # Optionally, if you set this to "random", it'll load a random theme each
# # time that oh-my-zsh is loaded.
# ZSH_THEME="gallois" #"robbyrussell"
#
# # Set to this to use case-sensitive completion
# # CASE_SENSITIVE="true"
#
# # Comment this out to disable weekly auto-update checks
# # DISABLE_AUTO_UPDATE="true"
#
# # Uncomment following line if you want to disable colors in ls
# # DISABLE_LS_COLORS="true"
#
# # Uncomment following line if you want to disable autosetting terminal title.
# # DISABLE_AUTO_TITLE="true"
#
# # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# # Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git bundler brew gem heroku)
#
# source $ZSH/oh-my-zsh.sh


source $HOME/.antigen/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen-use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle git
antigen-bundle heroku
antigen-bundle brew
antigen-bundle gem
antigen-bundle bundler
antigen-bundle pip
antigen-bundle lein
antigen-bundle rbenv
antigen-bundle rvm
antigen-bundle command-not-found

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen-theme gallois  #robbyrussell

# Tell antigen that you're done.
antigen-apply





setopt auto_cd
cdpath=($HOME $HOME/src $HOME/code $HOME/code/ruby $HOME/code/motion $HOME/code/github)

# Turn off the spelling correction
unsetopt correct_all

# RVM
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


## ORACLE
#export ORACLE_HOME=/opt/oracle/instantclient_11_2
#export DYLD_LIBRARY_PATH=$ORACLE_HOME
#export ORACLE_SID=orcl
#export PATH=$PATH:$ORACLE_HOME/bin

export EDITOR=emacs
export GEM_OPEN_EDITOR=subl
export BUNDLER_EDITOR=$GEM_OPEN_EDITOR
#export CODE_BUDDY_EDITOR=$GEM_OPEN_EDITOR
export FOREMAN_COMMAND=forego

## LATEX
#export PATH=$PATH:/usr/texbin

## ALIASES
alias h="history"
alias gulp="node_modules/.bin/gulp"
#alias ads='kinit "Alexander Rothenberg"'
#alias adsstatus=klist

alias merged_git_branches='git branch --merged | egrep -v "(^\*|master|dev)"'
alias kill_merged_git_branches="merged_git_branches | xargs git branch -d"

#function sql_developer_pid {
#  ps aux | grep /Applications/SQLDeveloper.app/Contents/Resources/sqldeveloper/sqldeveloper/bin | grep -v grep | cut -c 16-21
#}
#alias killsql="kill -9 $(sql_developer_pid)"
#alias ksql="kill -9 `ps aux | grep /Applications/SQLDeveloper.app/Contents/Resources/sqldeveloper/sqldeveloper/bin | grep -v grep | cut -c16-21`"

#alias be='bundle exec'
#alias bake='bundle exec rake'

alias l='/bin/ls -FG'
alias ls='/bin/ls -AFG'

function ansvaultencrypt() {
  for f in $1
  do
    ansible-vault encrypt $1 --vault-password-file ~/.vault_pass.txt
  done
}

function ansvaultdecrypt() {
  for f in $1
  do
    ansible-vault decrypt $f --vault-password-file ~/.vault_pass.txt
  done
}

# [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator


#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# POSTGRES
#PATH=$PATH:"/Applications/Postgres.app/Contents/MacOS/bin"

# RAILS/BUNLDER
#export RAILS_GROUPS=debugger

# NPM
#PATH=$PATH:/usr/local/share/npm/bin

# ANDROID  - brew install android-sdk then "android" and more stuff
#ANDROID_HOME=/usr/local/opt/android-sdk
#ANDROID_SDK_HOME=$ANDROID_HOME/sdk/
#PATH=$PATH:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools

# Load som SECRETS (not pushed onto github :)
source ~/.secrets


# XCODE VERSIONING
BUILD_NUMBER=0

# Customize to your needs...
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/alex/bin:/Users/alex/.rvm/gems/ruby-1.8.7-p302/bin:/Users/alex/.rvm/gems/ruby-1.8.7-p302@global/bin:/Users/alex/.rvm/rubies/ruby-1.8.7-p302/bin:/Users/alex/.rvm/bin::/Users/alex/ruby/github/alexrothenberg.github.com/_bin
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH
export PATH=~/bin:/usr/X11/bin:/Users/alex/.rvm/bin:/Users/alex/ruby/github/alexrothenberg.github.com/_bin:$PATH

# Iora
#if [ -f /opt/boxen/env.d/70_hub.sh ]; then
#    echo "Moving boxen file '/opt/boxen/env.d/70_hub.sh' that breaks zshrc git tab completion"
#    mv /opt/boxen/env.d/70_hub.sh /opt/boxen/env.d/70_hub.sh.not_for_zsh
#fi
#source /opt/boxen/env.sh
#export PATH=/opt/boxen/nodenv/shims:$PATH
export PATH=~/src/toolchest/bin:$PATH
export SELENIUM_FIREFOX_BIN_PATH='/Applications/Firefox-33.app/Contents/MacOS/firefox-bin'

alias killfaye="kill `ps aux | grep faye | grep ruby | cut -c 16-22`"

export PATH=~/bin:$PATH

export SNOWFLAKE_URI='http://snowflake.dev'
export PATH=$PATH:/Users/alexrothenberg/src/toolchest/bin

# start ot check ssh-agent
ssh-agent
[ -f $HOME/.chirpstrap/env.sh ] && source $HOME/.chirpstrap/env.sh

export PATH="/usr/local/sbin:$PATH"

ssh-kochiku-worker () {
    local worker_ip=$1
    ssh -A -t ops@kochiku.icisapp.com ssh -A -t ops@${worker_ip}
}
