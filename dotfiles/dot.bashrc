#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh'


alias md='mkdir'

alias cds='cd /c/projects/DS/DisclosureServices/'
alias cdw='cd /c/projects/DS/DisclosureServices/DisclosureServices.WebAPI/'
alias cdb='cd /c/projects/DS/DisclosureServices/DisclosureServices.WebApp.BackOffice/'
alias cdo='cd /c/projects/DS/DisclosureServices/DisclosureServices.WebApp.BackOffice/'
alias cdc='cd /c/projects/DS/DisclosureServices/DisclosureServices.WebApp.Client/'
alias cdi='cd /c/projects/DS/DisclosureServices/DisclosureServices.WebApp.Individual/'

alias cdt='cd /c/projects/dtag/'
alias cda='cd /c/projects/dtag/Dtag.API/Dtag.WebApiCore/'
alias cdl='cd /c/projects/dtag/Dtag.Client/'

alias gti='git'
alias finds='~/.finder'
alias greps='grep -ir --exclude-dir=node_modules --exclude-dir=dist --color'
alias jqc='jsoncheck'


alias lightsail='ssh 3.9.145.39 -i ~/.ssh/LightsailDefaultKey-eu-west-2.pem -l ubuntu'
alias lightsail2='ssh 35.178.229.227 -i ~/.ssh/LightsailDefaultKey-eu-west-2.pem -l ubuntu'
alias lightsail3='ssh 35.178.69.198 -i ~/.ssh/LightsailDefaultKey-eu-west-2.pem -l ubuntu'


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

# "foo"

# A preceding and/or succeeding * can often be useful too to get a broader wildcard search e.g.

# "*foo*"
