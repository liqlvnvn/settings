set nocompatible
set number
set tabstop=4
set shiftwidth=4
set smarttab
set et "включаем автозамену по умолчанию

set wrap "включаем перенос длинных строк
set ai "включить автоотступы для новых строк
"set cin "включить отступы в стиле C
set expandtab 
set shiftround                  "Round indent to nearest shiftwidth multiple
set softtabstop=4               "Insert 4 spaces when tab is pressed

"Настройки поиска и подсветки результатов поиска
set showmatch
set hlsearch
set incsearch
set ignorecase

"How can I open a NERDTree automatically when vim starts up?
autocmd vimenter * NERDTree 
"How can I open a NERDTree automatically when vim starts up if no files were
"specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Q. How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

filetype off  "обязательно!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on     " обязательно!

"репозитории на github
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'davidhalter/jedi-vim'
Bundle 'tpope/vim-repeat'
Bundle 'jiangmiao/auto-pairs'
