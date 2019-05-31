set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()            " required

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
" NERDTree {{
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '-'
"}}

Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'stanangeloff/php.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'othree/html5.vim'
Plugin 'alvan/vim-closetag'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-db'
Plugin 'leafgarland/typescript-vim'
Plugin 'quramy/tsuquyomi'

Plugin 'Townk/vim-autoclose'

Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](doc|tmp|node_modules)',
\ 'file': '\v\.(exe|so|dll)$',
\ }

Plugin 'mattn/emmet-vim'

Plugin 'roman/golden-ratio'
let g:golden_ratio_filetypes_blacklist = ["nerdtree", "unite"]

Plugin 'posva/vim-vue'
Plugin 'xolox/vim-misc'

Plugin 'xolox/vim-notes'
let g:notes_directories = ['~/Documents/Notes', '~/Dropbox/Notes']
let g:notes_suffix = '.txt'
let g:notes_title_sync = 1

"Plugin 'dikiaap/minimalist'
Plugin 'ayu-theme/ayu-vim' " or other package manager

Plugin 'Yggdroot/indentLine'
let g:indentLine_setColors = 0

" Plugins end
call vundle#end()            " required
filetype plugin indent on    " required

" IndentLine {{
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
" }}

set number          " Show the number lines
set relativenumber  " Calculate lines difference
set shiftwidth=2    " Indents will have a width of 4.
set softtabstop=2   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
set clipboard=unnamedplus

syntax enable
syntax on

"let g:airline_theme='minimalist'
"colorscheme minimalist
"set t_Co=256

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu
"
set colorcolumn=80

" Maps commands
map <c-\> :NERDTreeToggle<CR>
map <c-j> :m .+1<CR>==
map <c-h> Y`]p
map <c-k> :m .-2<CR>==
map <c-a> ggvG$
map <c-t>h :tabprevious<CR>
map <c-t>l :tabnext<CR>
map <c-t>t :tabnew<CR>
map <c-t>w :tabclose<CR>
map <c-t>1 1gt<CR>
map <c-t>2 2gt<CR>
map <c-t>3 3gt<CR>
map <c-t>4 4gt<CR>
map <c-t>5 5gt<CR>
map <c-t>6 6gt<CR>
map <c-t>7 7gt<CR>
map <c-t>8 8gt<CR>
map <c-t>9 9gt<CR>
map <c-t>0 10gt<CR>
