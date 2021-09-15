set nocompatible
set number
set autoindent
set smartindent
set showmatch
set ruler
set incsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cindent
set nobackup
set clipboard+=unnamed
set paste
syntax on
#set mouse=a
#set mouse=

" ============================ specific file type ===========================
autocmd BufRead,BufNew *.cu,*.cl  set filetype=cpp 
