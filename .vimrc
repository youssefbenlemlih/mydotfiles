" Specify a directory for plugins
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

autocmd vimenter * colorscheme gruvbox
set background=dark    " Setting dark mode

set nocompatible
set cursorline
set autoread ""autoload file from disk
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set wrap

set history=50    " keep 50 lines of command line history
set showcmd    " display incomplete commands
set incsearch    " do incremental searching
set diffopt=vertical,filler
set scrolloff=5

set backupdir-=.  " set path for backup and swap files
set backupdir-=~/
set backupdir+=~/.vimbackup
set directory-=.

set nu rnu "set numbering
set autoindent    " always set autoindenting on

set path+=$GTDIR/src " genometools include path
set wildmode=longest,list:longest,full " completion settings
set wildmenu

set pumheight=10 " pop up length

set noerrorbells visualbell t_vb= " disable flashing

set foldminlines=3 " don't fold something that is only 1 or 2 lines long

  set formatoptions+=j " delete comment chars, when joining comment lines
set hlsearch
set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab " always uses spaces instead of tab characters

hi Normal guibg=NONE ctermbg=NONE
set t_Co=256
set t_ut=

set shortmess+=c " don't give |ins-completion-menu| messages.

set signcolumn=yes " always show signcolumns

set hlsearch
set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab " always uses spaces instead of tab characters

hi Normal guibg=NONE ctermbg=NONE
set t_Co=256
set t_ut=

set shortmess+=c " don't give |ins-completion-menu| messages.

set signcolumn=yes " always show signcolumns

set hlsearch
set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab " always uses spaces instead of tab characters

hi Normal guibg=NONE ctermbg=NONE
set t_Co=256
set t_ut=

set shortmess+=c " don't give |ins-completion-menu| messages.

set signcolumn=yes " always show signcolumns

set hlsearch
set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab " always uses spaces instead of tab characters

hi Normal guibg=NONE ctermbg=NONE
set t_Co=256
set t_ut=

set shortmess+=c " don't give |ins-completion-menu| messages.

set signcolumn=yes " always show signcolumns

set hlsearch
set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab " always uses spaces instead of tab characters

hi Normal guibg=NONE ctermbg=NONE
set t_Co=256
set t_ut=

set shortmess+=c " don't give |ins-completion-menu| messages.

set signcolumn=yes " always show signcolumns

set hlsearch
set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab " always uses spaces instead of tab characters

hi Normal guibg=NONE ctermbg=NONE
set t_Co=256
set t_ut=

set shortmess+=c " don't give |ins-completion-menu| messages.

set signcolumn=yes " always show signcolumns

set hlsearch
set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab " always uses spaces instead of tab characters

hi Normal guibg=NONE ctermbg=NONE
set t_Co=256
set t_ut=

set shortmess+=c " don't give |ins-completion-menu| messages.

set signcolumn=yes " always show signcolumns

set hlsearch
set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

hi Normal guibg=NONE ctermbg=NONE
set t_Co=256
set t_ut=

set shortmess+=c " don't give |ins-completion-menu| messages.

set signcolumn=yes " always show signcolumns

set hlsearch
set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab " always uses spaces instead of tab characters

hi Normal guibg=NONE ctermbg=NONE
set t_Co=256
set t_ut=

set shortmess+=c " don't give |ins-completion-menu| messages.

set signcolumn=yes " always show signcolumns

filetype plugin on
syntax on

let g:pandoc#modules#disabled=["hypertext"]
"let g:pandoc#hypertext#open_editable_alternates=0
" open pdf
autocmd  BufReadCmd *.pdf silent !mupdf -I % &
autocmd  BufEnter *.pdf bdelete
hi CursorLine  term=bold cterm=bold guibg=Grey40
nnoremap <C-h> :w<CR>:bprevious<CR>
nnoremap <C-l> :w<CR>:bnext<CR>
nnoremap <C-t> :e . <CR>


" set nicer chars for set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif


" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

" For all text files set 'textwidth' to 100 characters.
autocmd FileType text setlocal textwidth=100

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

augroup END

" latex-box folding
let g:LatexBox_Folding=1
let g:LatexBox_fold_automatic=0
" latex-box indent off
let g:LatexBox_custom_indent=0
" set contiuously compilation
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2
let g:LatexBox_fold_sections = [
      \ "part",
      \ "chapter",
      \ "section",
      \ "subsection",
      \ "subsubsection",
      \ "paragraph"
      \ ]
"let g:tex_conceal='abdmg'
" Indentbei_Guides
let g:indent_guides_enable_on_vim_startup = 1

" set syntax for .h to c
let g:c_syntax_for_h=1


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

""vim prettier on save
let g:prettier#autoformat = 0

au FocusGained,BufEnter * :checktime
au CursorHold,CursorHoldI * checktime

"ctrl m for markdown files
" example
nmap <C-y> <Plug>MarkdownPreview
nmap <C-s> <Plug>MarkdownPreviewStop
nmap <C-o> <Plug>MarkdownPreviewToggle
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }


set cursorline
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg

" spelling
set spelllang=en_us,de_de
autocmd BufNewFile,BufRead *.md set spell
autocmd BufNewFile,BufRead *.tex set spell

" prolog sytax highlighting for .pl files
autocmd BufNewFile,BufRead *.pl set filetype=prolog
