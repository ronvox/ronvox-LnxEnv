"
"    (                 )           )
"    )(    (    (     /((   (   ( /(
"   (()\   )\   )\ ) (_))\  )\  )\())
"    ((_) ((_) _(_/( _)((_)((_)((_)\
"   | '_|/ _ \| ' \))\ V // _ \\ \ /
"   |_|  \___/|_||_|  \_/ \___//_\_\
"
# Ron Estrada
# site:   www.ronvox.com
# email:  ronoliva@gmail.com
# phone:  416.577.9150
# skype:  ronvox
# place:  Toronto, Ontario, Canada
# https://github.com/ronvox/ronvox-LnxEnv
# ===========================================
# Notes for vim settings on linux environment
#   clone the git repo in your computer, you can use any folder in your user account, example ~/Downloads directory
#   run this cmd:
#
#   $ cd ~/Downloads; git clone https://github.com/ronvox/ronvox-LnxEnv.git
#
#   you will have a folder <ronvox-LnxEnv> in ~/Downloads/ directory with all the content you need for this video
#   this content will be updated with changes or will have more files/folders for new videos.
#   I will give you detail instructions where to copy each file depending of the video.
#   Thanks.
#

LightLine:

vim mode (NORMAL, INSERT, REPLACE)
folder name
CAPS-LOCK indicator on/off (<Alt+l> when INSERT-Mode or <,l> when NORMAL-Mode)
file name
modified file indicator
file extension
--- middle space ---
character under the cursor
hex value
dec value
file type
encoding
porcentage of the file from beginning till current cursor position
syntax errors
current line and column number under the cursor
total number of lines in the file
-------------------------------------------------------------------------------

Highlighted Parts:

column 80 <always>
current line <only when in INSERT mode>
current column <only in INSERT mode>
line number in yellow
-------------------------------------------------------------------------------


NerdTree:

bookmarks first
list of files with icons and colors
-------------------------------------------------------------------------------


Miscellaneous:

line numbers in relative (<,rl> to toggle)
---
on the top bars:
 filename, modified sign, foldername
 tab number, number of files open on that tab, and tabname[filename or your own name]
on the botton bar:
 buffers numbers and file names
---
find the longest line:
:PPLL (will print the longest line at the top of the file)
find the middle of the current line:
:MOTCL (will jump to the middle of the cur.line)
---
color names display, e.g: white, red, yellow, green, blue, black
-------------------------------------------------------------------------------


Bookmarks:

DATA(E:) /media/ronvox/DATA
DATA(E:)GoogleDrive /media/ronvox/DATA/GoogleDrive/Documents
DOCS(D:) /media/ronvox/DOCS
wwwLab /media/ronvox/DATA/wwwLab
wwwLab-IntegriWebsite /media/ronvox/DATA/wwwLab/IntegriWebsite
/etc /etc
CraigLA /var/www/cla/html
lab /var/www/lab/html
lab-sql01-crud /var/www/lab/html/sql01
lab-sql02 /var/www/lab/html/sql02
lab-sql03 /var/www/lab/html/sql03
lab-sql04 /var/www/lab/html/sql04
lara /var/www/lara/html
phpsols /var/www/lab/html/phpsols
resume /var/www/resume/html
site00-nothing /var/www/site00/html
site01-oldcv /var/www/site01/html
site02-respon /var/www/site02/html
site03-phpoos /var/www/site03/html
site04-wtemplate /var/www/site04/html
site05-phpsols /var/www/site05/html
site06-wp /var/www/site06/html
test /var/www/test/html
www /var/www
NerdTree ~/.NERDTreeBookmarks
media /media/ronvox
root /
.bashrc ~/.bashrc
.vimrc ~/.spf13-vim-3/.vimrc
.vimrc.local ~/.vimrc.local
Documents ~/Documents
Downloads ~/Downloads
.logs ~/.logs
Home ~/
monthlylog ~/.logs/monthlylog.txt
-------------------------------------------------------------------------------


Clarification of some questions:
 I am using a debian base distro, linux mint
 my user account is the administrator of my system, I belong to the group of sudoers
 my filemanager is nemo
 I use chrome and firefox as a browsers
 my terminals are gnome, guake, and xfce
 I am using OBS screencast
 and finally my shell is BASH

step 0:------------------------------------------------------------------------
Install git and curl, and fontconfig:
 $ sudo apt install git
 $ sudo apt install curl
 $ sudo apt install fontconfig
 $ sudo apt update
 or
 $ sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoclean && sudo apt-get autoremove

if you did not download my config files yet, do it now, move to Downloads folder and run this cmd:
 $ git clone https://github.com/ronvox/ronvox-LnxEnv.git

