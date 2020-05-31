call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'lervag/vimtex'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'ap/vim-buftabline'

Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
" show file mofifications on the left side
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'soli/prolog-vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'morhetz/gruvbox' 
"Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'mhinz/vim-startify',
call plug#end()

colorscheme gruvbox

set background=dark    " Setting dark mode
set formatoptions+=j " delete comment chars, when joining comment lines
set autoindent    " always set autoindenting on
set autoread ""autoload file from disk
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backupdir+=~/.vimbackup
set backupdir-=.  " set path for backup and swap files
set backupdir-=~/
set cindent
set cursorline
set diffopt=vertical,filler
set directory-=.
set expandtab " always uses spaces instead of tab characters
set foldminlines=3 " don't fold something that is only 1 or 2 lines long
set history=50    " keep 50 lines of command line history
set hlsearch
set incsearch    " do incremental searching
set nocompatible
set noerrorbells visualbell t_vb= " disable flashing
set nu rnu "set numbering
set path+=$GTDIR/src " genometools include path
set pumheight=10 " pop up length
set relativenumber
set scrolloff=5
set shiftwidth=2
set shortmess+=c " don't give |ins-completion-menu| messages.
set showcmd    " display incomplete commands
set signcolumn=yes " always show signcolumns
set smarttab
set t_Co=256
set t_ut=
set tabstop=2
set wildmenu
set wildmode=longest,list:longest,full " completion settings
set wrap
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+ " set nicer chars for set list

syntax on

let g:pandoc#modules#disabled=["hypertext"]
autocmd  BufReadCmd *.pdf silent !mupdf -I % &
autocmd  BufEnter *.pdf bdelete
nnoremap <C-h> :w<CR>:bprevious<CR>
nnoremap <C-l> :w<CR>:bnext<CR>
autocmd BufReadPost * silent! normal! g`"zv

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

au FocusGained,BufEnter * :checktime
au CursorHold,CursorHoldI * checktime

set spelllang=en_us,de_de
autocmd BufNewFile,BufRead *.md set spell
autocmd BufNewFile,BufRead *.tex set spell
autocmd BufNewFile,BufRead *.pl set filetype=prolog
