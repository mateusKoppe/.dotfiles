set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()            " required

" Plugins start
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'stanangeloff/php.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-db'
Plugin 'leafgarland/typescript-vim'
Plugin 'quramy/tsuquyomi'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'roman/golden-ratio'
Plugin 'posva/vim-vue'
" Plugins end

call vundle#end()            " required
filetype plugin indent on    " required

set number          " Show the number lines
set shiftwidth=2    " Indents will have a width of 4.
set softtabstop=2   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
set clipboard=unnamedplus

syntax enable
set background=light
colorscheme solarized

let NERDTreeShowHidden=1

let g:golden_ratio_filetypes_blacklist = ["nerdtree", "unite"]

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

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
