" ======================
" My vim configurations
" ======================

" =========
" vim-plug
" =========
let g:plug_url_format = 'https://github.com/%s'
call plug#begin('~/.vim/plugged')

" Theme
" night theme
Plug 'jordwalke/flatlandia'
Plug 'tomasr/molokai'
" day theme (good for printing)
Plug 'summerfruit.vim'


" Highlight css colors
Plug 'ap/vim-css-color', { 'for': ["html", "css", "less", "sass", "scss", "javascript", "coffee", "coffeescript", "djantohtml", "jinja2"]}
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'sass'] }
" syntax for HTML5
Plug 'othree/html5.vim', { 'for': ['html', 'djangohtml', 'jinja2'] }
Plug 'Glench/Vim-Jinja2-Syntax', {'for': ['html', 'djangohtml', 'jinja2'] }
" syntax /indent /omnicomplete for LESS
Plug 'groenewege/vim-less', {'for': ['less'] }
" syntax for SASS
Plug 'cakebaker/scss-syntax.vim', {'for': ['sass', "scss"] }
" syntax for Javascript
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'html', 'jinja2']} "{{{
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
    "}}}
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'kchmck/vim-coffee-script'
" for zencoding
Plug 'mattn/emmet-vim', {'for': ['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache','jinja2']}
Plug 'gregsexton/MatchTag', {'for':['html','xml','jinja2']}

Plug 'hynek/vim-python-pep8-indent', {'for': ['python']}
Plug 'jmcantrell/vim-virtualenv', {'for': ['python']}
Plug 'hdima/python-syntax'
Plug 'digitaltoad/vim-jade'

Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go'



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
    endif
    "}}}

Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic' "{{{
    let g:syntastic_python_checkers=['flake8']
"}}}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'

" motion
" Plug 'Lokaltog/vim-easymotion'
Plug 'justinmk/vim-sneak'  "{{{
    augroup SneakPluginColors
        autocmd!
        autocmd ColorScheme * hi SneakPluginTarget guifg=black guibg=red ctermfg=black ctermbg=red
        autocmd ColorScheme * hi SneakPluginScope  guifg=black guibg=yellow ctermfg=black ctermbg=yellow
    augroup END
    " }}}


Plug 'terryma/vim-multiple-cursors' "{{{
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    "}}}


Plug 'godlygeek/tabular', {'on' : 'Tabularize'}  "{{{
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    "}}}

" Layout
Plug 'bling/vim-airline' "{{{
    let g:airline_powerline_fonts = 1
    let g:airline_theme="molokai"
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
    "}}}


Plug 'mhinz/vim-startify' "{{{
    let g:session_directory = "~/.vim/session"
    let g:startify_list_order = ['sessions', 'files']
    "}}}
Plug 'xolox/vim-misc'
Plug 'rstacruz/sparkup', {'rtp': 'vim'}

Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'FelikZ/ctrlp-py-matcher' "{{{
    let g:ctrlp_map = '<c-p>'
    " search anything (in files, buffers and MRU files at the same time.)
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
    let g:ctrlp_cmd = 'CtrlPMixed'
    let g:ctrlp_max_height = 10				" maxiumum height of match window
    let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already
    let g:ctrlp_use_caching = 1				" enable caching
    let g:ctrlp_clear_cache_on_exit=0  		" speed up by not removing clearing cache evertime
    let g:ctrlp_mruf_max = 150 				" number of recently opened files

    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                \ 'file': '\v\.(exe|so|dll|pyc)$'}

    " ctrlp-funky
    let g:ctrlp_extensions = ['funky']
    let g:ctrlp_funky_syntax_highlight = 1
    " nnoremap <space> :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <C-g> :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


    nnoremap <C-f> :CtrlPFunky<cr>
    nnoremap <C-b> :CtrlPBuffer<cr>

    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
    "}}}


Plug 'Shougo/vimproc.vim', {'do': 'make -f make_mac.mak'}
Plug 'Shougo/neomru.vim'


Plug 'Shougo/vimshell.vim', {'on': ['VimShell', 'VimShellInteractive']} "{{{
    if s:is_macvim
        let g:vimshell_editor_command='mvim'
    else
        let g:vimshell_editor_command='vim'
    endif
    let g:vimshell_right_prompt='getcwd()'
    let g:vimshell_data_directory=s:get_cache_dir('vimshell')
    let g:vimshell_vimshrc_path='~/.vim/vimshrc'
    nnoremap <leader>t :VimShell -split<CR>
    "}}}


Plug 'sjbach/lusty' "{{{
    nnoremap <silent> <leader>b :LustyJuggler<cr>
    let g:LustyJugglerDefaultMappings = 0
    let g:LustyJugglerShowKeys = 'a'
    "}}}


Plug 'majutsushi/tagbar' "{{{
    nnoremap <F8> :TagbarToggle<CR>
    "}}}

Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': './install.sh --clang-completer' }
Plug 'SirVer/ultisnips', { 'on': [] } "{{{
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    "}}}
Plug 'honza/vim-snippets', { 'on': [] } "{{{
    let g:ycm_complete_in_comments = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    augroup load_us_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('ultisnips', 'vim-snippets', 'YouCompleteMe')
                        \| call youcompleteme#Enable() | autocmd! load_us_ycm
    augroup END
    "}}}

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

call plug#end()



" Environment {
    set nocompatible " not compatible with the old-fashion vi mode

    let g:dtv_set = {}  " all dotvim configures go here

    " detect which os is the current vim running on
    let g:dtv_set.is_windows = has('win16') || has('win32') || has('win64')
    let g:dtv_set.is_cygwin = has('win32unix')
    let g:dtv_set.is_mac = has('mac') || has('macunix') || has('gui_macvim')
    let g:dtv_set.is_linux = !g:dtv_set.is_windows && !g:dtv_set.is_cygwin && !g:dtv_set.is_mac
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
autocmd FileType html,htmldjango,xhtml,haml,jinja2,jade setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType sass,scss,css              setlocal tabstop=4 shiftwidth=4 softtabstop=4

au BufRead,BufNewFile *.jinja2 set filetype=html

" }


" Key (re)Mappings {

"The default leader is '\', but many people prefer ',' as it's in a standard
"location
let mapleader = ","
let g:mapleader = ","


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
" set shell=/bin/sh
set shell=/usr/local/bin/zsh

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


" buffer switch
map <C-Tab> :bn<cr>
map <C-S-Tab> :bp<cr>
map bd :bd<cr>
