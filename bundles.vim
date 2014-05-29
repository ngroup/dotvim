" neobundle configuration
    if g:dtv_set.is_windows
        set rtp+=$HOME/vimfiles/bundle/neobundle.vim/
        call neobundle#rc('$HOME/vimfiles/bundle/')
    else
        " usual quickstart instructions
        set rtp+=~/.vim/bundle/neobundle.vim/
        call neobundle#rc(expand('~/.vim/bundle/'))
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
    " NeoBundle 'kien/ctrlp.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_split_rule = "botright"
" let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '

call unite#custom_source('file_rec,file_rec/async,neomru/file,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.pyc',
      \ '\.o',
      \ '\.git/',
      \ '\.hg/',
      \ '*.tar.gz',
      \ '*.zip',
      \ '.*\.egg',
      \ '*.egg-info',
      \ '.*egg-info.*',
      \ '\.sass-cache/',
      \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)

nnoremap <C-P> :<C-u>Unite  -buffer-name=files   -start-insert buffer file_rec/async:!<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)
endfunction

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




if g:dtv_set.is_windows
    let g:dtv_set.autocomplete_method = 'neocomplcache'
    if has('lua')
        let g:dtv_set.autocomplete_method = 'neocomplete'
    endif
else
    let g:dtv_set.autocomplete_method = 'ycm'
endif


NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build' : {
      \     'mac' : './install.sh',
      \    },
      \ }
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
NeoBundle 'fholgado/minibufexpl.vim'
" NeoBundle 'bling/vim-bufferline'
NeoBundle 'Shougo/unite-session'
NeoBundle 'danro/rename.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim'}
NeoBundle 'sjbach/lusty'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'


NeoBundleLazy 'majutsushi/tagbar', {
            \   'autoload' : {
            \      "commands": ["TagbarToggle"],
            \ }}

NeoBundleLazy 'sjl/gundo.vim', {
            \   'autoload' : {
            \      "commands": ["GundoToggle"],
            \ }}

NeoBundleLazy 'Shougo/vimshell.vim', {
            \   'autoload' : {
            \      "commands": ["VimShell"],
            \ }}


filetype plugin indent on     " Required!
NeoBundleCheck


let $BUNDLEPATH=$HOME . '/.vim/bundles.vim'
augroup BundleReload
    autocmd!
    autocmd BundleReload BufWritePost $BUNDLEPATH nested source $BUNDLEPATH
augroup END


