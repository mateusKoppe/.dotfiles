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
Plugin 'dracula/vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'leafgarland/typescript-vim'
Plugin 'quramy/tsuquyomi'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'roman/golden-ratio'
" Plugins end

call vundle#end()            " required
filetype plugin indent on    " required

set number          " Show the number lines
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
set clipboard=unnamedplus

syntax on
color dracula

let NERDTreeShowHidden=1

let g:golden_ratio_filetypes_blacklist = ["nerdtree", "unite"]

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set termguicolors
set colorcolumn=80

" let g:typescript_compiler_binary = 'tsc'

if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

set t_Co=256

" Maps commands
map <c-\> :NERDTreeToggle<CR>
map <c-j> :m .+1<CR>
map <c-k> :m .-2<CR>
