set bg=dark

syntax on

set nu

set ts=2
set expandtab

set autoindent
set cindent
set shiftwidth=4

set incsearch
set hlsearch

set mouse=a

set ruler

"---------------------------------------------------------------------------
"The blow is my own vimrc

"define the color scheme where usr/share/vim/vim72/colors
colorscheme desert

"Taglist
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1

"winmanage NERDTREE
let g:NERDTree_title='NERD Tree'
let g:winManagerWindowLayout='NERDTree|TagList'

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nmap wm :WMToggle<cr>

"intelligent hint
set nocp
filetype plugin indent on
set completeopt=longest,menu

"Super Tab
let g:SuperTabRetaincompletionType=2
let g:SuperTabDefaultcompletionType="<c-x><c-o>"

"c++ intelligent hint
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
