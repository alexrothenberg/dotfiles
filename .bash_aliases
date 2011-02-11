# cd
alias ..='cd ..'

# ls
alias ls="/bin/ls -lAF"
alias l="/bin/ls -F"

alias h="history"

function sql_developer_pid {
  ps aux | grep /Applications/SQLDeveloper.app/Contents/Resources/sqldeveloper/sqldeveloper/bin | grep -v grep | cut -c10-15
}
alias killsql="kill -9 $(sql_developer_pid)"


# GIT
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '
