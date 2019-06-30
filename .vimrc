set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" MY PLUGINS
Plugin 'junegunn/fzf.vim'
" Plugin 'jremmen/vim-ripgrep'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'kien/tabman.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Chiel92/vim-autoformat'
"""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" MY SETTINGS
" Generics
colorscheme space-vim-dark
let mapleader = "\\"

syntax on
filetype on
set nowrap
set linebreak
set hlsearch
set number
set colorcolumn=80
set expandtab
set shiftwidth=2
set tabstop=2

" backspace fix for newline
set bs=indent,eol,start

" M I C --- K E Y
set mouse=a

" NERDTree
autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>] :Files<CR>
nnoremap <leader>[ :Rg<CR>
nnoremap <C-t> :TMToggle<CR>
nnoremap <C-g> :GitGutterToggle<CR>

" FZF
set rtp+=/home/linuxbrew/.linuxbrew/bin/fzf

" Whitespace on Save
autocmd BufWritePre * %s/\s\+$//e

