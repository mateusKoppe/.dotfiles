set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()            " required

Plugin 'VundleVim/Vundle.vim'

"NERDTree {
  Plugin 'scrooloose/nerdtree'
  let NERDTreeShowHidden=1
  let NERDTreeMinimalUI = 1
""  let g:NERDTreeDirArrowExpandable = '>'
""  let g:NERDTreeDirArrowCollapsible = '-'
  map <c-\> :NERDTreeToggle<CR>
"}

"GitGutter {
  Plugin 'airblade/vim-gitgutter'
"}

"Plugin 'pangloss/vim-javascript'

"Editorconfig {
  Plugin 'editorconfig/editorconfig-vim'
"}

"Closetag {
  Plugin 'alvan/vim-closetag'
"}

"Fugitive {
  Plugin 'tpope/vim-fugitive'
"}

"Autoclose {
  Plugin 'Townk/vim-autoclose'
"}

"Ctrlp {
  Plugin 'kien/ctrlp.vim'
  Plugin 'FelikZ/ctrlp-py-matcher'
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|node_modules)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
"}

"Emmet {
Plugin 'mattn/emmet-vim'
"}

"Goden ratio {
  Plugin 'roman/golden-ratio'
  let g:golden_ratio_filetypes_blacklist = ["nerdtree", "unite"]
"}

"Vue {
  Plugin 'posva/vim-vue'
"}
"
Plugin 'xolox/vim-misc'

"Theme {
  Plugin 'arcticicestudio/nord-vim'
"}

"Airline {
  Plugin 'vim-airline/vim-airline'
  let g:airline_theme='nord'
"}


"Plugins end
call vundle#end()            " required

"Visual config{
  colorscheme nord
  set background=dark
  set guifont=JetBrains\ Mono:h12
  syntax enable
  syntax on
  filetype plugin indent on    " required
  set termguicolors     " enable true colors support
  set colorcolumn=80
  set number          " Show the number lines
  set relativenumber  " Calculate lines difference
  set shiftwidth=2    " Indents will have a width of 4.
  set softtabstop=2   " Sets the number of columns for a TAB.
  set expandtab       " Expand TABs to spaces.
  set clipboard=unnamedplus
"}

"Maps commands
map <c-j> :m .+1<CR>==
map <c-k> :m .-2<CR>==
map <c-h> Y`]p
map <c-a> ggvG$

"Tabs {
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
"}

