" zc                        свернуть блок
" zo                        развернуть блок
" zM                        закрыть все блоки
" zR                        открыть все блоки

" General {{{1
set encoding=utf-8
syntax on
set mouse=a
set foldmethod=marker
" Для установки плагинов
set shell=/bin/bash
if !has('nvim')
	set cm=blowfish
endif
" }}}
" Plugins {{{1
" Vundlmaine {{{2
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc"
set nocompatible
filetype off  "обязательно!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"репозитории на github
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'nvim-orgmode/orgmode'

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
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'michal-h21/vim-zettel'
Plugin 'fatih/vim-go'
Plugin 'neoclide/coc.nvim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'vim-scripts/AutoComplPop'

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
" }}}
" NERDTree {{{2
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

" }}}
" vim-airline {{{2
let g:airline_theme='solarized'
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" }}}
" ctrlp {{{2
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" }}}
"tagbar {{{2
nmap <F8> :TagbarToggle<CR>
" }}}
" Syntastic {{{2
"" https://github.com/scrooloose/syntastic
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
" }}}
" vimtex {{{2
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" }}}
" UltiSnips {{{2
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" }}}
" coc.vim default settings {{{2
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

" }}}
" Appearance {{{1
colo solarized
set background=light "actually it's will be light. 
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

set title
set number
set relativenumber
set cursorline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" While working with file with long lines,
" try to show as much as possible of the last line in the window
" (rather than a column of "@", which is the default behavior).
set display+=lastline
set list          " Display unprintable characters f12 - switches
set listchars=tab:▸\ ,eol:¬,trail:•,extends:»,precedes:« " Unprintable chars mapping

" Split window below always
set splitbelow
set termwinsize=10x0

" Highlight background after 80 symbol {{{2
execute "set colorcolumn=" . join(range(81,335), ',')

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
" }}}
" Behavior {{{1
set tabstop=4
set shiftwidth=4
set softtabstop=4               "Insert 4 spaces when tab is pressed
set smarttab
set expandtab
set shiftround                  "Round indent to nearest shiftwidth multiple
set et "включаем автозамену по умолчанию
set wrap "включаем перенос длинных строк
set ai "включить автоотступы для новых строк
"set cin "включить отступы в стиле C
" Игнорирует autoindent при вставки из буфера
set paste
" Better command-line completion
set wildmenu
set linebreak
set autowrite

" }}}
" Search {{{1
" Show partial commands in the last line of the screen
set showcmd
set magic
"Настройки поиска и подсветки результатов поиска
set showmatch
set hlsearch
set incsearch
set ignorecase
" }}}
" Languages and Formats {{{1
" Markdown {{{2
"autocmd BufNewFile,BufRead *.md,*.mkd :call voom#Init('markdown',0,1)
autocmd BufNewFile,BufRead *.md,*.mkd :Voom markdown
autocmd BufNewFile,BufRead *.tex :Voom latex
autocmd BufUnload *.md,*.mkd,*.tex :VoomToggle<bar>:q
" }}}
" Haskell Vim {{{2
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1

" Специальные настройки отступов для Haskell
au FileType haskell call s:Haskell()
function! s:Haskell()
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
endfunction
" }}}
" Golang {{{2

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
set nolist
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
" let g:go_highlight_types = 1
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1

"main disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

set completeopt+=menuone,noselect,noinsert
let g:acp_completeoptPreview = 1
function! OpenCompletion()
    if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
        call feedkeys("\<C-x>\<C-o>", "n")
    endif
endfunction

autocmd InsertCharPre * call OpenCompletion()

au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=8 shiftwidth=8
" }}}
" }}}
" Shortcuts {{{1
map <F11> :term<CR>
noremap <C-s> :update<CR>

" Tab navigation like Firefox.
"nnoremap <C-S-Tab> :tabprevious<CR>
"nnoremap <C-Tab>   :tabnext<CR>
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-S-Tab> <Esc>:tabprevious<CR>i
"inoremap <C-Tab>   <Esc>:tabnext<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>

" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Binding for copying and paste from + register
set clipboard=unnamedplus
"map <C-S-v> <ESC>"+P
vmap <C-c> "*y<ESC><ESC> :let @+=@*<CR>
vmap <C-C> "*y<ESC><ESC> :let @+=@*<CR>
imap <C-V> <C-O>:set paste<CR><C-R><C-R>+<C-O>:set nopaste<CR>
vmap <C-V> "_di<C-V><ESC>
"vmap <C-C> "+ygv
vmap <C-X> "+d

" Bind for selecting whole file
" map  <C-a> <esc>ggVG<CR>

set pastetoggle=<F2>
map <F4> :below terminal<CR>
" }}}
" GUI {{{1
if has("gui_running")
    set background=light "actually it's will be light.
                         "but it should be reverse to terminal theme
    set t_Co=256
    let g:solarized_termcolors=256
    colorscheme solarized
    set guifont=DejaVu\ Sans\ Mono\ 12
endif
" }}}
" Russian {{{1
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
cmap ц w
cmap й q
cmap ф a
cmap ы s
" }}}

" }}} vim: fdm=marker
