set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()            " required

Plugin 'VundleVim/Vundle.vim'

"NERDTree {
  Plugin 'scrooloose/nerdtree'
  let NERDTreeShowHidden=1
  map <c-\> :NERDTreeToggle<CR>
"}

"GitGutter {
  Plugin 'airblade/vim-gitgutter'
"}

"fzf {
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

nnoremap <C-p> :Files<CR>
nnoremap <A-f> :Rg<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Conditional'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>
"}

"JavaScript {
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'styled-components/vim-styled-components', { 'branch': 'main' }
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [ 'coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-vetur', 'coc-python', 'coc-clangd' ]  " list of CoC extensions needed

Plugin 'jiangmiao/auto-pairs'

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"}

"Editorconfig {
  Plugin 'editorconfig/editorconfig-vim'
"}

"Closetag {
  Plugin 'alvan/vim-closetag'
  let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js"
"}

"IndentLine {
  Plugin 'Yggdroot/indentLine'
  "let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"}

"Fugitive {
  Plugin 'tpope/vim-fugitive'
"}

"Autoclose {
  Plugin 'Townk/vim-autoclose'
"}

"Ctrlp {
"  Plugin 'kien/ctrlp.vim'
"  Plugin 'FelikZ/ctrlp-py-matcher'
"  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"  let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/](doc|tmp|node_modules)',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ }
"}

"Emmet {
Plugin 'mattn/emmet-vim'
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
  let g:airline#extensions#branch#enabled=1
"}


"Plugins end
call vundle#end()            " required

"Visual config{
  colorscheme nord
  set background=dark
  set guifont=JetBrains\ Mono:h12
  syntax enable
  syntax on
  set nowrap
  filetype plugin indent on    " required
  set termguicolors     " enable true colors support
  set colorcolumn=80
  set number          " Show the number lines
  set relativenumber  " Calculate lines difference
  set shiftwidth=2    " Indents will have a width of 4.
  set softtabstop=2   " Sets the number of columns for a TAB.
  set expandtab       " Expand TABs to spaces.
"}

command! -nargs=0 Prettier :CocCommand prettier.formatFile

"Maps commands
map <c-j> :m .+1<CR>==
map <c-k> :m .-2<CR>==
map <c-h> Y`]p
map <c-a> ggvG$
map <c-I> :CocCommand prettier.formatFile<CR>

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

