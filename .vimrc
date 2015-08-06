"" =========================================
"" Vundle 
"" =========================================

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc"
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
Plugin 'https://github.com/ap/vim-templates'
Plugin 'bling/vim-airline'

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

if has("gui_running")
    set background=light
    colorscheme solarized
    set t_Co=256
    set guifont=DejaVu\ Sans\ Mono\ 12
endif

syntax on
set t_Co=256
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

" Игнорирует autoindent при вставки из буфера
set paste

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" For regular expressions turn magic on
set magic

set shell=/bin/sh 

"Настройки поиска и подсветки результатов поиска
set showmatch
set hlsearch
set incsearch
set ignorecase

"" =========================================
"" NERDTree 
"" =========================================
"How can I open a NERDTree automatically when vim starts up?
autocmd vimenter * NERDTree 
"How can I open a NERDTree automatically when vim starts up if no files were
"specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Q. How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"How can I map a specific key or shortcut to open NERDTree?
map <F12> :NERDTreeToggle<CR>
"" =========================================
"" =========================================

"" =========================================
"" vim-airline 
"" =========================================
let g:airline_theme='solarized'
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#tabline#enabled = 1
"" =========================================
"" =========================================


