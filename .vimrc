"" =========================================
"" Vundle 
"" =========================================

set nocompatible
filetype off  "обязательно!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"репозитории на github
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-repeat'
Plugin 'jiangmiao/auto-pairs'
Plugin 'https://github.com/raichoo/haskell-vim'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
<<<<<<< HEAD
Plugin 'https://github.com/ap/vim-templates'
=======
>>>>>>> 72a3062814f53d6851c48be6287062d8fd330e13

call vundle#end()

filetype plugin indent on     " обязательно!

"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just
"" :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to
""  auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ"
""
"" =========================================
"" =========================================

syntax on
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
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

<<<<<<< HEAD
"Configure vim-templates
let g:email = 'liqlvnvn@gmail.com'
let g:username = 'liqlvnvn'
=======

>>>>>>> 72a3062814f53d6851c48be6287062d8fd330e13