remove and reinstall VIM for Linux Environments:
  We are going to compile the latest version of vim in our system.

remove any trace of Vim in the system:
  $ sudo apt-get remove --purge vim \
  vim-runtime \
  vim-gnome \
  vim-tiny \
  vim-common \
  vim-gui-common
 same in one line:
  $ sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common

 remove folders and files if any of this exist:
  $ rm -rf .vimviews .vimundo .vimswap .vimbackup .vim
  $ rm .vimrc (make a backup if you wish)
  $ sudo rm -rf /usr/local/share/vim
  $ sudo rm /usr/bin/vim

step 1:------------------------------------------------------------------------
create a directory ~/.vim/bundle
 $ mkdir -p ~/.vim/bundle

install bundle
 Bundle:
 $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

install vim-devicons
 Vim-Devicons:
 $ git clone https://github.com/ryanoasis/vim-devicons ~/.vim/bundle/vim-devicons

install lightline:
 $ cd ~/.vim/bundle/
 $ git clone https://github.com/taohexxx/lightline-solarized.git

step 2:------------------------------------------------------------------------
clone the solarized colorscheme and put it in /usr/share/vim/vim??/colors
 only the solarized.vim file
 $ git clone git://github.com/altercation/solarized.git

 $ cd ~/.vim/bundle
 $ git clone git://github.com/altercation/vim-colors-solarized.git

-------------------------------------------------------------------------------
THE NEXT STEP (Step 3) IS OPTIONAL BECAUSE I WILL GIVE YOU THE FONTS I USE IN MY SYSTEM

 you can find them under a folder name <fonts>
 so just copy them to:
  /usr/share/fonts/truetype/ronfonts/ (for everybody)
  or
  ~/.local/share/fonts/ronfonts/      (for your user account only)

 just create the directories as needed
  $ cd /usr/share/fonts/truetype/
  $ sudo mkdir ronfonts
  or
  $ cd ~/.local/share/fonts/
  $ mkdir ronfonts

 places we can find fonts:
  /usr/share/fonts/
  /usr/local/share/fonts/
  /home/usrname/.local/share/fonts/
  /home/usrname/.fonts/
  ---
  /var/cache/fontconfig/
  /home/usrname/.cache/fontconfig/
    the last two are the cached fonts.

 then run this cmd:
  $ sudo fc-cache -fv

step 3:------------------------------------------------------------------------
(optional) download nerd_fonts to any folder example ~/Downloads
  go to https://github.com/ryanoasis/nerd-fonts
  $ cd ~/Downloads
  $ git clone https://github.com/ryanoasis/nerd-fonts.git

  Font Installation
  Put any font you would like to use into the folder:
   ~/.local/share/fonts (Linux)
   ~/Library/Fonts/(OS X)

  For example:
  Linux:
  $ mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

  to install all fonts:

  Installs all of the patched Fonts (Warning: This is a lot of Fonts adding up to a large size)
  $ cd nerd-fonts/
  $ ./install.sh

  To install a single font:
  $ ./install.sh <FontName>
  $ ./install.sh Hack
  $ ./install.sh HeavyData

step 4:------------------------------------------------------------------------
install Vim dependencies:

 $ sudo apt-get install libatk1.0-dev \
 libbonoboui2-dev \
 libcairo2-dev \
 libgnome2-dev \
 libgnomeui-dev \
 libgtk2.0-dev \
 liblua5.1-dev \
 libluajit-5.1 \
 libncurses5-dev \
 libperl-dev \
 libx11-dev \
 libxpm-dev \
 libxt-dev \
 luajit \
 python-dev \
 ruby-dev
same in one line:
 $ sudo apt-get install libatk1.0-dev libbonoboui2-dev libcairo2-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev liblua5.1-dev libluajit-5.1 libncurses5-dev libperl-dev libx11-dev libxpm-dev libxt-dev luajit python-dev ruby-dev

 $ sudo apt-get install mercurial \
 libgtk2.0-dev \
 libncurses5 \
 libx11-dev \
 libxt-dev \
 ncurses-dev \
 python \
 python-dev \
 python3 \
 python3-dev \
 ruby \
 ruby-dev
same in one inline:
 $ sudo apt-get install mercurial python python-dev python3 python3-dev ruby ruby-dev libx11-dev libxt-dev libgtk2.0-dev libncurses5 ncurses-dev

