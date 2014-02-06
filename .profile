export PS1='\[\033[01;36m\]\h \[\033[01;34m\]\W \[\033[00m\]\$ '
export GOBOLINKS="$HOME/System/Links"
CUSTOM="$HOME/custom"
PATH0="$HOME/bin:$HOME/quickfolders:/usr/local/git/bin:$HOME/working/www/htools/bin:$HOME/.gem/ruby/1.8/bin:$HOME/.cabal/bin:$GOBOLINKS/Executables:$CUSTOM/bin:$CUSTOM/usr/local/bin:/usr/local/texlive/2009basic/bin/universal-darwin"
PATH0="$PATH0:/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/sbin"
export CPATH="$GOBOLINKS/Headers:$GOBOLINKS/Headers/SDL"
export LIBRARY_PATH="$GOBOLINKS/Libraries"
export RUBYLIB=$HOME/lib/ruby
export EDITOR=vim
export HSITE="$HOME/working/hip"
export HFS="/Library/Frameworks/Houdini.framework/Versions/11.1.67/Resources"
export PYTHONPATH="$HOME/System/Links/Libraries/python3.2/site-packages:$HOME/System/Links/Libraries/python2.6/site-packages:$HOME/System/Links/Libraries/python2.3/site-packages:/Library/Python/2.7/site-packages:$CUSTOM/lib/python2.6/site-packages:$CUSTOM/Library/Python/2.6/site-packages"
export PYTHONPATH="$PYTHONPATH:$HFS/houdini/scripts/python"
export PYTHONPATH="$PYTHONPATH:$HOME/working/django"
#export HAXE_LIBRARY_PATH="`brew --prefix`/share/haxe/std"
export NODE_PATH="/usr/local/lib/node"

export LANG="en_US.utf8"
export LC_CTYPE="en_US.utf8"
export LC_NUMERIC="en_US.utf8"
export LC_TIME="en_US.utf8"
export LC_COLLATE="en_US.utf8"
export LC_MONETARY="en_US.utf8"
export LC_MESSAGES="en_US.utf8"

shopt -s checkwinsize
umask 022

export HISTIGNORE="&:exit:[ \t]*"
alias ls='ls -G'
alias mv='mv -i'
alias cp='cp -ir'
alias diff='diff -r'
alias irb='irb --simple-prompt'
alias latex='latex -interaction=nonstopmode'
alias telnet='telnet -e :'
alias less='less -R'
export LESSCHARSET="utf-8"

#if [ "$SSH_CLIENT" == "" ]; then
#  if [ "$(find ~/.trash | tail -n +2)" ]; then
#    find ~/.trash | tail -n +2 | xargs echo rm -rf
#    find ~/.trash | tail -n +2 | xargs rm -rf
#  fi
#fi

export PATH="$PATH0"

export LD_LIBRARY_PATH="$HOME/System/Links/Libraries:$CUSTOM/lib:/usr/local/lib:/usr/lib"
export DYLD_FALLBACK_LIBRARY_PATH="$LD_LIBRARY_PATH"
