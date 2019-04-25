cite about-alias
about-alias 'general aliases'

#-------------------------------------------------------------
# EXPORTS
#-------------------------------------------------------------
# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%d/%m %H:%M:%S]$(echo -e ${NC}) "
export HOSTFILE=$HOME/.hosts    # Put a list of remote hosts in ~/.hosts

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
#PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi


if ls --color -d . &> /dev/null
then
  alias ls="ls --color=auto"
elif ls -G -d . &> /dev/null
then
  alias ls='ls -G'        # Compact view, show colors
fi

# Set the default editor
export EDITOR=vim
export VISUAL=vim

vim='vim'
alias vim="${vim}"
alias vi="${vim}"
#alias vim="vim -c 'colorscheme askapachecode'"
alias vimclean="vim -u NONE -U NONE -N -i NONE"
alias pico="${vim}"
alias spico="${vim}"
alias nano="${vim}"
alias snano="${vim}"

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

#export GREP_OPTIONS='--color=auto'
grep-flag-available() {
  echo | grep $1 "" >/dev/null 2>&1
  }

GREP_OPTIONS=""

# color grep results
if grep-flag-available --color=auto; then
    GREP_OPTIONS+=" --color=auto"
fi

#-------------------------------------------------------------
# Some settings
#-------------------------------------------------------------
# These  two options are useful for debugging.
alias debug="set -o nounset; set -o xtrace"

ulimit -S -c 0      # Don't want coredumps.
set -o notify
set -o noclobber
set -o ignoreeof

# Enable options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob       # Necessary for programmable completion.

# Disable options:
shopt -u mailwarn
unset MAILCHECK        # Don't want my shell to warn me of incoming mail.




#export GREP_OPTIONS='--color=auto'
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC='\e[m'               # Color Reset
ALERT=${BWhite}${On_Red} # Bold White on red background

#-------------------------------------------------------------
# MACHINE SPECIFIC ALIAS'S
#-------------------------------------------------------------
# Alias's for SSH
# alias SERVERNAME='ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'

# Alias's to change the directory
alias web='cd /var/www/html'

# Alias's to mount ISO files
# mount -o loop /home/NAMEOFISO.iso /home/ISOMOUNTDIR/
# umount /home/NAMEOFISO.iso
# (Both commands done as root only.)

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="ls -bFk --color=auto"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
else
    alias ls="ls -bFkG"
fi

#-------------------------------------------------------------
# GENERAL ALIAS'S
#-------------------------------------------------------------
# To temporarily bypass an alias, we preceed the command with a \
    # EG: the ls command is aliased, but to use the normal ls command you would type \ls

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Edit this .bashrc file
alias ebrc='edit ~/.bashrc'

# Show help for this .bashrc file
alias hlp='less ~/.bashrc_help'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
#alias vi='gvim'
alias svi='sudo vi'
#alias vis='vim "+set si"'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Alias's for multiple directory listing commands
#alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
#alias lx='ls -lXBh' # sort by extension
#alias lk='ls -lSrh' # sort by size
#alias lc='ls -lcrh' # sort by change time
#alias lu='ls -lurh' # sort by access time
#alias lr='ls -lRh' # recursive ls
#alias lt='ls -ltrh' # sort by date
#alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
#alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXBh'         #  Sort by extension.
alias lk='ls -lSrh'         #  Sort by size, biggest last.
alias lt='ls -ltrh'         #  Sort by date, most recent last.
alias lc='ls -ltcrh'        #  Sort by/show change time,most recent last.
alias lu='ls -lturh'        #  Sort by/show access time,most recent last.
# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias l=" ll -a"
cd() { builtin cd "$@"; l; }
alias lm='ll |more'        #  Pipe through 'more'
#   lr:  Full Recursive Directory Listing aka tree
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
#alias lr='ll -lRh'                     #  Recursive ls.
alias la='ll -A'                       #  Show hidden files.
alias tree='tree -Csuh --dirsfirst'    #  Nice alternative to 'recursive ls' ...
alias lof="ls -F | grep -v '[/@=|]' | less"
alias lofl="l -F | grep -v '[/@=|]' | less"
alias lnc='l --color=never'

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

