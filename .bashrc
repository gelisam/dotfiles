export PS1='\[\033[01;36m\]\h \[\033[01;34m\]\W \[\033[00m\]\$ '
CUSTOM="$HOME/custom"
PATH0="$HOME/bin-common"
if [ -d /run/wrappers/bin ]; then
  PATH0="$PATH0"
  ln -sf --no-target-directory "$HOME/bin-nix" "$HOME/bin"
  ln -sf --no-target-directory "$HOME/.local/bin-nix" "$HOME/.local/bin"
  ln -sf --no-target-directory "$HOME/.cabal/bin-nix" "$HOME/.cabal/bin"
else
  PATH0="$PATH0:$HOME/.ghcup/bin"
  ln -sf --no-target-directory "$HOME/bin-fedora" "$HOME/bin"
  ln -sf --no-target-directory "$HOME/.local/bin-fedora" "$HOME/.local/bin"
  ln -sf --no-target-directory "$HOME/.cabal/bin-fedora" "$HOME/.cabal/bin"
fi
PATH0="$PATH0:$HOME/bin:$HOME/quickfolders:$HOME/.local/bin:$HOME/.cabal/bin:$CUSTOM/bin:$CUSTOM/usr/local/bin"
if [ -d /run/wrappers/bin ]; then
  PATH0="$PATH0:/run/wrappers/bin:/home/gelisam/.nix-profile/bin:/etc/profiles/per-user/gelisam/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
else
  PATH0="$PATH0:/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/sbin"
fi

export EDITOR=vim

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
alias g='grex .hs'
alias ls='ls -G'
alias mv='mv -i'
alias cp='cp -ir'
alias diff='diff -r'
alias irb='irb --simple-prompt'
alias latex='latex -interaction=nonstopmode'
alias telnet='telnet -e :'
alias less='less -R'
export LESSCHARSET="utf-8"

export PATH="$PATH0"
