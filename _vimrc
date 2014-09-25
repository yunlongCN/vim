" ---------------------------------------------------
" => default
" ---------------------------------------------------
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" --------------------------------------------------------
" => my settings
" --------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,gb2312,big5
set ambiwidth=double
set mousehide

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

set ignorecase
set hlsearch
set incsearch

set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
set showcmd
set number
set numberwidth=3
set cmdheight=2
colorscheme	desert
set guifont=Consolas:h12

set showtabline=2
set nobackup
set showmatch

execute pathogen#infect()
syntax on
filetype plugin indent on

let NERDTreeShowBookmarks = 1
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
map <C-n> :NERDTreeToggle<CR>
map <C-f> :FufFile<CR>