# Search running processes
alias P="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias F="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"
alias ipview1="netstat -ntu | grep :80 | grep -v LISTEN | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -rn | grep -v 127.0.0.1 | wc -l"
alias ipview2="netstat -ntu | grep :80 | grep -v LISTEN | awk '{print $5}' | cut -d: -f1 | grep -v 127.0.0.1 | wc -l"
alias ipviewssh="netstat -anpl | grep :22 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"
alias ipviewssh1="netstat -ntu | grep :22 | grep -v LISTEN | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -rn | grep -v 127.0.0.1 | wc -l"
alias ipviewvnc="netstat -anpl | grep :590 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"
alias ipviewvnc1="netstat -ntu | grep :590 | grep -v LISTEN | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -rn | grep -v 127.0.0.1 | wc -l"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# SHA1
alias sha1='openssl sha1'

#-------------------------------------------------------------
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#+ be converted into scripts and removed from here.
#-------------------------------------------------------------

#-------------------
# Personnal Aliases
#-------------------

# Prevents accidentally clobbering files.
alias j='jobs -l'
alias which='type -a'
# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

#-------------------------#
# ALIASSES - FILESYSTEM   #
#-------------------------#

alias noproxy="http_proxy= HTTP_PROXY= https_proxy= HTTPS_PROXY= ftp_proxy= FTP_PROXY="
alias rs="nice rsync --archive --no-owner --sparse --hard-links --partial --progress"
alias rsz="rs --compress-level=9 --skip-compress=gz/zip/z/rpm/deb/iso/bz2/t[gb]z/7z/mp[34]/mov/avi/ogg/jpg/jpeg/rar/gif/png/dat"
alias port="sudo nice port"
alias mvn="nice mvn"

#-------------------------#
# ALIASSES - APPLICATIONS #
#-------------------------#
alias cal="cal -m -3"
alias gsh="git stash"
alias gst="git status --short --branch"
alias gsu="git submodule update --recursive --merge"
alias gdf="git diff"
alias gdt="git difftool"
alias glo="git log"
alias gps="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gci="git commit"
alias gad="git add"
alias grm="git rm"
alias gmv="git mv"
alias gtg="git tag"
alias gbr="git branch"
alias gs="git svn"


#-------------------------#
# ALIASSES - SYSTEM       #
#-------------------------#
exists() {
    test -x "$(command -v "$1")"
}

s() {
    fc -s "$1=$2"
}

exists wdiff && \
    alias wdiff="wdiff -a"
exists less && \
    alias more="less" || \
    alias less="more"
alias kbg='bg; kill $!; fg'
exists ltrace && \
    alias trace="ltrace -C -f -n 4 -S"
exists pcregrep && \
    alias pcregrep="pcregrep --color=auto"
alias grep="grep -I --color=auto"
alias egrep="grep -E"
alias fgrep="grep -F"
alias pg="pgrep -l"

if exists pstree; then
    p() {
        if pstree -A >/dev/null 2>&1; then
            pstree -Aahlpu
        else
            [[ -t 1 ]] \
                && pstree -w -g2 \
                || pstree -w -g1 | recode -fg IBM850..UTF8
        fi
    }
else
    if ps auxf >/dev/null 2>&1; then
        p() { ps auxf; }
    else
        p() { ps aux; }
    fi
fi
alias pp="p | less"
top -u -h >/dev/null 2>&1 && \
alias top="top -S -u -stats pid,ppid,user,cpu,time,threads,state,rprvt,vprvt,faults,command"


#-------------------------#
# ALIASSES - NETWORKING   #
#-------------------------#
alias n="netstat -np |grep tcp"
alias mtr="mtr -t"
alias nmap="nmap -v -v -T5"
alias nmapp="nmap -P0 -A --osscan_limit"
alias pktstat="sudo pktstat -tBFT"
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

#-------------------------------------------------------------
# some more ls aliases
#-------------------------------------------------------------
alias lld='ls -AlF|grep "^d"'
alias lll='ls -AlF|grep "^l"'
alias lh='ls -ldh .??*'
alias lnh='ls -lF'
alias wtf='watch -n 1 w -hs'
alias wth='ps uxa|more'
alias lstn='netstat -ant'
alias lstne='netstat -lnptuwa|grep "ESTABLISHED"'
alias lstnl='netstat -lnptuwa|grep "LISTEN"'
#alias cls='clear && printf '\''\e[3J'\'''
#alias c='clear && printf '\''\e[3J'\'''
alias c="clear && echo -e '\0033\0143'"
alias cls="clear && echo -e '\0033\0143'"


