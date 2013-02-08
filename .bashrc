source ~/.bash_aliases


## ORACLE 
export ORACLE_HOME=/Users/oracle/oracle/product/10.2.0/db_1
export DYLD_LIBRARY_PATH=$ORACLE_HOME/lib
export ORACLE_SID=orcl
export PATH=$PATH:$ORACLE_HOME/bin

export EDITOR=emacs
export GEM_OPEN_EDITOR=mate
export CODE_BUDDY_EDITOR=mate

### RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# put my bin stuff at the front of the path
export PATH=~/bin:$PATH:~/ruby/github/alexrothenberg.github.com/_bin
#export PATH=./bin:$PATH

### Add GIT to prompt
# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '



PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
