#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export EDITOR=vi
export CONTAINERIP=`ip address show | grep inet | grep eth0 | cut -f 6 -d " " | cut -f 1 -d "/"`


alias ls='ls --color=auto'
alias ll='ls -lh'


alias md='mkdir'

alias gti='git'
alias finds='~/.finder'
alias greps='grep -ir --exclude-dir=node_modules --exclude-dir=dist --color'
alias jqc='jsoncheck'

alias rungit='ungit --ungitBindIp $CONTAINERIP'


cdx() {

    TEMP_PWD=`pwd`

    while ! [ -d .git ]; 
    do

	cd ..

    done

    OLDPWD=$TEMP_PWD
}



PS1='[\u@\h \W]\$ '





# To get the best from the 'finds' command, wrap your search term in quotes e.g.

# finds "foo"

# A preceding and/or succeeding * can often be useful too to get a broader wildcard search e.g.

# finds "*foo*"
