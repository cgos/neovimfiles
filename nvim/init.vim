"https://github.com/junegunn/vim-plug/wiki/tutorial
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sbdchd/neoformat'
"Plug 'terryma/vim-smooth-scroll'
call plug#end()

" ========== NERDTree ==========
"How can I close vim if the only window left open is a NERDTree?
map <C-n> :NERDTreeToggle<CR>

"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"let NERDTreeQuitOnOpen = 1
" ========== NERDTree ==========

" reload files changed outside of Vim not currently modified in Vim (needs below)
" set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932

filetype on
syntax on

"colorscheme github
"set background=dark
colorscheme nord
"colorscheme github
"colorscheme vim-solarized8/colors/solarized8_

let mapleader=" "

"if has ("unix")
"  set guifont=Lucida_Console:h12
" set lines=55 columns=150
"elseif has ("win32") || has ("win64")
"  set guifont=Lucida_Console:h9
"  set lines=35 columns=150
"endif

"managing .swp files
"https://vi.stackexchange.com/questions/177/what-is-the-purpose-of-swap-files
set directory^=$HOME/.vim/swap//
set backupdir^=$HOME/.vim/swap//

set number
" set by default in nvim
" set ruler
" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" open new buffers without saving current modifications (buffer remains open)
set hidden

" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus

" CursorLine - sometimes autocmds are not performant; turn off if so
" http://vim.wikia.com/wiki/Highlight_current_line
"set cursorline

" remove line feed at the end
set noeol
set nofixendofline

"nvim default to 1000
"set history=100
filetype indent on
set wrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
" set by default in nvim
"set autoindent
set noerrorbells              " No error bells please
set showmode
" default in nvim
set showcmd
set nocompatible              " vim, not vi
"  searching
" When running a search, get Vim to highlight found words:
set hlsearch
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync
set mouse=a


"cleanup all registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

"remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
