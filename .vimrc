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
"Plugin 'tpope/vim-surround'
"" Panels
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
"" Syntax highlight
Plugin 'davidhalter/jedi-vim'
"" Syntax cheker
Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-repeat'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'Raimondi/delimitMate'
"" Languages support
Plugin 'https://github.com/raichoo/haskell-vim'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/ap/vim-templates'

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

"" =========================================
"" ctrlp 
"" =========================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"" =========================================
"" =========================================

"" =========================================
"" tagbar 
"" =========================================
nmap <F8> :TagbarToggle<CR>
"" =========================================
"" =========================================
"
"" =========================================
"" Syntastic 
"" =========================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_shell = "/bin/sh"
map <F9> :SyntasticToggleMode<CR>
map <F10> :SyntasticCheck<CR>
"" =========================================
"" =========================================

syntax on
set background=dark "actually it's will be light. 
                    "but it should be reverse to terminal theme
"set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 0 | 1 
"g:solarized_degrade = 0 | 1 
"g:solarized_bold = 1 | 0 
"g:solarized_underline = 1 | 0 
"g:solarized_italic = 1 | 0 
"g:solarized_contrast = "normal"| "high" or "low" 
"g:solarized_visibility= "normal"| "high" or "low" 
colo solarized
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
set nopaste
set pastetoggle=<F2>
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
" Для установки плагинов
set shell=/bin/bash 
"Настройки поиска и подсветки результатов поиска
set showmatch
set hlsearch
set incsearch
set ignorecase

au FileType haskell call s:Haskell()
function! s:Haskell()
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
endfunction


if has("gui_running")
    set background=light "actually it's will be light. 
                        "but it should be reverse to terminal theme    
    set t_Co=256
    let g:solarized_termcolors=256
    colorscheme solarized
    set guifont=DejaVu\ Sans\ Mono\ 12
endif