#-------------------------------------------------------------
# Tailoring 'less'
#-------------------------------------------------------------
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
                # Use this if lesspipe.sh exists.
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'
# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#-------------------------------------------------------------
# Spelling typos - highly personnal and keyboard-dependent :-)
#-------------------------------------------------------------
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'

#-------------------------------------------------------------
# ronvox alias
#-------------------------------------------------------------
alias connections='lsof -n -P -i +c 15'
alias dirtree='ls -R | grep :*/ | grep : | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
alias nocomment='grep -Ev '\''^(#|$|")'\'''
alias treef='find . -print | sed -e '\''s;[^/]*/;|____;g;s;____|; |;g'\'''
alias usage='du -h --max-depth=1 | sort -rh'
alias laa='ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep "^l" | sed -r "s/\x1B\[([0-9]{1,3}((;[0-9]{1,3})*)?)?[m|K]//g" '

#-------------------------------------------------------------
# Special Functions
#-------------------------------------------------------------

# Use the best version of pico installed
# edit () {
#     if [ "$(type -t jpico)" = "file" ]; then
#         # Use JOE text editor http://joe-editor.sourceforge.net/
#         jpico -nonotice -linums -nobackups "$@"
#     elif [ "$(type -t nano)" = "file" ]; then
#         nano -c "$@"
#     elif [ "$(type -t pico)" = "file" ]; then
#         pico "$@"
#     else
#         vim "$@"
#     fi
# }
sedit() {
    if [ "$(type -t jpico)" = "file" ]; then
        # Use JOE text editor http://joe-editor.sourceforge.net/
        sudo jpico -nonotice -linums -nobackups "$@"
    elif [ "$(type -t nano)" = "file" ]; then
        sudo nano -c "$@"
    elif [ "$(type -t pico)" = "file" ]; then
        sudo pico "$@"
    else
        sudo vim "$@"
    fi
}

# Extracts any archive(s) (if unp isn't installed)
extract() {
    for archive in $*; do
        if [ -f $archive ] ; then
            case $archive in
                *.tar.bz2)   tar xvjf $archive    ;;
                *.tar.gz)    tar xvzf $archive    ;;
                *.bz2)       bunzip2 $archive     ;;
                *.rar)       rar x $archive       ;;
                *.gz)        gunzip $archive      ;;
                *.tar)       tar xvf $archive     ;;
                *.tbz2)      tar xvjf $archive    ;;
                *.tgz)       tar xvzf $archive    ;;
                *.zip)       unzip $archive       ;;
                *.Z)         uncompress $archive  ;;
                *.7z)        7z x $archive        ;;
                *)           echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

