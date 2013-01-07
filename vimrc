" no vi-compatible
set nocompatible

" ---------------------------------------------------------
"   => Plugin Installation
" ---------------------------------------------------------
" Setting up Vundle - the vim plugin bundler
"let iCanHazVundle=1
"let vundleReadMe=expand('~/.vim/bundle/vundle/README.md')
"if !filereadable(vundleReadMe)
"    echo 'Installing Vundle...'
"    echo ''
"    slient !mkdir -p ~/.vim/bundle
"    slient !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
"    let iCanHazVundle=0
"endif

" required on MacOSX only
filetype on
" required for vundle
filetype off
let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" Better file brower
Bundle 'scrooloose/nerdtree'
" Zen coding
Bundle 'mattn/zencoding-vim'
" Surround
Bundle 'tpope/vim-surround'
" Python code checker
Bundle 'kevinw/pyflakes-vim'
" Git
if executable('git')
    Bundle 'tpope/vim-fugitive'
endif

" Bundles from vim-scripts repos

" XML/HTML tags navigation
Bundle 'vim-scripts/matchit.zip'
" Gvim colorscheme
Bundle 'vim-scripts/Wombat'
Bundle 'w0ng/vim-hybrid'
Bundle 'nanotech/jellybeans.vim'
Bundle 'mutewinter/vim-indent-guides'
" UI Additions
Bundle 'Lokaltog/vim-powerline'
" TextMate-style snippets
Bundle 'vim-scripts/snipMate'
" Source code brower (supports C/C++,java,python,php,sql and etc)
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/taglist-plus'
" Eclipse like task list
Bundle 'vim-scripts/TaskList.vim'
" buffer/file/command/tag/etc explorer with fuzzy matching
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/FuzzyFinder'

" Installing plugins the first time
"if iCanHazVundle == 0
"    echo 'Installing bundles, please ignore key map error messages'
"    echo ''
"    :BundleInstall
"endif

" allow plugins by file type
filetype plugin indent on

" ---------------------------------------------------------
"   => General
" ---------------------------------------------------------
" Set autoread when a file is changed outside
set autoread
"record 1000 rows histoy
set history=1000

set enc=utf-8
set fencs=utf-8,gb18030,gb2312,shift-jis
" Yanks go on clipboard instead
"set clipboard+=unnamed
"set spell
" Optimize auto complete
set completeopt+=longest
set completeopt-=preview
" Hide mouse after chars typed
set mousehide
"if opening file is readonly and unsave, popup confirm window
set confirm
"set shell=/bin/bash\ -l
" no temporary file
set nobackup
set noswapfile
" when editing, show cursor postition at downright corner
"set ruler
" Delete all whitespace in end of line
autocmd BufWritePre * :%s/\s\+$//e

" ---------------------------------------------------------
"   => Indent and Tab
" ---------------------------------------------------------
" Preserve current indent on new lines
set autoindent
"set cindent "if program by c language

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" indent/outdent to nearest tabstop
set shiftround

" ---------------------------------------------------------
"   => Search
" ---------------------------------------------------------
" Case insensitive search
set ignorecase
" Case sensitive when uc present
set smartcase
set hlsearch
" Find as you type search
set incsearch
"set showmatch
" turn on global flag
set gdefault

" ---------------------------------------------------------
"   => Vim Interface
" ---------------------------------------------------------
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" Only have cursorline in current window and in normal window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
auto InsertEnter * set nocursorline
auto InsertLeave * set cursorline
" Show list instead of just completing
set wildmenu
" Use powerful wildmenu
set wildmode=list:longest,full
" Avoids 'hit enter'
set shortmess=at
" Show (partial) command in the status line
set showcmd

" Make backspaces delete sensibly
set backspace=indent,eol,start
" Backspace and cursor keys wrap to
set whichwrap+=h,l,<,>,[,]
" Allow for cursor beyond last character
set virtualedit=block,onemore
" Lines to scroll when cursor leaves screen
set scrolljump=5
" Minimum lines to keep above and below cursor
set scrolloff=3
" Minimal number of columns to scroll horizontally
set sidescroll=1
" Minimal number of screen columns to keep away from cursor
set sidescrolloff=10

" Show matching brackets/parenthesis
set showmatch
" Decrease the time to blink
set matchtime=2

set number
set numberwidth=3

" Optimize format options
set formatoptions+=rnlmM
" Set wrap
set wrap
" Change text width
set textwidth=80
" Indicate text border
set colorcolumn=+1
" Show these tabs and spaces and so on
"set list
" Change listchars
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
"set linebreak " Wrap long lines at a blank
"set showbreak=↪ " Change wrap line break
" Change fillchars
"set fillchars=diff:⣿,vert:│

set laststatus=2 "always show status line
"set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" Use vim-powerline to modify the statuls line
"if has('gui_running') && (!has('win64') || !has('win32'))
"  let g:Powerline_symbols='unicode'
"endif
set cmdheight=4 "default=1

" Set gVim UI setting
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guioptions+=f
endif

" ---------------------------------------------------------
"   => Colors and Fonts
" ---------------------------------------------------------
syntax on
set background=dark
colorscheme hybrid
set transparency=5
if has('gui_running')
    if has('gui_macvim')
        set guifont=Monaco:h13
    elseif has('gui_gtk')
        set guifont=Monospace\ 11
    elseif has('gui_win32')
        set guifont=Consolas:h11:cANSI
    endif
else
    " Use 256 colors
    set t_Co=256
endif

" ---------------------------------------------------------
"   => Fold
" ---------------------------------------------------------
set autochdir
set foldenable
set foldmethod=manual
set foldexpr=1 "show lines after folded

" ---------------------------------------------------------
"   => Filetype Specific
" ---------------------------------------------------------
autocmd FileType python set omnifunc=pythoncomplete#Complete

" ---------------------------------------------------------
"   => Plugin Setting
" ---------------------------------------------------------
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
" Open NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" Open NERDTree automatically when vim starts up if no files where specified
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ---------------------------------------------------------
"   => Key Mapping
" ---------------------------------------------------------
inoremap <C-space> <C-x><C-o>
nnoremap <F3> :NERDTreeToggle<CR>

nnoremap <C-f><C-f> :FufFile<CR>
nnoremap <F8> :!/usr/local/bin/ctags -R --python-kinds=-i *.py<CR>
nnoremap <F4> :TlistToggle<CR>
