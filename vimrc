" Environment {
    set nocompatible " not compatible with the old-fashion vi mode

    let g:dtv_set = {}  " all dotvim configures go here

    " detect which os is the current vim running on
    let g:dtv_set.is_windows = has('win16') || has('win32') || has('win64')
    let g:dtv_set.is_cygwin = has('win32unix')
    let g:dtv_set.is_mac = has('mac') || has('macunix') || has('gui_macvim')
    let g:dtv_set.is_linux = !g:dtv_set.is_windows && !g:dtv_set.is_cygwin && !g:dtv_set.is_mac

    " bundles config
    filetype off
    syntax off
    let $BUNDLEPATH=$HOME . '/.vim/bundles.vim'
    let $PluginConfPath=$HOME . '/.vim/plugin_conf.vim'
    if filereadable(expand($BUNDLEPATH))
        source $BUNDLEPATH
    endif
    " load utilites
    if filereadable(expand($PluginConfPath))
        source $PluginConfPath
    endif

" }

" General {
    filetype on
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " syntax highlighting
    set mouse=a                 " automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    set autoread        " auto read when file is changed from outside
    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore         " allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)
    " set backup                      " backups are nice ...
    set undofile                    " so is persistent undo ...
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
    set fileformat=unix     " file mode is unix
    set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
    set noswapfile "disable the swap file
    set hidden " switch buffer without saving

    " system clipboard integration
    if g:dtv_set.is_mac
        set clipboard=unnamed
    elseif g:dtv_set.is_linux
        set clipboard=unnamedplus
    endif

    autocmd BufEnter * silent! lcd %:p:h   " auto change the current directory

    " InitDirectories {
    function! InitDirectories()
        if g:dtv_set.is_windows
            let l:separator = '_'
            let l:parent = $HOME . '/' . 'vimfiles/'
        else
            let l:separator = '.'
            let l:parent = $HOME . '/' . l:separator . 'vim/'
        endif

        let l:backup = l:parent . 'backup/'
        let l:tmp = l:parent . 'tmp/'
        let l:undodir = l:parent . 'undodir/'
        if exists('*mkdir')
            if !isdirectory(l:parent)
                call mkdir(l:parent)
            endif
            " if !isdirectory(l:backup)
            "     call mkdir(l:backup)
            " endif
            if !isdirectory(l:tmp)
                call mkdir(l:tmp)
            endif
            if !isdirectory(l:undodir)
                call mkdir(l:undodir)
            endif
        endif
        let l:missing_dir = 0
        " if isdirectory(l:backup)
        "     execute 'set backupdir=' . escape(l:backup, ' ') . '/,.'
        " else
        "     let l:missing_dir = 1
        " endif
        if isdirectory(l:tmp)
            execute 'set directory=' . escape(l:tmp, ' ') . '/,.'
        else
            let l:missing_dir = 1
        endif
        if isdirectory(l:undodir)
            execute 'set undodir=' . escape(l:undodir, ' ') . '/,.'
        else
            let l:missing_dir = 1
        endif

        if l:missing_dir
            echo 'Warning: Unable to create backup directories:' l:backup 'and' l:tmp
            " echo 'Try: mkdir -p' l:backup
            echo 'and: mkdir -p' l:tmp
            " set backupdir=.
            set directory=.
        endif
    endfunction
    " }

    call InitDirectories()

    " auto reload vimrc when editing it
    augroup MyAutoCmd
        autocmd!
        autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
    augroup END

    " none of these should be word dividers, so make them not be
    set iskeyword+=_,$,@,%,#

    " enforces a specified line-length and auto inserts hard line breaks when we
    " reach the limit; in Normal mode, you can reformat the current paragraph with
    " gqap.
    set shell=bash\ -i

" } General End



" Encoding {
    scriptencoding utf-8
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8,ucs-bom,big5,gb2312,latin1
" } Encoding End




" Vim UI {
set background=dark
colorscheme molokai            " load a colorscheme
set showcmd                     " Show me what I'm typing
set showmode                    " display the current mode
set cursorline                  " highlight current line
set backspace=indent,eol,start  " backspace for dummys
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " show matching brackets/parenthesis
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set laststatus=2                " Always show the statusline
" set list
" set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" set fillchars+=vert:\|

" No beep
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif


" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END


" fix the display bug of menu in windows
if has('win32') || has('win64')
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

" Set extra options when running in GUI mode
if has("gui_running")
    " set guioptions-=T  "no toolbar
    set guioptions+=e
    set guioptions-=m    "no menu
    set t_Co=256
    set guitablabel=%M\ %t
    " set guioptions-=r  "no scrollbar
    " set guioptions-=R
    set guioptions-=L
    set guioptions-=l
    set guioptions-=R
    set guioptions-=r
    set guioptions-=b
endif