#maybe not be necessary but check:
 $ sudo mkdir -p /usr/include/lua5.1/include
 $ sudo mv /usr/include/lua5.1/*.h /usr/include/lua5.1/include/
 $ sudo ln -s /usr/bin/luajit-2.0.0-beta9 /usr/bin/luajit

Check the $PATH in your system, at the time before the compilation I had:
echo $PATH
/usr/local/sbin
/usr/local/bin
/usr/sbin
/usr/bin
/sbin
/bin
/home/ronvox/bin
/home/ronvox/.composer/vendor/bin
/usr/lib/git-core

add the Vim repo and download a new version of it:
 $ sudo apt-add-repository ppa:pkg-vim/vim-daily
 $ sudo apt-get update

go home and download vim
 $ cd ~
 $ git clone https://github.com/vim/vim
  after adding this repo and finish the steps below I end up with a new version of vim:
  under the directory ~/vim

Start compiling Vim from the source software:
 $ cd ~/vim/src
 $ sudo make distclean

confifure this options, and Remember to change the date of compilation.

 $ sudo ./configure --with-features=huge \
--enable-multibyte \
--enable-rubyinterp=yes \
--enable-pythoninterp=yes \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
--enable-python3interp=yes \
--with-python-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu \
--enable-perlinterp=yes \
--enable-luainterp=yes \
--with-luajit \
--with-lua-prefix=/usr/include/lua5.1 \
--with-tlib=ncurses \
--enable-xim \
--enable-xsmp \
--enable-largefile \
--enable-fail-if-missing \
--enable-gui=auto \
--enable-gtk2-check \
--enable-gui=gtk2 \
--enable-cscope \
--prefix=/usr \
--with-x \
--with-compiledby="ronvox 2019.04.24.1040 <ronoliva@gmail.com>"
same in one inline:
 $ sudo ./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu --enable-python3interp=yes --with-python-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu --enable-perlinterp=yes --enable-luainterp=yes --with-luajit --with-lua-prefix=/usr/include/lua5.1 --with-tlib=ncurses --enable-xim --enable-xsmp --enable-largefile --enable-fail-if-missing --enable-gui=auto --enable-gtk2-check --enable-gui=gtk2 --enable-cscope --prefix=/usr --with-x --with-compiledby="ronvox 2019.04.24.1040 <ronoliva@gmail.com>"

options I removed because of my system configuration:
--enable-gui=gnome \

this options gave me, a WARNING: unreconized options:
--enable-termtruecolor \
--enable-python3 \
--enable-xfontset \
--enable-xterm_clipboard \
--enable-xterm_save \
--enable-xpm \
--enable-clipboard \
--enable-X11 \
--prefix=/usr \
--override-system-vi \

run make and make install,  I use this one:
 $ sudo make VIMRUNTIMEDIR=/usr/share/vim/vim81

these are old for older versions:
 $ sudo make VIMRUNTIMEDIR=/usr/share/vim/vim80
 $ sudo make VIMRUNTIMEDIR=/usr/share/vim/vim74

 $ sudo make install

how to check what version of vim is running in my system, and what options do I have to run:
we can check what is installed with this cmd:
 $ dpkg -l | grep vim

step 5:------------------------------------------------------------------------
install spf13-vim3:
 $ curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
  or if you have a bash-compatible shell run this: (yes we have it)
 $ sh <(curl https://j.mp/spf13-vim3 -L)

we will have now a new folder in our home user account with the name
 .spf13-vim-3

after that is time to restore the runcommand files, and others:
copy the spf13 files:
 $ cd ~/Downloads/ronvox-LnxEnv/home/spf13/
 $ cp .vimrc* ~/.spf13-vim-3/
  will ask you if you want to replace

copy the home/account files:
 $ cd ~/Downloads/ronvox-LnxEnv/home/
 $ cp .vimrc* ~
  will ask you if you want to replace

copy colors for all users in vim81:
 $ cd ~/Downloads/ronvox-LnxEnv/home/vim/colors/
 $ sudo cp * /usr/share/vim/vim81/colors

copy fonts for local user and all users:
local user:
 $ mkdir -p ~/.local/share/fonts/NerdFonts
 $ cd ~/Downloads/ronvox-LnxEnv/home/NerdFonts/
 $ cp * ~/.local/share/fonts/NerdFonts/

all users:
 $ cd ~/Downloads/ronvox-LnxEnv/usr-share-fonts-ronvox/
 $ sudo cp * /usr/share/fonts/truetype/ronfonts

finally update the fonts in the system:
 $ sudo fc-cache -fv

run this cmd to update all the changes:
 $ vim +BundleInstall! +BundleClean +q

exit or quit vim, and enter again:
 $ vim
 $ gvim
  or use the home button and type vim <enter>
  select gvim
-------------------------------------------------------------------------------

done






EOF
