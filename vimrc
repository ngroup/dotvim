" ======================
" My vim configurations
" ======================

" Environment {
    set nocompatible " not compatible with the old-fashion vi mode

    let g:dtv_set = {}  " all dotvim configures go here
    " detect which os is the current vim running on
    let g:dtv_set.is_windows = has('win16') || has('win32') || has('win64')
    let g:dtv_set.is_cygwin = has('win32unix')
    let g:dtv_set.is_mac = has('mac') || has('macunix') || has('gui_macvim')
    let g:dtv_set.is_linux = !g:dtv_set.is_windows && !g:dtv_set.is_cygwin && !g:dtv_set.is_mac
" }


" =========
" vim-plug
" =========
let g:plug_url_format = 'https://github.com/%s'
call plug#begin('~/.vim/plugged')

" Theme
" night theme
Plug 'jordwalke/flatlandia'
Plug 'tomasr/molokai'
Plug 'michalbachowski/vim-wombat256mod'
" day theme (good for printing)
Plug 'summerfruit.vim'

Plug 'Chiel92/vim-autoformat'
" Highlight css colors
Plug 'ap/vim-css-color', {'for': ['html', 'css', 'less', 'sass', 'scss', 'javascript', 'coffee', 'coffeescript', 'djantohtml', 'jinja2']}
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'sass'] }
" syntax for HTML5
Plug 'othree/html5.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
" syntax /indent /omnicomplete for LESS
Plug 'groenewege/vim-less', {'for': ['less'] }
" syntax for SASS
Plug 'cakebaker/scss-syntax.vim', {'for': ['sass', 'scss'] }
" syntax for Javascript
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'html', 'jinja2']} "{{{
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
    "}}}
Plug 'kchmck/vim-coffee-script'
" for zencoding
Plug 'mattn/emmet-vim', {'for': ['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache','jinja2']}
Plug 'gregsexton/MatchTag', {'for':['html','xml','jinja2']}

Plug 'hynek/vim-python-pep8-indent', {'for': ['python']}
Plug 'jmcantrell/vim-virtualenv', {'for': ['python']}
Plug 'hdima/python-syntax'

" Vim Jade template engine syntax highlighting and indention
Plug 'digitaltoad/vim-jade'


Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" vim-pandoc-syntax not use conceal
let g:pandoc#syntax#conceal#use = 0




" General
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim' "{{{
    nnoremap \ :Ag<SPACE>
    " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
    if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
            \ --ignore .git
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore .DS_Store
            \ --ignore "**/*.pyc"
            \ -g ""'
        let g:ctrlp_use_caching = 0
    endif
    "}}}

Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic' "{{{
    let g:syntastic_python_checkers=['flake8']
    let g:syntastic_python_flake8_args = "--max-line-length=120"
"}}}

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'

" motion
Plug 'justinmk/vim-sneak'  "{{{
    augroup SneakPluginColors
        autocmd!
        autocmd ColorScheme * hi SneakPluginTarget guifg=black guibg=red ctermfg=black ctermbg=red
        autocmd ColorScheme * hi SneakPluginScope  guifg=black guibg=yellow ctermfg=black ctermbg=yellow
    augroup END
    " }}}


Plug 'terryma/vim-expand-region'

Plug 'terryma/vim-multiple-cursors' "{{{
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    "}}}


Plug 'junegunn/vim-easy-align'  "{{{
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
" }}}

" Layout
Plug 'bling/vim-airline' "{{{
    let g:airline_powerline_fonts = 1
    let g:airline_theme="wombat"
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_detect_crypt = 0
    "}}}

Plug 'mhinz/vim-startify' "{{{
    let g:session_directory = "~/.vim/session"
    let g:startify_list_order = ['sessions', 'files']
    "}}}
