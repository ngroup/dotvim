" =========
" vim-plug
" =========
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let g:plug_url_format = 'https://github.com/%s'
call plug#begin('~/.config/nvim/plugged')


Plug 'Chiel92/vim-autoformat'
" Highlight css colors
Plug 'ap/vim-css-color', {'for': ['html', 'css', 'less', 'sass', 'scss', 'javascript', 'coffee', 'coffeescript', 'djantohtml', 'jinja2', 'python']}
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
Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/syntastic' "{{{
    let g:syntastic_python_checkers=['flake8']
    let g:syntastic_python_flake8_args = "--max-line-length=120"
"}}}

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" motion
Plug 'justinmk/vim-sneak'
    let g:sneak#s_next = 1
    augroup SneakPluginColors
        autocmd!
        autocmd ColorScheme * hi SneakPluginTarget guifg=black guibg=red ctermfg=black ctermbg=red
        autocmd ColorScheme * hi SneakPluginScope  guifg=black guibg=yellow ctermfg=black ctermbg=yellow
    augroup END


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


Plug 'rstacruz/sparkup', {'rtp': 'vim'} " A parser for a condensed HTML format
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/neomru.vim'
Plug 'majutsushi/tagbar' "{{{
    nnoremap <F8> :TagbarToggle<CR>
    "}}}





" " Track the engine.
Plug 'SirVer/ultisnips'

" " Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Use deoplete.
    let g:deoplete#enable_at_startup = 1
    " Use smartcase.
    let g:deoplete#enable_smart_case = 1
    inoremap <silent><expr><Tab> pumvisible() ? "\<c-n>"
                \ : (<SID>is_whitespace() ? "\<Tab>"
                \ : deoplete#mappings#manual_complete())

Plug 'zchee/deoplete-jedi'
    let g:deoplete#sources#jedi#show_docstring = 1
    " If you prefer the Omni-Completion tip window to close when a selection is
    " made, these lines close it on movement in insert mode or when leaving
    " insert mode
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

function! s:is_whitespace()
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~? '\s'
endfunction

" Plug 'davidhalter/jedi-vim'
"     let g:jedi#auto_initialization = 0
"     let g:jedi#auto_vim_configuration = 0
"     autocmd FileType python setlocal completeopt-=preview



Plug 'edkolev/tmuxline.vim'
Plug 'benmills/vimux'

" color and UI enhancement
" UI
Plug 'itchyny/lightline.vim'
    let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'component': {
        \   'readonly': '%{&readonly?"":""}',
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }

Plug 'mhinz/vim-startify'
    let g:session_directory = "~/.vim/session"
    let g:startify_list_order = ['sessions', 'files']

Plug 'ap/vim-buftabline'
    set hidden
    nnoremap <silent> = :bn<CR>
    nnoremap <silent> - :bp<CR>

Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' }
    nnoremap <F6> :GundoToggle<CR>

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    let NERDTreeChDirMode=2
    let NERDTreeIgnore = ['\.pyc$']
    let NERDTreeShowHidden=0
    let NERDTreeMinimalUI=0
    map <F5> :NERDTreeToggle<CR>

    " NERDTress File highlighting
    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
        exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
        exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction

    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
    call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')
    call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
    call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
    call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
    call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
    call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')


Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/goyo.vim'
    function! s:goyo_enter()
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
        set noshowmode
        set noshowcmd
        set scrolloff=999
        colorscheme apprentice
    endfunction

    function! s:goyo_leave()
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
        set showmode
        set showcmd
        set scrolloff=5
        colorscheme monokai
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()


Plug 'junegunn/rainbow_parentheses.vim'  " colorful parentheses
    " Activation based on file type
    augroup rainbow_langs
    autocmd!
    autocmd FileType python RainbowParentheses
    augroup END

" dark theme
Plug 'blerins/flattown'
Plug 'sickill/vim-monokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'romainl/Apprentice'
Plug 'danilo-augusto/vim-afterglow'

" light theme (good for printing)
Plug 'vim-scripts/summerfruit.vim'

" dark and light
Plug 'noahfrederick/vim-hemisu'

call plug#end()
