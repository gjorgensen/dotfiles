#   . ~/.profile
# after you mod this file run this to refresh your current session

alias vd='mvim .'
alias vrc='mvim ~/.vimrc'
alias pro='mvim ~/.profile'
alias dot='cd ~/dotfiles'
alias la='ls -al'
alias root='cd ~/'
alias rdm='bundle exec rake db:migrate'
alias rc='bundle exec rails console'
alias rgm='bundle exec rails g migration'
alias hrrc='rbenv exec heroku run rails c'
alias hrrdm='rbenv exec heroku run rake db:migrate'
alias gphm='git push heroku master'
alias gcam='git commit -a -m'
alias hdpull='rbenv exec heroku db:pull'
alias hdpush='rbenv exec heroku db:push'


# Project -- VoIP
alias voip='cd ~/projects/voip_tracker'
alias voipweb='open -a Firefox http://localhost:3000/service_orders'

# Project -- Biz
alias biz='cd ~/projects/bizpoint'
alias bizweb='open -a Firefox http://localhost:3000/clients'

# Project -- ED
alias ed='cd ~/projects/EDHelpDesk'
alias edweb='open -a Firefox http://localhost:3000/service_orders'

# Project -- DCCS
alias dccs='cd ~/projects/DCCS'

# think git diff remote (do a fetch first)
alias gdg='git diff --color remotes/origin/master..master'
alias gdh='git diff --color remotes/heroku/master..master'
alias gdc='git diff --color'

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



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
