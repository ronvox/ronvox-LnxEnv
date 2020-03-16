" vim: set tw=0 wm=0 sw=2 ts=2 sts=2 et foldmarker={{{,}}} foldlevel=0 foldmethod=marker nospell:
"
"                      WELCOME
"                .vimrc-lnx-desktops
"
" (                 )           )                )
" )(    (    (     /((   (   ( /(     (   (     (
"(()\   )\   )\ ) (_))\  )\  )\())    )\  )\    )\  '
" ((_) ((_) _(_/( _)((_)((_)((_)\    ((_)((_) _((_))
"| '_|/ _ \| ' \))\ V // _ \\ \ / _ / _|/ _ \| '  \()
"|_|  \___/|_||_|  \_/ \___//_\_\(_)\__|\___/|_|_|_|
"=========================~==========================
"
"        VIM Skurer Effektivt Men Riper Ikke.
"      VIM clean effectively but scratches not.
"
"---------- Statusline {{{

if has('cmdline_info')
  set ruler                                          " Show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
  set showcmd                                        " Show partial commands in status line and
endif
" :h mode() to see all modes
let g:currentmode={
    \ 'n'      : 'NORMAL ',
    \ 'no'     : 'N·Operator Pending ',
    \ 'v'      : 'VISUAL ',
    \ 'V'      : 'V·Line ',
    \ ''     : 'V·Block ',
    \ 's'      : 'Select ',
    \ 'S'      : 'S·Line ',
    \ '\<C-S>' : 'S·Block ',
    \ 'i'      : 'INSERT ',
    \ 'R'      : 'REPLACE ',
    \ 'Rv'     : 'V·Replace ',
    \ 'c'      : 'Command ',
    \ 'cv'     : 'Vim Ex ',
    \ 'ce'     : 'Ex ',
    \ 'r'      : 'Prompt ',
    \ 'rm'     : 'More ',
    \ 'r?'     : 'Confirm ',
    \ '!'      : 'Shell ',
    \ 't'      : 'Terminal '
    \}