" Set Font
if has('gui_running')
    if g:dtv_set.is_mac
        set guifont=Inconsolata\ for\ Powerline:h20,
                    \Inconsolata:h20,
                    \Monaco:h20,
                    \Courier:h20
    elseif g:dtv_set.is_windows
        set guifont=Consolas:h18
    elseif g:dtv_set.is_linux
        set guifont=Inconsolata\ for\ Powerline\ 18,
                    \Inconsolata\ 18,
                    \Droid\ Sans\ Mono\ 18,
                    \Ubuntu\ Mono\ 20
    endif
endif


let python_highlight_all = 1



" set background color after the 80th column {
" function! SetColorAfter80()
"     execute "set colorcolumn=81"
"     if winwidth(0)<=80
"         hi ColorColumn guibg=#000000 ctermbg=0
"     else
"         hi ColorColumn guibg=#2D2D2D ctermbg=246
"     endif
" endfunction

" }


" hi LineNr          guifg=#465457 guibg=#232526
" if has("gui_running")
    " call SetColorAfter80()
" endif

" augroup Misc
"     autocmd!
"     autocmd VimResized * call SetColorAfter80()
" augroup END

" Set the conceal color to match the molokai theme
hi Conceal guifg=#F8F8F2 guibg=#1B1D1E

"folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=10 "deepest fold is 10 levels
set nofoldenable "disable folding by default
set foldlevel=1



" Completion Menu {{{
hi Pmenu           guifg=#FCEBB6 guibg=#5E412F
hi PmenuSel        guifg=#000000 guibg=#FF9203
hi PmenuSbar                     guibg=#131414
hi PmenuThumb      guifg=#777777
" }}}



" EasyMotion {{{
hi EasyMotionTarget guifg=#E4E500 guibg=bg gui=bold
hi EasyMotionShade  guifg=#666666 guibg=bg
" }}}

" } UI End


" Formatting {
set autoindent                  " indent at the same level of the previous line
set shiftwidth=4                " use indents of 4 spaces
set shiftround                  " indent/outdent to nearest tabstops
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

autocmd FileType php                        setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby                       setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType php                        setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType coffee,javascript          setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufReadPost *.coffee     set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python                     setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType html,htmldjango,xhtml,haml,jinja2 setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType sass,scss,css              setlocal tabstop=4 shiftwidth=4 softtabstop=4

au BufRead,BufNewFile *.jinja2 set filetype=html

" }


" Key (re)Mappings {

"The default leader is '\', but many people prefer ',' as it's in a standard
"location
let mapleader = ","


" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Stupid shift key fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe

" Disable highlight
map <silent> <leader><CR> :noh<CR>

""" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Easier tab operation
nmap tn :tabnew<CR>
nmap tj :tabp<CR>
nmap tk :tabn<CR>


autocmd FileType ruby nmap <S-e> :!ruby %<cr>
autocmd FileType python nmap <S-e> :!python %<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


nnoremap <leader>v :vertical split<CR>
nnoremap <leader>s :split<CR>


" select ALL
map <C-A> ggVG

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation



" Hot key to change font size
nnoremap <C-Up> H:call LargerFont()<CR>
nnoremap <C-Down> H:call SmallerFont()<CR>

" }




if has('win32') || has('win64')
    " Display user name on Windows.
    let g:vimshell_prompt = $USERNAME.":~$ "
else
    " Display user name on Linux.
    let g:vimshell_prompt = $USER.":~$ "
endif

autocmd FileType vimshell
            \ setlocal nonumber
" }

" }



" Functions {

let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 20
function! AdjustFontSize(amount)
    if has("gui_running")
        let fontname = substitute(&guifont, s:pattern, '\1', '')
        let cursize = substitute(&guifont, s:pattern, '\2', '')
        let newsize = cursize + a:amount
        if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
            let newfont = fontname . newsize
            let &guifont = newfont
        endif
    else
        echoerr "You need to run the GTK2 version of Vim to use this function."
    endif
endfunction

function! LargerFont()
    call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
    call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()



" Strip trailing whitespace {
function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call StripTrailingWhitespaces()
" }


" }


" Beautiful printing
command! -nargs=* Hardcopy call DoMyPrint('<args>')
function! DoMyPrint(args)
  let colorsave=g:colors_name
  color summerfruit
  exec 'hardcopy '.a:args
  exec 'color '.colorsave
endfunction




" setting for fish shell
set shell=/bin/sh

" fix python virtualenv
if has("python") && !empty($VIRTUAL_ENV)
python << EOF
import os
import sys
a = os.environ['VIRTUAL_ENV'] + '/bin/activate_this.py'
execfile(a, dict(__file__ = a))
if 'PYTHONPATH' not in os.environ:
    os.environ['PYTHONPATH'] = ''
    os.environ['PYTHONPATH'] += ":"+os.getcwd()
    os.environ['PYTHONPATH'] += ":".join(sys.path)
EOF
endif



map <C-Tab> :bn<cr>
map <C-S-Tab> :bp<cr>
map bd :bd<cr>
