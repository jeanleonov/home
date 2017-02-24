" https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
" git clone https://github.com/vim/vim.git
" cd vim
" ./configure --with-features=huge \
"             --enable-multibyte \
"             --enable-rubyinterp \
"             --enable-pythoninterp \
"             --with-python-config-dir=/usr/lib/python2.7/config \
"             --enable-perlinterp \
"             --enable-luainterp \
"             --enable-gui=gtk2 --enable-cscope --prefix=/usr
"             +clipboard +xterm_clipboard +X11
" make VIMRUNTIMEDIR=/usr/share/vim/vim74
" sudo make install

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set number
set splitbelow
set splitright
set encoding=utf-8
set wildmode=longest

" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \}
set term=xterm-256color
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"enable code-folding
set foldmethod=indent
set foldlevel=99

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

colorscheme zenburn
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set bs=2
set wrapmargin=8
syntax on
set modeline
" prevent auto intend on paste
set pastetoggle=<F2>

" Relative line numbers
set relativenumber 
set number

" Disable swap file
set nobackup
set nowritebackup
set noswapfile

""""""""""""""""""""""""""""""""""
"Bundle 'klen/python-mode'
"" Python-mode
"" Activate rope
"" Keys:
"" K             Show python docs
"" <Ctrl-Space>  Rope autocomplete
"" <Ctrl-c>g     Rope goto definition
"" <Ctrl-c>d     Rope show documentation
"" <Ctrl-c>f     Rope find occurrences
"" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
"" [[            Jump on previous class or function (normal, visual, operator modes)
"" ]]            Jump on next class or function (normal, visual, operator modes)
"" [M            Jump on previous class or method (normal, visual, operator modes)
"" ]M            Jump on next class or method (normal, visual, operator modes)
"
"let g:pymode_rope = 1
"let g:pymode_rope_lookup_project = 0
"
"" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'
"
""Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
"
"" Auto check on save
"let g:pymode_lint_write = 1
"
"" Support virtualenv
"let g:pymode_virtualenv = 1
"
"" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'
"
"" Run python script using ..:
"let g:pymode_run_bind = '<leader>l'
"
"" syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
"" Don't autofold code
"let g:pymode_folding = 0
"---------------------------------

"" Python autocomplete
"Bundle 'davidhalter/jedi-vim'
"Bundle 'terryma/vim-multiple-cursors'
"Bundle 'hlissner/vim-multiedit'
"---------------------------------

" Version control diff
Bundle 'mhinz/vim-signify'
"---------------------------------