if has('statusline')
  "LEFT
  set statusline=
  set statusline+=%{ChangeStatuslineColor()}                                                          "changing the statusline color
  set statusline+=%0*\%{toupper(g:currentmode[mode()])}\                                              "(1space)+mode with color using %0+(1space)
  set statusline+=%1*\                                                                                "User1 RED+(1space)
  set statusline+=:%-3.3n\                                                                            "buffer+(1space)
  set statusline+=%3*                                                                                 "User3 RED ALERT
  set statusline+=%M                                                                                  "modified+
  set statusline+=%{&bomb?'[BOM]':''}                                                                 "BOM
  set statusline+=%{SyntasticStatuslineFlag()}                                                        "syntastic errors
  set statusline+=%5*                                                                                 "User5 GREEN
  set statusline+=D:\%05.5b\ U\+%04B\                                                                 "decimal, unicode+(1space)
  set statusline+=%4*                                                                                 "user4 BLUE
  set statusline+=%{&spelllang}\                                                                      "spelling-language+(1space)
  set statusline+=%{HighlightSearch()}\                                                               "hightlight-search+(1space)
  set statusline+=[%{strlen(&ff)?&ff:'none'},%{strlen(&ft)?&ft:'none'},%{strlen(&fenc)?&fenc:&enc}]\  "fileformat,filetype,encoding+(1space)
  set statusline+=%{&fileformat}\                                                                     "fileformat+(1space)
  set statusline+=%6*                                                                                 "User6 WHITE
  set statusline+=%-3(%{FileSize()}%)                                                                 "file size
  set statusline+=%7*                                                                                 "User6 GREY
  "RIGHT
  set statusline+=%=                                                                                  "RIGHT SIDE FROM NOW ON
  set statusline+=%{getcwd()}\/\                                                                        "current dir
  set statusline+=%3*                                                                                 "User1 RED
  set statusline+=%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}                          "readonly[RO]+(1space)+capslock[CAPS]
  set statusline+=%m                                                                                  "modified[+]
  set statusline+=%2*                                                                                 "User2 YELLOW
  "set statusline+=%{GitInfo()}                                                                       "git branch with plugin
  set statusline+=%{b:gitbranch}                                                                      "git branch without plugin
  set statusline+=%-10.40f\                                                                           "filename+(1space)
  set statusline+=%6*                                                                                 "User6 WHITE
  set statusline+=%-5l                                                                                "current line number
  set statusline+=%4*                                                                                 "User4 BLUE
  set statusline+=\|                                                                                  "show separator "|"
  set statusline+=%6*                                                                                 "User6 WHITE
  set statusline+=%5L\                                                                                "total lines+(1space)
  set statusline+=%04c\                                                                               "current column number+(1space)
  set statusline+=%5*                                                                                 "User5 GREEN
  set statusline+=%3p%%\                                                                              "porcentage+(1space)
  set statusline+=%0*\ Time:\ %{strftime(\"%H:%M:%S\")}\                                              "time H:M:S+(1space)
endif

"---------- Statusline }}}
"---------- Autocmds {{{

"status line gitbranch
augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

"---------- Autocmds }}}
"---------- HighLights {{{

" statusline colors
highlight User1 ctermbg=234 ctermfg=009 guibg=#004a5d guifg=red        "buffer,time red"
highlight User2 ctermbg=234 ctermfg=011 guibg=#004a5d guifg=yellow     "filename yellow"
highlight User3 ctermbg=001 ctermfg=015 guibg=red guifg=white          "alertRED"
highlight User4 ctermbg=234 ctermfg=004 guibg=#004a5d guifg=#3366ff    "encoding normalwhite"
highlight User5 ctermbg=234 ctermfg=002 guibg=#004a5d guifg=green      "decimal green"
highlight User6 ctermbg=234 ctermfg=015 guibg=#004a5d guifg=white      "linenumber white"
highlight User7 ctermbg=234 ctermfg=008 guibg=#004a5d guifg=grey       "linenumber white"

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
"highlight clear CursorLineNr    " Remove highlight color from current line number
"highlight clear LineNrlet

" I ♥ colors, change colors for the popup menu
highlight Pmenu guibg=#112125 guifg=#444444
highlight PmenuSel guifg=#004a5d guibg=#FFFFFF
highlight Pmenu ctermbg=195 ctermfg=000 cterm=standout

" fix conceal color
"highlight Conceal guifg=#ffb964 guibg=#151515
highlight Conceal guifg=yellow guibg=#002b36 gui=bold
highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

"highlight ExtraWhitespace
highlight link ExtraWhitespace SpellCap
highlight ExtraWhitespace guibg=#444444 guifg=#999999 gui=undercurl ctermbg=NONE ctermfg=237 cterm=undercurl
"highlight ExtraWhitespace guibg=#073642 guifg=#dc322f gui=undercurl ctermbg=NONE ctermfg=237 cterm=undercurl

" Default matching parent highlight is too visible, this is a more discrete highlight.
highlight MatchParen guibg=white guifg=NONE gui=reverse ctermbg=black ctermfg=white cterm=reverse
highlight SpellBad term=underline gui=undercurl guisp=Orange

" Highlight VCS Version Control System conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"highlight Cursor gui=reverse guifg=NONE guibg=NONE
"highlight Cursor gui=NONE guifg=bg guibg=fg

" IndentGuides
"highlight IndentGuidesOdd  ctermbg=black
"highlight IndentGuidesEven ctermbg=darkgrey

"---------- HighLights }}}
"---------- Functions {{{
" statusline {{{

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'highlight! StatusLine ctermfg=022 ctermbg=231 guifg=#586e75 guibg=#fdf6e3'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'highlight! StatusLine ctermfg=165 ctermbg=231 guifg=#d33682 guibg=#fdf6e3'
  elseif (mode() ==# 'i')
    exe 'highlight! StatusLine ctermfg=130 ctermbg=231 guifg=#b58900 guibg=#fdf6e3'
  elseif (mode() ==# 'R')
    exe 'highlight! StatusLine ctermfg=001 ctermbg=231 guifg=#cb4b16 guibg=#fdf6e3'
  elseif (mode() ==# 'c')
    exe 'highlight! StatusLine ctermfg=208 ctermbg=231 guifg=#b58900 guibg=#fdf6e3'
  else
    exe 'highlight! StatusLine ctermfg=190 ctermbg=000 guifg=#859900 guibg=#fdf6e3'
  endif
  return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif
  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    lcd %:p:h
    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
    lcd -
    if l:gitrevparse!~"fatal: not a git repository"
      let b:gitbranch=" ".substitute(l:gitrevparse, '\n', '', 'g')." "
    endif
  endif
endfunction

" statusline }}}
"---------- Functions }}}
"---------- Help {{{
""""""" abbreviations {{{
"
" :ab teh the
" :ab #d #define
" :ab #i #include
" :ab cmain main(argc,argv)^Mint argc;^Mchar **argv;^M{^M}^[O
" :ab cmmap mmap(NULL,st.st_size,PROT_READ,MAP_SHARED,fd,0);
" :ab readsig ^[G:r ~/misc/sig^M
"
""""""" abbreviations }}}
""""""" compare files {{{
" open both files in a vertical split
"
" using NERDTree:
"  open NERDTree with ",nt" if you have my .vimrc
"  put the cursor in the first file and press "go" to open in a preview
"  put the cursor in the second file and press "s" to open in a vertical split
"
" using Netrw:
"  open with ":Ex"
"  select first file and press "v" to open it on a vertical panel
"  go back to Netrw with "Ctrl-h"
"  select second file and press "v" again and you will have two files in a vertical split plus Netrw in another split
"  go back to Netrw "Ctrl-h" and ":bd" to close the buffer with Netrw in it
"
"  now you have the two files in a vertical split, you can run the following command or if you have my .vimrc you can press ",dt" that is the shortcut to ":windo diffthis"
"       :windo diffthis   'to start the comparition'
"       ]c or [c          'to junp into differences'
"       :diffget          'to get the diff' or just press "do"
"       :diffput          'to put the diff' or just press "dp"
"       :windo diffoff    'to stop the comparition' or press ",D" if you have my .vimrc that is my shortcut
"
" or use the cmd in Terminal
"       $ vimdiff file1 file2
""""""" compare files }}}
""""""" converting files {{{
"    DOS     every line ends in CR LF
"    UNIX    every line ends in LF only
"    Convert a bunch of files Unix and Dos mix
"    dos/unix to UNIX
"        :args *.c *.h               " specify the files
"        :argdo set ff=unix|update   "for each arg, set unix ff and update
"        :bufdo! set ff=unix|w       "only all the open buffers
"
"    Convert Unix to Dos
"    in vimrc.local we have set
"        set ffs=unix,dos    " in a linux system
"        set ffs=dos,unix    " in a windows system
"    to convert a file use:
"        :e ++ff=unix
"        :update
"        :set local ff=unix
"        :w
"
"    Convert mixed files
"    dos/unix to UNIX
"        :set hidden         " allow modify buffers
"        :set ffs=dos
"        :args *.c *.h
"        :argdo set ff=unix|w
"    dos/unix to DOS
"        :set ffs=dos
"        :args *.c *.h
"        :argdo w
""""""" converting files }}}
""""""" copy/move/del lines {{{
"
" :g/pattern/d  --> del all lines matching a pattern
" :g!/pattern/d --> del all lines that dont match a pattern
" :v/pattern/d  --> same as prev
" :g/pattern/t$ --> copy lines to EOF
" :10,15t$      --> copy lines 10 to 15 to EOF
" :g/pattern/t0 --> copy lines to BOF
" :10,15t0      --> copy lines 10 to 15 to BOF
" :g/pattern/m$ --> move lines to EOF
"
" :qaq:g/pattern/y A --> copy lines matching pattern to register 'a'
" "ap                --> paste register 'a'
"
" :g/www.youtube.com/z#.5|echo "<<<==========>>>"  --> display context for all occurrences of a pattern
" :g/www.youtube.com/z#.5|echo "<<<==========>>>" | redir >> youtube.txt
"
" :g/^/m0                               --> reverse a file
" :g/^pattern/s/$/mytext                --> add mytext to the end of a line that begins with a certain pattern
" :'a,'bg/pattern/s/pattern2/string/gi  --> in a range of lines that contains the pattern find pattern2 and replace it with string
"
" :v/^[^ \t]\+$/,/^[^ \t]\+$/-j  --> merges truly empty lines. if any contain spaces and/or tabs they will not be collapsed.
" :%s/^[ \t]\+$//g               --> clean lines that contains spaces and/or tabs
" :g/pattern/normal @q           --> run a macro 'q' on matching lines
"
" :g/^\(.*\)\(\r\?\n\1\)\+$/d    --> delete duplicate lines from a file
" :%!uniq
" :v/./,/./-j                    --> compress multiple occurrences of blank lines into a single blank line
"
""""""" copy/move/del lines }}}
""""""" ctrlspace {{{
"   0. we open a set of files using :e or NertTree. All of them will be in one tab
"   1. or we use "TAB" to enter cmd mode of CtrlSpace and press "E" to display NerdTree, them press "t,T,o" to open a file and "q" to quit
"       t new tab
"       T new tab silenctly
"       o same window
"       q quit NerdTree
"   2. we can press l=tablist h=filelist o=bufflist b=bookmarks
"   3. we are back to cmd CtrlSpace we can use "h,l,o,b"
"   4. we can select the file from the list and press "> or <" to open that file in a new "TAB"
"   5. so we press "l" to display the tablist
"   6. we press "=" to change the name of the "TAB"
"   7. we do the same for the other tabs, then we we have all the names we want we press "h"
"   8. we can press "f,c,d" to forget, close or delete file from the list.
"   9. we can use "w,W" to open a workspace

"   a. :CtrlSpaceSaveWorkspace wsname
"   b. :CtrlSpaceLoadWorkspace wsname
"   c. :CtrlSpaceNewWorkspace
"
"   "b/B" Bookmark List
"     "a" to add a bookmark
"     "e" to edit the target dir
"     "=" renamed it
"
"   "o/O" Buffer List
"     "i" jumping to a dir of given buff
"     "I" jumping back
"
""""""" ctrlspace }}}
""""""" Easymotion {{{
"
" ,,w     find beginnng of line to the right
" ,,s     find a character in the file
" zz      put line in center
" z.      same
" zt      top
" zb      bottom
"
" ,,b        "beginning of the word to the left
" ,,E        "end of the word left
" ,,e        "end of the word right
" ,,F{char}  "find char to the left <-
" ,,f{char}  "find char to the right ->
" ,,w        "beginning of the word to the right
" ,,s        "search for a character in the file"
"
" " go to the column number
" {n}|    go to column n
" 44|
"
" " advance n lines
" {n}_    advance n lines
" 10_
"
""""""" Easymotion }}}
""""""" F[#] {{{
"
" Programming Functions
"   <F2=navigateMarks>
"   <F3=spell toggle>
"   <F4=xfce4-terminal> Linux Only
"   <F5=delTrailingspace>
"   <F7=reformatFile>
"   <F8=quickmenu toggle>
"   <F9=insertDate>
"   <F11=fullscreen toggle>
"   <F12=guake-terminal> Linux Only
"
"   <F6=available>
"
""""""" F[#] }}}
""""""" getting the ascii / hex code of the character under the cursor {{{
" let dec = char2nr(matchstr(getline('.'), '\%' . col('.') . 'c.'))
""""""" getting the ascii / hex code of the character under the cursor }}}
""""""" history {{{
"    q/      "search hist window (exit CTRL-C)
"    q:      "commandline history window (exit CTRL-C)
"    :<C-F>  "history window (exit CTRL-C)
"    :his        "disp history cmds
"    :his c      "commandline history
"    :his s      "search history
"
" :his / 6,12
" :his all -5,
"
""""""" history }}}
""""""" key-notation {{{
"notation        meaning
"-----------|--------------------------------
"...
"<S-...>         shift-key
"<C-...>         control-key
"<M-...>         alt-key or meta-key
"<A-...>         alt-key same as <M-...>
"<D-...>         command-key (Macintosh only)
""""""" key-notation }}}
""""""" multiple_cursors {{{
" Vim Multiple Cursors
" Ctrl-N - start and select word under cursor for multicursor
"   Ctrl-N  - for next
"   Ctrl-X  - to skip
"   Ctrl-P  - remove current virtual cursor and go back to previous
"   Ctrl-Alt-A   - start multicursor and select all matches
"
"  c - change text
"  s - change
"  I - insert at start of a range
"  A - insert at end of a range
"  v - to use normal mode cmds
""""""" multiple_cursors }}}
""""""" NERDCommenter {{{
 " ,c spc "toggles comm. If top lines are comm, then uncomment all and viseversa
 " ,cu    "uncomment selected lines
 " ,c$    "comment from cursor to the end of line
 " ,ca    "switches delimeters
 " ,cc    "comment lines, also used with visual selection
 " ,cy    "same as ,cc but yank first
 " ,cn    "same as prev. but forces nesting
 " ,cm    "comment nice
 " ,cs    "same as ,cm but nicer
"
" most used:
 " ,cA       "commenting inline, adds a comment-delimeter at the end of the line, and go to insert mode
 " ,ci       "toggles commenter state individualy
 " ,cs|,cm   "comment nice or nicer
""""""" NERDCommenter }}}
""""""" Netrw {{{
" :bd or :bw   buffer delete to exit
"
" :Ex     "open Netrw filemanager
" :bd     "close Netrw
" s       "sort
" x       "special
" D       "delete file
" R       "rename file to move a file you have to create a directory and when renaming insert the dir
" %       "create a file
" d       "create a directory
" v       "on a file opens it in a vertical buffer
"
" copy files in Netrw:
" mf    toggle whether the files/dirs is/are marked
" mF    unmark files
" mu    unmark all marked items
" mt    mark the directory under the cursor as the target directory
" mc    exec the copy operation of the files/dirs marked
" mm    move marked files/dirs to target directory
"
" md    apply diff to marked files (up to 3)
" me    place marked files on arg list and edit them
" mg    apply vimgrep to marked files
" mp    print marked files
" mr    mark files using a shell-style (regexp)
" mz    compress/decompress marked files
"
" qf    display info of the file
" x     view the file with an associated program
" X     execute file under the cursor via (system)
"
" mb    bookmark current directory
" qb    list bookmarked directories and history
"
" <c-l> refresh directory
" p     preview the file
"
" check this settings for Netrw:
" let g:netrw_banner=0
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
" autocmd FileType netrw set nolist
"
" :e.     "show the file.sys.
" :E      "open fileexp of dire of the last file
" :sp.    "open a file in a hor.split
" :vsp.
" :Sex | :Vex
" %       "create a new file in a buffer
" d       "create a new dir
" Shift-R "to move a file
" Shift-D "to delete a file
"
""""""" Netrw }}}
""""""" Objects {{{
"
"
""""""" Objects }}}
""""""" Others {{{
" just view duplicates
"       /^\(.*\)\(\r\?\n\1\)\+$
"
" compress multiple occurrence of blank lines into a single blank line
"       :v/./,/./-j
"
" reverse a file
"           :g/^/m0
"
" maps <F5> to append a TAB and the local time to the curr line
"           nnoremap <F5> m'A<C-R>="\t".strftime('%Y-%m-%d %H:%M')<CR><Esc>``
"
" counting words in a file
"       :! wc %
"
" show or delete marks or clear marks
"       :marks
"       :delm!
""""""" Others }}}
""""""" read only file {{{
"       :w !sudo tee %
"       :w !sudo tee % > /dev/null
" asigned to a cmd
"       :w!!
"       :Sudo
" for when forgot to use sudo vim
"cmap w!! %!sudo tee > /dev/null %
"cnoremap w!! %!sudo tee > /dev/null %
"command! Sudo :execute ':silent w !sudo tee % > /dev/null' | :edit!
""""""" read only file }}}
""""""" remove/replace copy {{{
" remove tabs, spaces
"    :%s/{TAB}*$//               - strips blanks at end of line
"    :%s/ *$/                    - del blank spaces at the end of the line, we can use tab to remove tabs
"    :%s/^ */                    - del blank spaces at the beginning of the line
"
" remove any empty line or lines with only whitespace:
"           :g/^\s*$/d
"
" remove all lines that start with double quotes or spaces and double quotes '"'
"           :g/^\s*"/d
"
" remove all lines except those that start with double quotes or spaces and double quotes '"'
"           :g!/^\s*"/d  or  :v/^\s*"/d
"
" remove all lines that start with pound or number symbol or spaces and number symbol '#'
"           :g/^\s*#/d
"           :g/^\s*#/p  --> just print
"
" replace in a visual range, all the TAB's with spaces
"           :'<,'>s/^I/    /
"           :'<,'>!expand -t4            --> expand
"           :s/{ctrl-v}[TAB]/[TAB][TAB]/ --> if we have one tab we change it for two tabs
"           :'<,'>s/^I/^I^I^I/           --> replace a TAB with three TAB's
""""""" remove/replace copy }}}
""""""" save command history in a vim register {{{
"    :redir @a>
"        :history : -5,
"    :redir END
"then paste with
"    "ap
""""""" save command history in a vim register }}}
""""""" search/replace/delete {{{
"Delete HTML tags, leave text (non-greedy):
"  :%s#<[^>]\+>##g
"
"Delete HTML tags possible multi-line (non-greedy):
"  :%s#<\_.\{-1,}>##g
"
"Delete possibly multi-line comments
"  :%s/<!--\_.\{-}-->//
"
"Insert something at the BOL or EOL like <li> </li>:
"removing trailing space:
"  '<,'>s/\s*$/\<\/li\>/g
"leave trailing space:
"  '<,'>s/^/\<li\>/g
"  '<,'>s/$/\<\/li\>/g
"
""""""" search/replace/delete }}}
""""""" set statusline {{{
"if has('statusline')
  "set laststatus=2
  " Sample1
    " no color:
    "set statusline=%-3.3n\ %<%F%h%m%r%w\ \ \ \ \ %{strlen(&ft)?&ft:'none'}%=[%{strlen(&ft)?&ft:'none'},%{strlen(&fenc)?&fenc:&enc},%{&fileformat}]\ \ ⭡:\ %7l/%L\ %4v\ \ \ [Dec=\%03.3b]\ [Hx=\%02.2B]\ [U\+%04B]
    " with color:
    "-->set statusline=%1*%-3.3n\ %4*%<%f%*%6*%h%m%r%w%1*\ \ \ \ \ %7*%{strlen(&ft)?&ft:'none'}%1*%=%*%3*\ [%5*%{strlen(&ft)?&ft:'none'},%{strlen(&fenc)?&fenc:&enc},%{&fileformat}%3*]\ \ %1*⭡:\ %7l%*%2*/%L%*%1*\ %4v\ \ \ %*%2*[Dec=\%03.3b]\ [Hx=\%02.2B]\ [U\+%04B]\ %*
    "set statusline=%1*%-3.3n\ %4*%<%f%*%6*%h%m%r%w%1*\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P \ \ \ \ %7*%{strlen(&ft)?&ft:'none'}%1*%=%*%3*\ [%5*%{strlen(&ft)?&ft:'none'},%{strlen(&fenc)?&fenc:&enc},%{&fileformat}%3*]\ \ %1*⭡:\ %7l%*%2*/%L%*%1*\ %4v\ \ \ %*%2*[Dec=\%03.3b]\ [Hx=\%02.2B]\ [U\+%04B]\ %*
"endif
""""""" set statusline }}}
""""""" set cmdline_info {{{
"if has('cmdline_info')
  "set ruler                                          " Show the ruler
  "set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
  "set showcmd                                        " Show partial commands in status line and
  " Selected characters/lines in visual mode
"endif
""""""" set cmdline_info }}}
""""""" colors {{{
" solarized
" #004a5d
" #112125
" #002b36 //Base03
" #073642 //Base02
" #586e75 //Base01
" #657b83 //Base00
" #839496 //Base0
" #93a1a1 //Base1
" #eee8d5 //Base2
" #fdf6e3 //Base3
"
" #b58900 //yellow
" #cb4b16 //orange
" #dc322f //red
" #d33682 //magenta
" #6c71c4 //violet
" #268bd2 //blue
" #2aa198 //cyan
" #859900 //green
" solarized
" highlight User1 guifg = #ffffff guibg = #dc322f
""""""" colors }}}
""""""" Sort {{{
" sort line 4 to 7
"       :4,7! sort -u
"
" or line 4 through end of file:
"       :4,$! sort -u
"
" and when a visual selection is active, that will automatically be the range used:
"       :! sort -u
""""""" Sort }}}
""""""" spelling and syntax correction {{{
" toggle spelling"
"       :set spell! or <F3>
"       ]s -->  'find next spell error"
"       [s <--  'find prev spell error
"       z=      'using dictionary to find right or correct spell"
"       zg      'add to dictionary"
"       zw      'add to dictionary wrong"
"       zuw     'remove dic/wrong"
"       zug     'remove dic"
"       :runtime spell/cleanadd.vim         'to clean the dictionary"
""""""" spelling and syntax correction  }}}
""""""" Surround {{{
"
" Basics:
 " cs {                        "change sorrounds
 " cst {                       "change sorrounds
 " ds and ", ', `              "delete sorroundings
 " ds (, ), {, }, [, ], <, >   "delete sorroundings
 " ds t                        "delete sorroundings for the innermost tag <div>something</div> something
 " Vs <p>                      "change sorrounds
" --------------------------------------------------------------------------------
"
" to surround a visual selection with <ul> do:
" select a Block w/visualsel
" press:
  " shift s<ul>
"
" to surround a line with <li> tag do:
  " yss<li>
" after that do a visual selection and press "." all the lines will be with <li> html tags.
" --------------------------------------------------------------------------------
"
" change surrounds:
"
" "Hello World!"
" with the cursor anywhere press:
  " cs"'    will change to 'Hello World!'
  " cs"<q>  will replace the double quotes to <q>Hello World!</q>
"
" Hello World!
" with the cursor anywhere under a word:
  " ysiw]   will change [Hello]
  " ysiw[   will change [ Hello ] leaving spaces
  " csw"    will change surr to double quotes "Hello"
  " cst"    will bring it back to prev
"
" [Hello World!]
" with the cursor anywhere:
  " yssb    will change the whole line with () i.e., ([Hello World!])
" revert to original text:
  " ds[ds) will bring it back to Hello World!
"
  " yss]   will change to [[Hello World!]]
" revert to original text:
  " ds[ds] will bring it back to Hello World!
"
" Hello World!
" lets try visual mode:
" press capital V followed by S<p> will change it to:
" <p>
" Hello World!
" </p>
"
" the "." command will work with ds, cs, and yss if you install repeat.vim
" -------------------------------------------------------------------------------
"
" to select the whole word under the cursor, and doesn't matter where the cursor is:
 " viw y  select the word and yank
 " yiw    yank
 " p/P    paste
"
" this is (another example) using parentheses.
" when cursor anywhere inside the parentheses
  " vi(   will select everything inside the parentheses
  " va(   will select everything icluding the parentheses
" this also works with quotation marks e.g., vi" or vi'
" we can also delete
  " di(   to delete
  " yi(   to yank
" -------------------------------------------------------------------------------
"
" Normal mode
" -----------
" ds  - delete a surrounding
" cs  - change a surrounding
" ys  - add a surrounding
" yS  - add a surrounding and place the surrounded text on a new line + indent it
" yss - add a surrounding to the whole line
" ySs - add a surrounding to the whole line, place it on a new line + indent it
" ySS - same as ySs
"
" Visual mode
" -----------
" s   - in visual mode, add a surrounding
" S   - in visual mode, add a surrounding but place text on new line + indent it
"
" Insert mode
" -----------
" <CTRL-s> - in insert mode, add a surrounding
" <CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
" <CTRL-g>s - same as <CTRL-s>
" <CTRL-g>S - same as <CTRL-s><CTRL-s>
" ===========================================
"
" 'Hello W|orld'    ds'        Hello World
" (12|3+4*56)/2     ds(        123+4*56/2
" <div>fo|o</div>   dst        foo
" --------------------------------------------
" "Hello |world!"   cs"'       'Hello world!'
" "Hello |world!"   cs"<q>     <q>Hello world!</q>
" (123+4|56)/2      cs)]       [123+456]/2
" (123+4|56)/2      cs)[       [ 123+456 ]/2
" <div>foo|</div>   cst<p>     <p>foo</p>
" fo|o!             csw'       'foo'!
" fo|o!             csW'       'foo!'
" ----------------------------------------------
" Hello w|orld!     ysiw)        Hello (world)!
" Hello w|orld!     csw)         Hello (world)!
" fo|o              ysiwt<html>  <html>foo</html>
" foo quu|x baz     yss"         "foo quux baz"
" foo quu|x baz     ySS"         "
                                   " foo quux baz
                               " "
" ---------------------------------------------------
" <CTRL-s>"                ""
" <CTRL-s><CTRL-s><html>   <html>
                             " |
                         " </html>
" --------------------------------------
"
""""""" Surround }}}
""""""" Tabularize {{{
"     :'<,'>Tabularize /:\zs
"       tells tab to use the char after the symbol indicated in the tabularize
"       aligment, in this case after ":", in some cases will be a <space>.
" other examples:
"     :'<,'>Tabularize /\t            ---> for a list with TAB's
"     :'<,'>Tabularize /\S\+;         ---> 1 or many non whitespaces, also followed by a semicolon
"     :'<,'>Tabularize /[a-z]*,/l0l1  ---> any string in lowercase with a comma
"     :"<,'>Tabularize /=/l0r1        ---> left align with 0 space in the left and 1 space in the right padding
"     :"<,'>Tabularize /=/r1c1l0      ---> put the delimeter in the middle
" leader plus cmd
"     ,a&    "tabularize
"     ,a,    "tabularize
"     ,a:    "tabularize
"     ,a::   "tabularize atom
"     ,a|    "tabularize
"     ,a=    "tabularize
""""""" Tabularize }}}
""""""" troubleshooting .vimrc {{{
" load vim without any config file, to debut your .vimrc
"   $ vim -u NONE -U NONE -N -i NONE
"         -u NONE = no .vimrc
"         -U NONE = no .gvimrc
"         -i NONE = not reading the .viminfo file
" "         -N = nocompatible mode
"   $ vim -u NONE -U NONE -N
"
" hot to open another .vimrc
"   $ vim -u ~/.vimrc --noplugin -N -i NONE
"
" the last resource is to use the cmd :finish
"   :finish in the middle of the .vimrc file and open to see
"   :finish cmd to another part and keep going
"
" how to reset the options
"     :set option-name&
"     :set option-name&vi
"     :set option-name&vim
" either of this will work depending of your settings.
" or to set all the options to its default value use:
"     :set all&
"     :set all&vi
""""""" troubleshooting .vimrc }}}
""""""" vim help navigation {{{
" possition curson under the subject and press
"        Ctrl-]
"    to go back press
"        Ctrl-t or Ctrl-o
""""""" vim help navigation }}}
""""""" write/append/insert/add lines {{{
" write/append lines to external file
"           :1,10w otherfile.txt | 1,5w >> otherfile.txt
"
" add Error to each line selected
"           :'a,'b s!^!Error !
"           :%s!^!Error!  or  '<,'> s/^/Error/
"           vmap \c :s!^!//!<CR>
"           vmap \u :s!^//!!<CR>
"
" list in a windows the search result
"       :vimgrep /Error/ %
"       :cope
"       :vimgrepadd /otherpattern/ %
"
" insert the execution of a cmd in vim
"           :r!<cmd>
" include the list of files of a dir
"       :r !ls -l /home/ronvox/Downloads
"
" in linux and vim will find all files that were mod in the last 8 days
"           :R find -mtime -8 | xargs grep vim
"
" using a text-mode browser "w3m" grab all the text of a web page
"       :r ! w3m http://en.wikipedia.org/wiki/Vi -dump
"
" add mytext to the end of the line that matches the pattern
"       :g/^pattern/s/$/mytext
""""""" write/append/insert/add lines }}}
""""""" 000 {{{
"
"
""""""" 000 }}}
"---------- Help }}}
