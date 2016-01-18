set nocompatible
filetype off
filetype plugin indent off
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
NeoBundle "chriskempson/vim-tomorrow-theme"
call neobundle#end()
if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif
colorscheme Tomorrow-Night-Bright

set encoding=utf-8
set nu
set cursorline
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

" for Python
autocmd FileType python setl shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType python setl autoindent smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
