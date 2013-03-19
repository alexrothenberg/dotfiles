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
antigen-lib

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle git
antigen-bundle heroku
antigen-bundle brew
antigen-bundle gem
antigen-bundle bundler
antigen-bundle pip
antigen-bundle lein
antigen-bundle command-not-found

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen-theme gallois  #robbyrussell

# Tell antigen that you're done.
antigen-apply





# Customize to your needs...
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/alex/bin:/Users/alex/.rvm/gems/ruby-1.8.7-p302/bin:/Users/alex/.rvm/gems/ruby-1.8.7-p302@global/bin:/Users/alex/.rvm/rubies/ruby-1.8.7-p302/bin:/Users/alex/.rvm/bin:/Users/oracle/oracle/product/10.2.0/db_1/bin:/Users/alex/ruby/github/alexrothenberg.github.com/_bin
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/alex/.rvm/bin:/Users/alex/ruby/github/alexrothenberg.github.com/_bin

setopt auto_cd
cdpath=($HOME $HOME/ruby $HOME/ruby/github $HOME/ssc $HOME/motion)

# Turn off the spelling correction
unsetopt correct_all

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


## ORACLE
export ORACLE_64_HOME=/Users/oracle/oracle/product/10.2.0/db_1
export ORACLE_32_HOME=/Users/oracle/32_bit/instantclient_10_2
export ORACLE_HOME=$ORACLE_32_HOME
export DYLD_LIBRARY_PATH=$ORACLE_HOME/lib
export ORACLE_SID=orcl
export PATH=$PATH:$ORACLE_HOME/bin

export EDITOR=emacs
export GEM_OPEN_EDITOR=mate
export BUNDLER_EDITOR=$GEM_OPEN_EDITOR
export CODE_BUDDY_EDITOR=$GEM_OPEN_EDITOR

## LATEX
export PATH=/usr/texbin:$PATH

## ALIASES
alias h="history"

function sql_developer_pid {
  ps aux | grep /Applications/SQLDeveloper.app/Contents/Resources/sqldeveloper/sqldeveloper/bin | grep -v grep | cut -c 16-21
}
alias killsql="kill -9 $(sql_developer_pid)"
alias ksql="kill -9 `ps aux | grep /Applications/SQLDeveloper.app/Contents/Resources/sqldeveloper/sqldeveloper/bin | grep -v grep | cut -c16-21`"

alias be='bundle exec'
alias bake='bundle exec rake'

alias l='/bin/ls -FG'
alias ls='/bin/ls -AFG'


# [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
  

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# POSTGRES
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# RAILS/BUNLDER
export RAILS_GROUPS=debugger

# NPM
PATH=/usr/local/share/npm/bin:$PATH

# ANDROID
ANDROID_HOME=~/android/adt-bundle-mac-x86_64
ANDROID_SDK_HOME=$ANDROID_HOME/sdk/
PATH=$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools:$PATH

# Load som SECRETS (not pushed onto github :)
source ~/.secrets


# XCODE VERSIONING
BUILD_NUMBER=0

