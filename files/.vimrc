"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let dein_dir = expand('~/.vim/repos/github.com/Shougo')

if !isdirectory(dein_dir)
  echo 'installing dein.vim ...'
  call mkdir(dein_dir, 'p', '0755')
  call system('git clone https://github.com/Shougo/dein.vim ' . dein_dir . '/dein.vim')
endif

" Required:
set runtimepath+=$HOME/.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('tpope/vim-fugitive')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-surround')
call dein#add('vim-scripts/AnsiEsc.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('Raimondi/delimitMate')
call dein#add('itchyny/lightline.vim')

" Add local plugins
if filereadable(expand('~/.vim/local/plugins.vim'))
  source ~/.vim/local/plugins.vim
endif

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

"End dein Scripts-------------------------

" auto save
augroup autosave
  autocmd!
  autocmd BufEnter * let g:auto_save = (exists("*fugitive#head")&&""!=fugitive#head())
augroup END

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

" Clipboard
set clipboard=unnamed,unnamedplus

" Appearance
syntax on
set background=dark
colorscheme desert

" Key binding
noremap j gj
noremap k gk
map! <C-g><C-g> <Esc>
noremap <C-w><C-]> <C-w>}

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

if filereadable(expand('~/.vim/local/init.vim'))
  source ~/.vim/local/init.vim
endif