# Searches for text in all files in the current folder
ftext() {
    # -i case-insensitive
    # -I ignore binary files
    # -H causes filename to be printed
    # -r recursive search
    # -n causes line number to be printed
    # optional: -F treat search term as a literal, not a regular expression
    # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
    grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp() {
    set -e
    strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
    | awk '{
    count += $NF
    if (count % 10 == 0) {
        percent = count / total_size * 100
        printf "%3d%% [", percent
        for (i=0;i<=percent;i++)
            printf "="
            printf ">"
            for (i=percent;i<100;i++)
                printf " "
                printf "]\r"
            }
        }
    END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Copy and go to the directory
cpg ()
{
    if [ -d "$2" ];then
        cp $1 $2 && cd $2
    else
        cp $1 $2
    fi
}

# Move and go to the directory
mvg () {
    if [ -d "$2" ];then
        mv $1 $2 && cd $2
    else
        mv $1 $2
    fi
}

# Create and go to the directory
mkdirg () {
    mkdir -p $1
    cd $1
}

# Goes up a specified number of directories  (i.e. up 4)
up () {
    local d=""
    limit=$1
    for ((i=1 ; i <= limit ; i++))
        do
            d=$d/..
        done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}

#Automatically do an ls after each cd
# cd ()
# {
#   if [ -n "$1" ]; then
#       builtin cd "$@" && ls
#   else
#       builtin cd ~ && ls
#   fi
# }

# Returns the last 2 fields of the working directory
pwdtail() {
    pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# Show the current distribution
distribution() {
    local dtype
    # Assume unknown
    dtype="unknown"

    # First test against Fedora / RHEL / CentOS / generic Redhat derivative
    if [ -r /etc/rc.d/init.d/functions ]; then
        source /etc/rc.d/init.d/functions
        [ zz`type -t passed 2>/dev/null` == "zzfunction" ] && dtype="redhat"

    # Then test against SUSE (must be after Redhat,
    # I've seen rc.status on Ubuntu I think? TODO: Recheck that)
    elif [ -r /etc/rc.status ]; then
        source /etc/rc.status
        [ zz`type -t rc_reset 2>/dev/null` == "zzfunction" ] && dtype="suse"

    # Then test against Debian, Ubuntu and friends
    elif [ -r /lib/lsb/init-functions ]; then
        source /lib/lsb/init-functions
        [ zz`type -t log_begin_msg 2>/dev/null` == "zzfunction" ] && dtype="debian"

    # Then test against Gentoo
    elif [ -r /etc/init.d/functions.sh ]; then
        source /etc/init.d/functions.sh
        [ zz`type -t ebegin 2>/dev/null` == "zzfunction" ] && dtype="gentoo"

    # For Mandriva we currently just test if /etc/mandriva-release exists
    # and isn't empty (TODO: Find a better way :)
    elif [ -s /etc/mandriva-release ]; then
        dtype="mandriva"

    # For Slackware we currently just test if /etc/slackware-version exists
    elif [ -s /etc/slackware-version ]; then
        dtype="slackware"

    fi
    echo $dtype
}

# Show the current version of the operating system
ver() {
    local dtype
    dtype=$(distribution)

    if [ $dtype == "redhat" ]; then
        if [ -s /etc/redhat-release ]; then
            cat /etc/redhat-release && uname -a
        else
            cat /etc/issue && uname -a
        fi
    elif [ $dtype == "suse" ]; then
        cat /etc/SuSE-release
    elif [ $dtype == "debian" ]; then
        lsb_release -a
        sudo cat /etc/issue && sudo cat /etc/issue.net && sudo cat /etc/lsb_release && sudo cat /etc/os-release # Linux Mint option 2
    elif [ $dtype == "gentoo" ]; then
        cat /etc/gentoo-release
    elif [ $dtype == "mandriva" ]; then
        cat /etc/mandriva-release
    elif [ $dtype == "slackware" ]; then
        cat /etc/slackware-version
    else
        if [ -s /etc/issue ]; then
            cat /etc/issue
        else
            echo "Error: Unknown distribution"
            exit 1
        fi
    fi
}

# Automatically install the needed support files for this .bashrc file
install_bashrc_support() {
    local dtype
    dtype=$(distribution)

    if [ $dtype == "redhat" ]; then
        sudo yum install multitail tree joe
    elif [ $dtype == "suse" ]; then
        sudo zypper install multitail
        sudo zypper install tree
        sudo zypper install joe
    elif [ $dtype == "debian" ]; then
        sudo apt-get install multitail tree joe
    elif [ $dtype == "gentoo" ]; then
        sudo emerge multitail
        sudo emerge tree
        sudo emerge joe
    elif [ $dtype == "mandriva" ]; then
        sudo urpmi multitail
        sudo urpmi tree
        sudo urpmi joe
    elif [ $dtype == "slackware" ]; then
        echo "No install support for Slackware"
    else
        echo "Unknown distribution"
    fi
}

# Show current network information
netinfo() {
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    echo ""
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    echo ""
    /sbin/ifconfig | awk /'inet addr/ {print $4}'

    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    echo "---------------------------------------------------"
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip() {
    # Dumps a list of all IP addresses for every device
    # /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

    # Internal IP Lookup
    echo -n "Internal IP: " ; /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

    # External IP Lookup
    echo -n "External IP: " ; wget http://smart-ip.net/myip -O - -q
}

# View Apache logs
apachelog() {
    if [ -f /etc/httpd/conf/httpd.conf ]; then
        cd /var/log/httpd && ls -xAh && multitail --no-repeat -c -s 2 /var/log/httpd/*_log
    else
        cd /var/log/apache2 && ls -xAh && multitail --no-repeat -c -s 2 /var/log/apache2/*.log
    fi
}

# Edit the Apache configuration
apacheconfig() {
    if [ -f /etc/httpd/conf/httpd.conf ]; then
        sedit /etc/httpd/conf/httpd.conf
    elif [ -f /etc/apache2/apache2.conf ]; then
        sedit /etc/apache2/apache2.conf
    else
        echo "Error: Apache config file could not be found."
        echo "Searching for possible locations:"
        sudo updatedb && locate httpd.conf && locate apache2.conf
    fi
}

# Edit the PHP configuration file
phpconfig() {
    if [ -f /etc/php.ini ]; then
        sedit /etc/php.ini
    elif [ -f /etc/php/php.ini ]; then
        sedit /etc/php/php.ini
    elif [ -f /etc/php5/php.ini ]; then
        sedit /etc/php5/php.ini
    elif [ -f /usr/bin/php5/bin/php.ini ]; then
        sedit /usr/bin/php5/bin/php.ini
    elif [ -f /etc/php5/apache2/php.ini ]; then
        sedit /etc/php5/apache2/php.ini
    else
        echo "Error: php.ini file could not be found."
        echo "Searching for possible locations:"
        sudo updatedb && locate php.ini
    fi
}

# Edit the MySQL configuration file
mysqlconfig() {
    if [ -f /etc/my.cnf ]; then
        sedit /etc/my.cnf
    elif [ -f /etc/mysql/my.cnf ]; then
        sedit /etc/mysql/my.cnf
    elif [ -f /usr/local/etc/my.cnf ]; then
        sedit /usr/local/etc/my.cnf
    elif [ -f /usr/bin/mysql/my.cnf ]; then
        sedit /usr/bin/mysql/my.cnf
    elif [ -f ~/my.cnf ]; then
        sedit ~/my.cnf
    elif [ -f ~/.my.cnf ]; then
        sedit ~/.my.cnf
    else
        echo "Error: my.cnf file could not be found."
        echo "Searching for possible locations:"
        sudo updatedb && locate my.cnf
    fi
}

# For some reason, rot13 pops up everywhere
rot13() {
    if [ $# -eq 0 ]; then
        tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
    else
        echo $* | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
    fi
}

# Trim leading and trailing spaces (for scripts)
trim() {
    local var=$@
    var="${var#"${var%%[![:space:]]*}"}"  # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"  # remove trailing whitespace characters
    echo -n "$var"
}

function _exit()              # Function to run upon exit of shell.
{
    echo -e "${BRed}Hasta la vista, baby${NC}"
}
trap _exit EXIT


# Test connection type:
if [ -n "${SSH_CONNECTION}" ]; then
    CNX=${Green}        # Connected on remote machine, via ssh (good).
elif [[ "${DISPLAY%%:0*}" != "" ]]; then
    CNX=${ALERT}        # Connected on remote machine, not via ssh (bad).
else
    CNX=${BCyan}        # Connected on local machine.
fi

# Test user type:
if [[ ${USER} == "root" ]]; then
    SU=${Red}           # User is root.
elif [[ ${USER} != $(logname) ]]; then
    SU=${BRed}          # User is not login user.
else
    SU=${BCyan}         # User is normal (well ... most of us are).
fi

NCPU=$(grep -c 'processor' /proc/cpuinfo)    # Number of CPUs
SLOAD=$(( 100*${NCPU} ))        # Small load
MLOAD=$(( 200*${NCPU} ))        # Medium load
XLOAD=$(( 400*${NCPU} ))        # Xlarge load

# Returns system load as percentage, i.e., '40' rather than '0.40)'.
function load()
{
    local SYSLOAD=$(cut -d " " -f1 /proc/loadavg | tr -d '.')
    # System load of the current host.
    echo $((10#$SYSLOAD))       # Convert to decimal.
}

# Returns a color indicating system load.
function load_color()
{
    local SYSLOAD=$(load)
    if [ ${SYSLOAD} -gt ${XLOAD} ]; then
        echo -en ${ALERT}
    elif [ ${SYSLOAD} -gt ${MLOAD} ]; then
        echo -en ${Red}
    elif [ ${SYSLOAD} -gt ${SLOAD} ]; then
        echo -en ${BRed}
    else
        echo -en ${Green}
    fi
}

# Returns a color according to free disk space in $PWD.
function disk_color()
{
    if [ ! -w "${PWD}" ] ; then
        echo -en ${Red}
        # No 'write' privilege in the current directory.
    elif [ -s "${PWD}" ] ; then
        local used=$(command df -P "$PWD" |
                   awk 'END {print $5} {sub(/%/,"")}')
        if [ ${used} -gt 95 ]; then
            echo -en ${ALERT}           # Disk almost full (>95%).
        elif [ ${used} -gt 90 ]; then
            echo -en ${BRed}            # Free disk space almost gone.
        else
            echo -en ${Green}           # Free disk space is ok.
        fi
    else
        echo -en ${Cyan}
        # Current directory is size '0' (like /proc, /sys etc).
    fi
}

# Returns a color according to running/suspended jobs.
function job_color()
{
    if [ $(jobs -s | wc -l) -gt "0" ]; then
        echo -en ${BRed}
    elif [ $(jobs -r | wc -l) -gt "0" ] ; then
        echo -en ${BCyan}
    fi
}

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


#-------------------------#
# FUNCTIONS - CONVENIENCE #
#-------------------------#
i() {
    bash --rcfile <(printf '%s\n' "$(<~/.bashrc)" "HISTFILE='$HISTFILE.i'" "PS1='\[$yellow\]~\[$reset\]$PS1'" "cd; clear"); clear
}
d() {
    if exists colordiff; then
        colordiff -ur "$@"
    elif exists diff; then
        diff -ur "$@"
    elif exists comm; then
        comm -3 "$1" "$2"
    fi | less
}
# f pattern [find-args]
f() {
    local root pattern=$1 preargs=() postargs=() ispost=0; shift
    for arg; do
        if [[ $arg == -- ]]; then
            ispost=1
        else
            if (( ispost )); then
                postargs+=("$arg")
            else
                preargs+=("$arg")
            fi
        fi
    done
    (( ${#preargs[@]} )) || preargs=.

    printf >&2 'find '
    printf >&2 '<%s> ' "${preargs[@]}"
    printf >&2 -- '-iname <*%s*> ' "$pattern"
    printf >&2 '<%s> ' "${postargs[@]}"
    printf >&2 '\n'

    find "${preargs[@]}" -iname "*$pattern*" "${postargs[@]}"
}
abs() {
    for arg; do
        [[ $arg = /* ]] || arg=$PWD/$arg
        printf '%s\n' "$arg"
    done
}
rerun() {
    local h history histories dialogMenu=() startIndex

    # Load in history entries (ignoring the last)
    IFS=$'\n' read -r -d '' -a histories < <(history | tail -n "${1:-10}")
    unset histories[${#histories[@]}-1]

    # Build a dialog(1) menu and show it to ask for the starting index.
    for h in "${!histories[@]}"; do dialogMenu+=( "$h" "${histories[h]}" ); done
    startIndex=$(dialog --stdout --menu "Bash History" 0 0 0 "${dialogMenu[@]}")

    # Run all history commands starting from the starting index.
    for history in "${histories[@]:startIndex}"; do
        eval "${history#*$'\t'}" || break
    done
}
sw() {
    local bak="$1~"
    while [[ -e $bak ]]
    do bak+='~'; done
    mv -v "$1" "$bak"
    mv -v "$2" "$1"
    mv -v "$bak" "$2"
}
ppg() {
    pat=$1; shift
    p | grep -i "$@" "$pat"
}
cwatch() {
    while sleep .5; do
        o="$("$@")"
        clear && echo "$o"
    done
}
mvns() {
    export PATH=/usr/local/share/soylatte16-amd64-1.0.3/bin:${PATH}
    export JAVA_HOME=/usr/local/share/soylatte16-amd64-1.0.3

    mvn "$@"
}
mvnroot() {
    local p=$PWD c=${1:-1}
    until p=${p%/*}; [[ -e "$p/pom.xml" ]] && (( --c <= 0 )); do :; done

    echo "${p}${red}${PWD#$p}${reset}"
    cd "$p"
}
git() {
    local errors suffix

    case $1 in
        push)
            if git submodule foreach --recursive git-check-remote; then
                inf 'All submodules have been pushed.  Continuing with push.'
            else
                err 'Fix the errors above before committing.'
                return 1
            fi ;;
    esac

    nice git "$@"
}
gf() {
    git-forest -a --sha "${@:---all}" | less
}
gd() {
    git describe --always --dirty
}
gdm() {
    emit "GIT Daemon starting with base path: $(shorten "$PWD")"
    git daemon --base-path=. "$@" &
}
git-redo-move() {
(( $# == 2 ))   || { emit -r "Expected two parameters; [source] [destination]."; return; }
[[ -e $2 ]]     || { emit -r "$2 doesn't exist, can't redo move."; return; }
[[ ! -e $1 ]]   || { emit -r "$1 exists, don't want to overwrite, aborting redo move."; return; }
mkdir -p "${1%/*}" && \mv "$2" "$1" && git mv "$1" "$2" && rmdir -p "${1%/*}"
}
git-repo-status() {
local exit=$? cwd=$PWD repo= tag

while [[ $cwd ]]; do
    [[ -d $cwd/.git ]] && { repo=git; break; }

    cwd=${cwd%/*}
done

case $repo in
    git)
        if ! tag=$(git describe --tags --exact-match 2>&-); then
            tag=$(git describe --tags 2>&-)
            tag=${tag%-*} # Chop off hash.
        fi
        printf '[%s%s%s] \n' "${cwd##*/}" "${tag:+:}" "$tag"
        ;;
esac

return $exit
}
ps-stats() {
local exitcode=$? cmd=$1 elapsed= ps_stats_file="${TMPDIR:-/tmp}/.ps_stats.$$" elapsedColor= exitColor=

# Exit code.
(( exitcode )) || exitcode=

# Calculate elapsed since last command.
[[ -e $ps_stats_file ]] && {
(( elapsed = SECONDS - $(<"$ps_stats_file") ))
(( elapsed )) || elapsed=
    }

    # Record start of command.
    if (( cmd )); then
        echo "$SECONDS" > "$ps_stats_file"
    else
        rm -f "$ps_stats_file"
    fi

    # Color stats.
    (( elapsed >= 5 )) && elapsedColor=$red || elapsedColor=$green
    (( exitcode )) && exitColor=$red || exitColor=$green
    (( exitcode > 128 )) && exitColor=$yellow

    # Display stats.
    printf %s "$save$return$(tput cuf $((COLUMNS - 9 - ${#elapsed} - 0${elapsed:+2} - ${#exitcode} - 0${exitcode:+2})))$eel" \
        "${elapsed:+$elapsedColor+$reset$elapsed }" \
        "${exitcode:+$exitColor?$reset$exitcode }" \
        "$(date +"${yellow}T$reset%H$yellow:$reset%M$yellow:$reset%S")$load"
}
portget() {
    (( $# )) || { emit -r "$0 [revision] [category/portname]"; return; }

    [[ -e "${2#*/}" ]] && { ask -Ny! 'Target exists, delete?' && rm -rf "${2#*/}" || return; }
    svn co -r "$1" http://svn.macports.org/repository/macports/trunk/dports/"$2"
    cd "${2#*/}"
}


#-------------------------#
# FUNCTIONS - NETWORKING  #
#-------------------------#
exists lft && \
    lft() {
        sudo lft -S "$@" | tail -n +3 | column -t
    }
    svnup() {
        local cRev=$(svn info | awk '/^Revision:/ { print $2 }')
        [[ $cRev ]] || { emit -r "Not in a repository."; return 1; }

        emit "Looking for updates to r$cRev"
        svn up

        local nRev=$(svn info | awk '/^Revision:/ { print $2 }')
        [[ $nRev = $cRev ]] && {
        emit "Nothing to update."
        return
    }

    echo
    emit "Changelog $cRev -> $nRev:"
    svn log -r$((cRev+1)):$nRev | while IFS= read -r line; do
    [[ $line ]] || continue

    [[ $line != *[^-]* ]] && { begin=1; continue; }
    if (( begin )); then
        read rev _ user _ d t _ <<< "$line"
        echo
        echo "$bold$green$user$reset - r$bold${rev#r}$reset:    "$'\t'"($bold$d$reset - $bold$t$reset)"
        begin=0
    else
        [[ $line = *:* ]] \
            && echo $'\t'"$reset- $bold$blue${line%%:*}$reset:${line#*:}" \
            || echo $'\t'"$reset- $line"
    fi
done

echo
emit "To view the code diff of these updates; execute: svn diff -r$cRev:$nRev $(quote "$@")"
}


#-------------------------#
# FUNCTIONS - FILE SYSTEM #
#-------------------------#
cc() {
    [[ $@ =~ ^\ *(.*)\ +([^\ ]+)\ *$ ]] && \
        tar -Sc ${BASH_REMATCH[1]} | \
        tar --preserve -xvC ${BASH_REMATCH[2]}
}


#-------------------------#
# FUNCTIONS - EVALUATION  #
#-------------------------#
calc() { python -c "import math; print $*"; }

ccc() {
    local out="${TMPDIR:-/tmp}/c.$$" strict=1
    trap 'rm -f "$out"' RETURN

    [[ $1 = -l ]] && { strict=; shift; }

    local code=$(cat <<.
    #include <stdio.h>
    #include <sys/ioctl.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #if defined(__linux__)
    #include <linux/fs.h>
    #elif defined(__CYGWIN__)
    #include <cygwin/fs.h>
    #else
    #include <sys/disk.h>
    #endif
    #include <fcntl.h>
    #include <unistd.h>
    #include <math.h>

    void printb(char *p, size_t size) {
    for (int i = 0; i < size; ++i)
        printf("%02hhX ", p[i]);
        printf("\n");
    }

    int main(int argc, const char* argv[]) {
    $1;
    return 0;
}
.
)
shift

if ! gcc -std=gnu99 -x c -o "$out" ${strict:+-Werror} -Wall - <<< "$code"; then
    emit -r "Compilation failed:"
    cat -n <<< "$code"
    return 255
else
    chmod +x "$out" && "$out" "$@"
fi
}

downsize() {
    local from=$1 to=${2:-$1} size=${3:-50%}
    convert "$from" -filter box -resize "$size" -unsharp 1x1+1+0.4 "$to"
    pngstrip "$to"
}

#-------------------------------------------------------------
# A few fun ones
#-------------------------------------------------------------

# Adds some text in the terminal frame (if applicable).
function xtitle()
{
    case "$TERM" in
    xterm*|rxvt*)
        echo -en  "\e]0;$*\a" ;;
    *)  ;;
    esac
}

# Aliases that use xtitle
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'

# .. and functions
function man()
{
    for i ; do
        xtitle The $(basename $1|tr -d .[:digit:]) manual
        command man -a "$i"
    done
}

#-------------------------------------------------------------
# Make the following commands run in background automatically:
#-------------------------------------------------------------

function te()  # wrapper around xemacs/gnuserv
{
    if [ "$(gnuclient -batch -eval t 2>&-)" == "t" ]; then
       gnuclient -q "$@";
    else
       ( xemacs "$@" &);
    fi
}

function soffice() { command soffice "$@" & }

function firefox() { command firefox "$@" & }

function xpdf() { command xpdf "$@" & }

#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }

#  Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr()
{
    OPTIND=1
    local mycase=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
           i) mycase="-i " ;;
           *) echo "$usage"; return ;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more

}

