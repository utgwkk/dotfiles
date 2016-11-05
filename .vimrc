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

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}

call neobundle#end()

" auto save
let g:auto_save = 1

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

" General
set encoding=utf-8
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set showcmd
set history=10000
set wildmenu wildmode=list:longest,full
set backspace=indent,eol,start
set ruler
set listchars=tab:>\ ,extends:<
set pastetoggle=<F2>

" Line
set nu
set cursorline
highlight LineNr ctermfg=darkyellow


" File
set nobackup
set noswapfile
set autoread

" Tab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set autoindent
set expandtab
set smartindent

" Search
set incsearch

" IME
set iminsert=0
set imsearch=-1

" Appearance
syntax on
set background=dark
colorscheme desert

" Key binding
noremap j gj
noremap k gk
map! <C-g><C-g> <Esc>

" for Python
autocmd FileType python setl shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType python setl autoindent smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" for JavaScript
autocmd FileType javascript setl shiftwidth=4 softtabstop=4 tabstop=4

" For fugitive.vim
autocmd QuickFixCmdPost *grep* cwindow

" lightline
let g:lightline = {
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\             [ 'fugitive', 'readonly', 'filename' ] ]
\   },
\   'component': {
\     'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
\   },
\   'component_visible_condition': {
\     'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
\   }
\ }
