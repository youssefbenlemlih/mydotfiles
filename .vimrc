call plug#begin('~/.vim/plugged')
Plug 'ap/vim-buftabline' "show buffers in top
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'soli/prolog-vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

au BufEnter *.pdf bdelete
au BufNewFile,BufRead *.md,*.tex set spell
au BufNewFile,BufRead *.pl set filetype=prolog
au BufReadCmd *.pdf silent !mupdf -I % &
au BufReadPost * silent! normal! g`"zv
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
colorscheme gruvbox
let g:pandoc#modules#disabled=["hypertext"]
let mapleader = " "
nnoremap <C-h> :w<CR>:bprevious<CR>
nnoremap <C-l> :w<CR>:bnext<CR>
nnoremap <Leader>; m'A;<ESC>`' " Add a semicolon
nnoremap <Leader>= m'gg=G`' " Indent whole file
nnoremap <Leader>cw :%s/\s\+$//g<CR>:nohlsearch<CR>
nnoremap <Leader>vc :source ~/.vimrc<CR>:echo "Reloaded .vimrc"<CR>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
set autoindent
set autoread ""autoload file from disk
set background=dark
set backspace=indent,eol,start
set backupdir+=~/.vimbackup
set backupdir-=.
set backupdir-=~/
set cindent
set cursorline
set diffopt=vertical,filler
set directory-=.
set expandtab "always uses spaces instead of tabs
set foldminlines=3
set formatoptions+=j "join comment lines without #
set history=50 "command line history lenght
set hlsearch
set incsearch "do incremental searching
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set nocompatible
set noerrorbells visualbell t_vb= "disable flashing
set nu rnu "set numbering
set pumheight=10 "pop up length
set relativenumber
set scrolloff=5
set shiftwidth=2
set shortmess+=c "disable completion-menu messages
set showcmd "display incomplete commands
set signcolumn=yes "always show signcolumns
set smarttab
set spelllang=en_us,de_de
set t_Co=256
set t_ut=
set tabstop=4
set wildmenu
set wildmode=longest,list:longest,full "completion
set wrap
syntax on
