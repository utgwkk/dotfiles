"" NeoBundle "{{{ 
if has('vim_starting')
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  if !isdirectory(expand("~/.vim/tmp/"))
    :call mkdir(expand("~/.vim/tmp/"),"p")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
""}}}

set encoding=utf-8
set nu
set cursorline
set cursorcolumn
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set showcmd
set history=10000
set wildmenu wildmode=list:longest,full

" File
set noswapfile
set autoread

" Tab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set autoindent
set expandtab
set smartindent

syntax on

