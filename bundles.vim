"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neobundle configuration and basic plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    if g:dtv_set.is_windows
        set rtp+=$HOME/vimfiles/bundle/neobundle.vim/
        call neobundle#begin('$HOME/vimfiles/bundle/')
    else
        " usual quickstart instructions
        set rtp+=~/.vim/bundle/neobundle.vim/
        call neobundle#begin(expand('~/.vim/bundle/'))
    endif


    " let NeoBundle manage NeoBundle
    NeoBundleFetch 'Shougo/neobundle.vim'

    " async process
    NeoBundle "Shougo/vimproc", {
                \ "build": {
                \   "windows"   : "make -f make_mingw32.mak",
                \   "cygwin"    : "make -f make_cygwin.mak",
                \   "mac"       : "make -f make_mac.mak",
                \   "unix"      : "make -f make_unix.mak",
                \ }}

    NeoBundle "Shougo/unite.vim"
    NeoBundle 'L9'
" } end of Basic


" Theme {
    " theme for coding
    NeoBundle 'tomasr/molokai'
    NeoBundle 'jordwalke/flatlandia'
    NeoBundle 'chriskempson/base16-vim'

    " pretty theme for code printng
    NeoBundle 'summerfruit.vim'
" } end of Theme


" File Management and Search {
    " recent file
    NeoBundleLazy 'Shougo/neomru.vim', {'autoload':{'unite_sources':'file_mru'}}


    " NERDTree
    NeoBundleLazy 'scrooloose/nerdtree', {
                \ 'autoload' : {
                \      "commands": ["NERDTreeToggle"],
                \ }}

" }


" Web {

    " Highlight css colors
    NeoBundleLazy 'ap/vim-css-color', {
                \ "autoload": {
                \   "filetypes": ["html", "css", "less", "sass", "scss", "javascript", "coffee", "coffeescript", "djantohtml", "jinja2"],
                \ }}

    " syntax for CSS3
    NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload': {
                \ 'filetypes': ['css', 'scss', 'sass'] }}

    " syntax for HTML5
    NeoBundleLazy 'othree/html5.vim', {'autoload': {
                \ 'filetypes': ['html', 'djangohtml', 'jinja2'] }}
    NeoBundleLazy 'Glench/Vim-Jinja2-Syntax', {'autoload': {
                \ 'filetypes': ['html', 'djangohtml', 'jinja2'] }}

    " syntax /indent /omnicomplete for LESS
    NeoBundleLazy 'groenewege/vim-less', {'autoload': {
                \ 'filetypes': ['less'] }}

    " syntax for SASS
    NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload': {
                \ 'filetypes': ['sass', "scss"] }}

    " syntax for Javascript
    NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {
                \ 'filetypes': ['javascript', 'html', 'jinja2']}}


    " for zencoding
    NeoBundleLazy 'mattn/emmet-vim', {'autoload': {
                \ 'filetypes':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache','jinja2']}}


    NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml','jinja2']}}
" }


"     " syntax for Python
"     NeoBundleLazy 'hdima/python-syntax', {'autoload': {
"                 \ 'filetypes': ['python']}}
"
    NeoBundleLazy 'hynek/vim-python-pep8-indent', {'autoload': {
                \ 'filetypes': ['python']}}

    NeoBundleLazy 'jmcantrell/vim-virtualenv', {'autoload': {
                \ 'filetypes': ['python']}}

    " syntax for Python
    NeoBundle 'hdima/python-syntax'



NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build' : {
      \     'mac' : './install.sh --clang-completer',
      \    },
      \ }

" NeoBundle 'mileszs/ack.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'danro/rename.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim'}
NeoBundle 'sjbach/lusty'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'einars/js-beautify'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'dag/vim-fish'
NeoBundle 'fatih/vim-go'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'tomasr/molokai'

NeoBundleLazy 'majutsushi/tagbar', {
            \   'autoload' : {
            \      "commands": ["TagbarToggle"],
            \ }}

NeoBundleLazy 'sjl/gundo.vim', {
            \   'autoload' : {
            \      "commands": ["GundoToggle"],
            \ }}


call neobundle#end()
filetype plugin indent on     " Required!
NeoBundleCheck
