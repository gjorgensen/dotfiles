# Project -- Kite
alias kite='cd ~/projects/kite'
alias kiteweb='open -a Firefox http://localhost:3000/tricks'

# Project -- VoIP
alias voip='cd ~/projects/voip_tracker'
alias voipweb='open -a Firefox http://localhost:3000/service_orders'

# Project -- Biz
alias biz='cd ~/projects/bizpoint'
alias bizweb='open -a Firefox http://localhost:3000/clients'

# Project -- ED
alias ed='cd ~/projects/EDHelpDesk'
alias edweb='open -a Firefox http://localhost:3000/service_orders'

# Project -- dls
alias dls='cd ~/projects/dls'
alias dlsweb='open -a Firefox http://localhost:3000/tricks'

alias dbcon='./script/dbconsole'
alias con='./script/console'
alias svr='./script/server'

alias vrc='mvim ~/.vimrc'
alias pro='mvim ~/.profile'
alias dot='cd ~/dotfiles'
alias db='mysql -u root'
alias la='ls -al'
alias root='cd ~/'

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/Users/gregoryjorgensen/.gem/ruby/1.8/gems/rails-2.3.5/lib/rails_generator:$PATH"

alias rr='rake test:recent'

# MacPorts Installer addition on 2011-03-23_at_09:54:12: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
# Make bash check its window size after a process completes
shopt -s checkwinsize
export PATH=$PATH:/var/lib/gems/1.8/gems/rails-2.3.2/bin

export PATH=$PATH:/Users/gregoryjorgensen/.gem/ruby/1.8/gems/rails-2.3.5/lib/rails_generator

export PATH=/usr/local/bin:$PATH
alias gvim=mvim

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
          return 0
  fi
  echo -e $gitver
}

branch_color ()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then
                color=""
                if git diff --quiet 2>/dev/null >&2
                then
                        color="${c_green}"
                else
                        color=${c_red}
                fi
        else
                return 0
        fi
        echo -ne $color
}
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

PS1='[\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]] \u@\[${c_cyan0}\]\w\[${c_sgr0}\]: '


