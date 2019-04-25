# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


#-------------------------#
# BASE - UTILITY          #
#-------------------------#
exists() {
    test -x "$(command -v "$1")"
}
#exec 2>set-x
#sudo dtruss -p $$ &>dtruss &


#-------------------------#
# BASE - PATH             #
#-------------------------#
#export                  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/bin:$HOME/.local/bin:/snap/bin:$HOME/.composer/vendor/bin"
export                  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/bin:$HOME/.composer/vendor/bin"
[ -d "/sw" ]         && PATH="$PATH:/sw/sbin:/sw/bin"
[ -d "/opt/local" ]  && PATH="$PATH:/opt/local/sbin:/opt/local/bin"
[ -d "/opt/X11" ]    && PATH="$PATH:/opt/X11/bin"
[ -d "/usr/X11" ]    && PATH="$PATH:/usr/X11/bin"
[ -d "/opt/kdemod" ] && PATH="$PATH:/opt/kdemod/bin"
[ -d "/opt/java" ]   && PATH="$PATH:/opt/java/bin"
[ -d "$EPREFIX" ]    && PATH="$PATH:$EPREFIX/usr/sbin:$EPREFIX/usr/bin:$EPREFIX/sbin:$EPREFIX/bin"
#PATH="$PATH:$HOME/.composer/vendor/bin"
[ -d "/usr/lib/git-core" ] \
    && PATH="$PATH:/usr/lib/git-core"
[ -d "/usr/libexec" ] \
    && PATH="$PATH:/usr/libexec"
[ -d "/Developer/usr/bin" ] \
    && PATH="$PATH:/Developer/usr/bin"
[ -d "/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin" ] \
    && PATH="$PATH:/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin"


export                  MANPATH="$HOME/.man:/usr/local/share/man:/usr/local/man"
[ -d "/sw" ]         && MANPATH="$MANPATH:/sw/share/man"
[ -d "/opt/local" ]  && MANPATH="$MANPATH:/opt/local/share/man:/opt/local/man"
[ -d "/opt/X11" ]    && MANPATH="$MANPATH:/opt/X11/share/man"
[ -d "/usr/X11" ]    && MANPATH="$MANPATH:/usr/X11/share/man"
[ -d "$EPREFIX"   ]  && MANPATH="$MANPATH:$(source "$EPREFIX/etc/profile.env"; echo "$MANPATH")"
MANPATH="$MANPATH:/usr/share/man:/usr/man"
exists java_home && \
    export JAVA_HOME=$(java_home)

#-------------------------#
# BASE - SECURITY         #
#-------------------------#
exists keychain     && eval "$(keychain --eval)"
umask 022


#-------------------------#
# BASE - APPLICATIONS     #
#-------------------------#
export EDITOR=ed
exists subl && EDITOR=gvim       || {
exists vim && EDITOR=gvim;       } || {
exists vi && EDITOR=gvim;         } || {
exists emacs && EDITOR=gvim;   }


#-------------------------#
# SHELL - CHECK TYPE      #
#-------------------------#
case "$-" in *i*) ;; *) return;; esac


#-----------------------------#
# ENVIRONMENT - APPLICATIONS  #
#-----------------------------#
exists lesspipe.sh && \
    export LESSOPEN="|lesspipe.sh %s"
export LESS="-i -M -R -W -S"
export GREP_COLOR=31
export NOSPLASH=1
export NOWELCOME=1
export PAGER=less
export MANPAGER=$PAGER


#-----------------------------#
# ENVIRONMENT - LOCAL CONFIG  #
#-----------------------------#
#export storia='11566@ch-s011.rsync.net'
[ -r "$HOME/.profile.local" ] && \
    . "$HOME/.profile.local"
[ "$BASH_VERSION" -a -z "$POSIXLY_CORRECT" ] && . "$HOME/.bashrc"