function swap()
{ # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}

#-------------------------------------------------------------
# Process/system related functions:
#-------------------------------------------------------------

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }

function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

function killps()   # kill by process name
{
    local pid pname sig="-TERM"   # default signal
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi
    if [ $# = 2 ]; then sig=$1 ; fi
    for pid in $(my_ps| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} )
    do
        pname=$(my_ps | awk '$1~var { print $5 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig?"
            then kill $sig $pid
        fi
    done
}

function mydf()         # Pretty-print of 'df' output.
{                       # Inspired by 'dfc' utility.
    for fs ; do

        if [ ! -d $fs ]
        then
          echo -e $fs" :No such file or directory" ; continue
        fi

        local info=( $(command df -P $fs | awk 'END{ print $2,$3,$5 }') )
        local free=( $(command df -Pkh $fs | awk 'END{ print $4 }') )
        local nbstars=$(( 20 * ${info[1]} / ${info[0]} ))
        local out="["
        for ((j=0;j<20;j++)); do
            if [ ${j} -lt ${nbstars} ]; then
               out=$out"*"
            else
               out=$out"-"
            fi
        done
        out=${info[2]}" "$out"] ("$free" free on "$fs")"
        echo -e $out
    done
}


function my_ip() # Get IP adress on ethernet.
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

function ii()   # Get current host related info.
{
    echo -e "\nYou are logged on ${BRed}$HOST"
    echo -e "\n${BRed}Additionnal information:$NC " ; uname -a
    echo -e "\n${BRed}Users logged on:$NC " ; w -hs |
             cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Current date :$NC " ; date
    echo -e "\n${BRed}Machine stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
    echo -e "\n${BRed}Local IP Address :$NC" ; my_ip
    echo -e "\n${BRed}Open connections :$NC "; netstat -pan --inet;
    echo
}

#-------------------------------------------------------------
# Misc utilities:
#-------------------------------------------------------------

function repeat()       # Repeat n times command.
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}


function ask()          # See 'killps' for example of use.
{
    echo -n "$@" '[y/n] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}

function corename()   # Get name of app that created a corefile.
{
    for file ; do
        echo -n $file : ; gdb --core=$file --batch | head -1
    done
}
