" global options
:syntax on
:set ruler
:set expandtab
:set shiftwidth=2
:set autoindent
:set scrolloff=5
:set foldmethod=indent
:set backspace=indent,eol,start
":set textwidth=80
":set wrapmargin=0
:set nowrap
:set nojoinspaces
:set mouse=v
:set viminfo='20,<500,/20,:20,h
:set encoding=utf-8
:set fileencodings=utf-8,latin1,ucs-bom,default
":set encoding=latin1
":set fileencodings=latin1
:filetype plugin indent on
":filetype plugin off
:set vb t_vb=

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

" I save too often for swap files to be of any use ;)
:set noswapfile

" load the proper key set
":ruby VIM::command "source ~/.#{ENV['TERM']}keys"
source ~/.rxvtkeys

" move around more naturally
:map <C-Up> <C-Y>
:map <C-Down> <C-E>
:map <C-Right> w
:map <C-Left> b
:imap <C-Up> <Esc><Right><C-Y>i
:imap <C-Down> <Esc><Right><C-E>i
:imap <C-Right> lwi
:imap <C-Left> bi

" always home to the first word instead of the first column
:map <Home> ^
:imap <Home> ^i
:map [H ^
:imap [H ^

" force vim to keep my alignment spaces in otherwise empty lines
:inoremap <Enter> <Enter><Space><Backspace>
" for documents written by others, the following will find the empty lines
:map [0 /^$

" the above destroyed the indenter's ability to unindent closing braces.
" I take this opportunity to teach it to (un)indent other parentheses!
:inoremap } <C-M>}
:inoremap ) <C-M>}m'%r(``r)A
:inoremap ] <C-M>}m'%r[``r]A
:inoremap > <C-M>}m'%r<``r>A

" when a single-line comment becomes too long, this changes it into a
" multi-line comment
:map c<Up> <Home>/\/<Right>r*2<Left>xd$Op:nohA
" this one requires smart o and O, which don't kill the line's indent
:noremap o o<Space><Backspace>
:noremap O O<Space><Backspace>
" which makes it an ideal time to create insert-time O
:imap <C-O> O

" shortcut for :set paste/nopaste
:set pastetoggle=<F11>
" <Ctrl-Insert>
:vmap [2^ :!copy
:map <Insert> OV:!paste

" mistakes a make too often
:map K J
:imap <Tab> <C-N>

" reformat a paragraph easily
:map <C-P> gqap

" select the pasted text so I can retab it (autoretab anyone?)
":noremap p gpkV'.
":noremap P gPkV'.
" aha! autoretab is [p

" diff commands
:map <C-D><C-D> :diffupdate
:map <C-D>u :diffupdate
:map <C-D><Home> :diffget<C-D>u
:map <C-D><End> :diffput<C-D>u
:map <C-D>1 :diffget<C-D>u
:map <C-D>2 :diffput<C-D>u

" close folds easily
:map <S-C-Left> zc

" vimspell shortcuts
":com FR SpellSetLanguage francais
":com EN SpellSetLanguage english
":com Spell SpellCheck
:map  :!english? 
:imap  :!english? 
:map  :!french? 
:imap  :!french? 

" shortcuts
:ab jmain public static void main(String[] args)
:ab jputs System.out.println
:ab packo ca.mcgill.cs.optima
:ab Doo new Do() {public void body()
:com Rinit normal "aYi, Y:s/, /, :/gxiattr_reader"apidef initialize "ap>>YPi, :s/, /, @/gxxA =JoxxAend:noh

" advanced commands!
"if has("python")
":source /home/2003/sgelin3/dev/vim/fields.vim
"endif
