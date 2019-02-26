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
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
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
let mapleader = "\\"

syntax on
filetype on
set wrap
set linebreak
set hlsearch
set number

" backspace fix for newline
set bs=indent,eol,start

" NERDTree
autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
let g:NERDTreeNodeDelimiter = "\u00a0"
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>] :Files<CR>
nnoremap <leader>[ :Ag<CR>

" FZF
set rtp+=/usr/local/opt/fzf

" Whitespace on Save
autocmd BufWritePre * %s/\s\+$//e

" set clipboard=unnamed

" powerline setup (supposedly)
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