Plug 'xolox/vim-misc'
Plug 'rstacruz/sparkup', {'rtp': 'vim'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/neomru.vim'
Plug 'majutsushi/tagbar' "{{{
    nnoremap <F8> :TagbarToggle<CR>
    "}}}


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:python_version = matchstr(system("python --version | cut -f2 -d' '"), '^[0-9]')
if g:python_version =~ 3
    let g:python2_host_prog = "/usr/bin/python2"
else
    let g:python3_host_prog = "/usr/bin/python3"
endif


Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' } "{{{
    nnoremap <F6> :GundoToggle<CR>
    "}}}

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "{{{
    let NERDTreeChDirMode=2
    let NERDTreeIgnore = ['\.pyc$']
    let NERDTreeShowHidden=0
    let NERDTreeMinimalUI=0
    map <F5> :NERDTreeToggle<CR>
    "}}}
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'roman/golden-ratio'


call plug#end()




" General {
    filetype on
    filetype plugin indent on                       " Automatically detect file types.
    syntax on                                       " syntax highlighting
    set mouse=a                                     " automatically enable mouse usage
    set mousehide                                   " Hide the mouse cursor while typing
    set autoread                                    " auto read when file is changed from outside
    set shortmess+=filmnrxoOtT                      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore                         " allow for cursor beyond last character
    set history=1000                                " Store a ton of history (default is 20)
    set undofile                                    " so is persistent undo ...
    set undolevels=1000                             "maximum number of changes that can be undone
    set undoreload=10000                            "maximum number lines to save for undo on a buffer reload
    set fileformat=unix                             " file mode is unix
    set fileformats=unix,dos,mac                    " Prefer Unix over Windows over OS 9 formats
    set noswapfile                                  "disable the swap file
    set hidden                                      " switch buffer without saving

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

    " none of these should be word dividers, so make them not be
    set iskeyword+=_,$,@,%,#

    " enforces a specified line-length and auto inserts hard line breaks when we
    " reach the limit; in Normal mode, you can reformat the current paragraph with
    " gqap.
    " set shell=bash\ -i
    set shell=/bin/bash

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
colorscheme molokai             " load a colorscheme
" colorscheme kalisi             " load a colorscheme
set showcmd                    " Show me what I'm typing
set showmode                   " display the current mode
set cursorline                 " highlight current line
set backspace=indent,eol,start " backspace for dummys
set linespace=0                " No extra spaces between rows
set number                     " Line numbers on
set showmatch                  " show matching brackets/parenthesis
set incsearch                  " find as you type search
set hlsearch                   " highlight search terms
set winminheight=0             " windows can be 0 line high
set ignorecase                 " case insensitive search
set smartcase                  " case sensitive when uc present
set laststatus=2               " Always show the statusline

if !has('nvim')
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif


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
    set guioptions-=T  "no toolbar
    set guioptions+=e
    set guioptions-=m    "no menu
    set t_Co=256
    set guitablabel=%M\ %t
    set guioptions-=L
    set guioptions-=l
    " no scrollbar
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
        set guifont=Inconsolata\ for\ Powerline\ 14,
                    \Inconsolata\ 16,
                    \Droid\ Sans\ Mono\ 16,
                    \Ubuntu\ Mono\ 18
    endif
endif


let python_highlight_all = 1


" Set the conceal color to match the molokai theme
hi Conceal guifg=#F8F8F2 guibg=#1B1D1E

"folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=10 "deepest fold is 10 levels
set nofoldenable "disable folding by default
set foldlevel=1
" } UI End


" Formatting {
set autoindent                  " indent at the same level of the previous line
set shiftwidth=4                " use indents of 4 spaces
set shiftround                  " indent/outdent to nearest tabstops
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

autocmd FileType ruby                                   setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType php                                    setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType coffee,javascript                      setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufReadPost *.coffee                 setlocal foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee                 setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python                                 setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType html,htmldjango,xhtml,haml,jinja2,jade setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType sass,scss,css                          setlocal tabstop=2 shiftwidth=2 softtabstop=2
au      BufRead,BufNewFile *.jinja2                     setlocal filetype=html

" }


" Key (re)Mappings {

"===============================================================================
" Leader Key Mappings
"===============================================================================

" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","


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
map <silent> <leader><h> :noh<CR>

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


" tab and buffer switch by arrow keys
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>

nnoremap <a-,> :vertical resize -1<CR>
nnoremap <a-.> :vertical resize +1<CR>
nnoremap <a-=> :resize +1<CR>
nnoremap <a--> :resize -1<CR>

" bind Alt+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-h> <c-w>h
nnoremap <a-l> <c-w>l
vnoremap <a-j> <c-\><c-n><c-w>j
vnoremap <a-k> <c-\><c-n><c-w>k
vnoremap <a-h> <c-\><c-n><c-w>h
vnoremap <a-l> <c-\><c-n><c-w>l
inoremap <a-j> <c-\><c-n><c-w>j
inoremap <a-k> <c-\><c-n><c-w>k
inoremap <a-h> <c-\><c-n><c-w>h
inoremap <a-l> <c-\><c-n><c-w>l
cnoremap <a-j> <c-\><c-n><c-w>j
cnoremap <a-k> <c-\><c-n><c-w>k
cnoremap <a-h> <c-\><c-n><c-w>h
cnoremap <a-l> <c-\><c-n><c-w>l
if has('nvim')
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-l> <c-\><c-n><c-w>l
  au WinEnter *pid:* call feedkeys('i')
endif
set splitbelow
set splitright

" nnoremap <leader>vt :vertical split<CR>:terminal fish;cd ~;<CR>

" select ALL
map <C-A> ggVG

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
" }



" Functions {

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
" set printexpr="system('open -a Preview '.v:fname_in) + v:shell:error"

set printexpr=PrintFile(v:fname_in)
function PrintFile(fname)
  call system("open -a Preview ".a:fname)
  return v:shell_error
endfunc

command Hardcopy call Hardcopy()
function! Hardcopy()
  let colorsave=g:colors_name
  color summerfruit
  exec 'hardcopy'
  exec 'color '.colorsave
endfun


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


if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

nnoremap <nowait><silent> <leader><leader> :Files<CR>
nnoremap <nowait><silent> <leader><CR> :Buffers<CR>
nnoremap <nowait><silent> <Leader>ag       :Ag <C-R><C-W><CR>
