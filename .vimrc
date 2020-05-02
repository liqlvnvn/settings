set encoding=utf-8
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
"" Panels
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
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
"" Plugin 'https://github.com/ap/vim-templates'
"" Plugin 'haskell.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ledger/vim-ledger'
Plugin 'vim-voom/voom'
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'
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
"autocmd vimenter * NERDTree 
"How can I open a NERDTree automatically when vim starts up if no files were
"specified?
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Q. How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"How can I map a specific key or shortcut to open NERDTree?
map <F12> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeSortHiddenFirst=1
"" =========================================
"" =========================================

"" =========================================
"" vim-airline 
"" =========================================
let g:airline_theme='solarized'
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#tabline#enabled = 1
set list          " Display unprintable characters f12 - switches
set listchars=tab:▸\ ,eol:¬,trail:•,extends:»,precedes:« " Unprintable chars mapping
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
"" https://github.com/scrooloose/syntastic
"" =========================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let b:syntastic_mode = "passive"
let g:syntastic_shell = "/bin/sh"
map <F9> :SyntasticToggleMode<CR>
map <F10> :SyntasticCheck<CR>
"" =========================================
"" =========================================

"" =========================================
"" Haskell Vim 
"" =========================================
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
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
set mouse=a
set title
set relativenumber
set cursorline
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
" Highlight background after 80 symbol
execute "set colorcolumn=" . join(range(81,335), ',')
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" While working with file with long lines,
" try to show as much as possible of the last line in the window
" (rather than a column of "@", which is the default behavior).
set display+=lastline

set linebreak

" Специальные настройки отступов для Haskell
au FileType haskell call s:Haskell()
function! s:Haskell()
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
endfunction

" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

if has("gui_running")
    set background=light "actually it's will be light.
                         "but it should be reverse to terminal theme
    set t_Co=256
    let g:solarized_termcolors=256
    colorscheme solarized
    set guifont=DejaVu\ Sans\ Mono\ 12
endif

set cm=blowfish

" Binding for copying and paste from + register
set clipboard=unnamedplus
map <C-p> <ESC>"+P
vmap <C-S-c> "*y<ESC><ESC> :let @+=@*<CR>
" Bind for selecting whole file
" map  <C-a> <esc>ggVG<CR>

" Highlight background after 80 symbol

" Disable 80+ highligthing column in common text files.
function! LongLines()

    if &filetype == ""
        set cc=0
    elseif &filetype == "text"
        set cc=0
    elseif &filetype == "markdown"
        set cc=0
    else
        execute "set colorcolumn=" . join(range(81,335), ',')
    endif
endfunction

autocmd BufNewFile,BufRead * call LongLines()

function! VoomInit(file_format)
    :call voom#Init(fileformat)
endfunction

"autocmd BufNewFile,BufRead *.md,*.mkd :call voom#Init('markdown',0,1)
autocmd BufNewFile,BufRead *.md,*.mkd :Voom markdown
autocmd BufNewFile,BufRead *.tex :Voom latex
autocmd BufUnload *.md,*.mkd,*.tex :VoomToggle<bar>:q

" map ё `
" map й q
" map ц w
" map у e
" map к r
" map е t
" map н y
" map г u
" map ш i
" map щ o
" map з p
" map х [
" map ъ ]
"
" map ф a
" map ы s
" map в d
" map а f
" map п g
" map р h
" map о j
" map л k
" map д l
" map ж ;
" map э '
"
" map я z
" map ч x
" map с c
" map м v
" map и b
" map т n
" map ь m
" map б ,
" map ю .
"
" map Ё ~
" map Й Q
" map Ц W
" map У E
" map К R
" map Е T
" map Н Y
" map Г U
" map Ш I
" map Щ O
" map З P
" map Х {
" map Ъ }
"
" map Ф A
" map Ы S
" map В D
" map А F
" map П G
" map Р H
" map О J
" map Л K
" map Д L
" map Ж :
" map Э "
"
" map Я Z
" map Ч X
" map С C
" map М V
" map И B
" map Т N
" map Ь M
" map Б <
" map Ю >
"
"

" Second way to map russian keys
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
            '`
" function! RestoreKeyboardLayout(key)
"   call system('xkb-switch -s us')
"   execute 'normal! ' . a:key
" endfunction
"
" nnoremap <silent> р :call RestoreKeyboardLayout('h')<CR>
" nnoremap <silent> о :call RestoreKeyboardLayout('j')<CR>
" nnoremap <silent> л :call RestoreKeyboardLayout('k')<CR>
" nnoremap <silent> д :call RestoreKeyboardLayout('l')<CR>
" nnoremap <silent> Ж :call RestoreKeyboardLayout(':')<CR>
"
" let g:XkbSwitchIMappingsTr = {
"       \ 'ru':
"       \ {'<': 'qwertyuiop[]asdfghjkl;''zxcvbnm,.`/'.
"       \       'QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?~@#$^&|',
"       \  '>': 'йцукенгшщзхъфывапролджэячсмитьбюё.'.
"       \       'ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,Ё"№;:?/'}
"       \ }
"
imap №№ #
imap юю >
imap бб <

" Quick save
" To easily save the current file, while keeping it open,
" use a mapping in your vimrc:
noremap <Leader>s :update<CR>
cmap ц w
cmap й q
cmap ф a
cmap ы s

"" =========================================
"" vimtex 
"" =========================================
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"" =========================================
"" UltiSnips
"" =========================================
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
