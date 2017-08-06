" ======================
" My vim configurations
" ======================
" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

source ~/.config/nvim/plugins.vim

" General {
    set mouse=a                                     " automatically enable mouse usage
    set mousehide                                   " Hide the mouse cursor while typing
    set autoread                                    " auto read when file is changed from outside
    set shortmess+=filmnrxoOtT                      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore                         " allow for cursor beyond last character
    set undofile                                    " so is persistent undo ...
    set undolevels=1000                             "maximum number of changes that can be undone
    set undoreload=10000                            "maximum number lines to save for undo on a buffer reload
    set fileformat=unix                             " file mode is unix
    set fileformats=unix,dos,mac                    " Prefer Unix over Windows over OS 9 formats
    set noswapfile                                  "disable the swap file
    set hidden                                      " switch buffer without saving

    " system clipboard integration
    set clipboard+=unnamedplus

    autocmd BufEnter * silent! lcd %:p:h   " auto change the current directory

    " InitDirectories {
    function! InitDirectories()
        let l:separator = '.'
        let l:parent = $HOME . '/' . l:separator . 'vim/'
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
" set t_Co=256
set background=dark
" set termguicolors
colorscheme monokai
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


" No beep
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" cursor shape changes
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
au VimLeave * set guicursor=a:block-blinkon0


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
    set guitablabel=%M\ %t
    set guioptions-=L
    set guioptions-=l
    " no scrollbar
    set guioptions-=R
    set guioptions-=r
    set guioptions-=b
endif

" Set the conceal color to match the molokai theme
hi Conceal guifg=#F8F8F2 guibg=#1B1D1E

hi BufTabLineFill ctermbg=238
hi BufTabLineCurrent ctermbg=182 guifg=#ff0087


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

autocmd FileType ruby nmap <S-e> :!ruby %<cr>
autocmd FileType python nmap <S-e> :!python %<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif


" bind space+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
if has('nvim')
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-l> <c-\><c-n><c-w>l
  au WinEnter *pid:* call feedkeys('i')
endif
set splitbelow
set splitright

" nnoremap <leader>vt :vertical split<CR>:terminal fish;cd ~;<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
" }

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


function! Pretty_print(print_path)
    let colorsave=g:colors_name
    set printfont=Courier:h10
    set background=dark
    colorscheme PaperColor
    exec 'hardcopy > '.a:print_path
    exec 'colorscheme '.colorsave
    set background=dark
endfun
command! -nargs=1 Hardcopy call Pretty_print(<f-args>)

let g:python_host_prog = $HOME . "/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = $HOME . "/.pyenv/versions/neovim/bin/python3"
