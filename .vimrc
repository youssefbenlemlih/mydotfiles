
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ryanoasis/vim-devicons'
"Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'lervag/vimtex'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'tomasiser/vim-code-dark'
"Plug 'christoomey/vim-tmux-navigator'

Plug 'morhetz/gruvbox'
Plug 'ap/vim-buftabline'

Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
" show file mofifications on the left side
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'soli/prolog-vim'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'mhinz/vim-startify',
call plug#end()
"run mupdf

" vimwiki pages github
let wiki_1 = {}
let wiki_1.path = '~/vimwiki'
let wiki_1.ext = '.md'
let wiki_1.syntax = 'markdown'
let wiki_1.auto_toc = 1
" Create posts automatically
let wiki_1.diary_rel_path = '_posts'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_dir_link = 'index'
let g:vimwiki_use_calendar = 1

" vimwiki stuff "
" Run multiple wikis "
let g:vimwiki_list = [{'path': '~/study.wiki',
  \ 'syntax': 'markdown', 'ext': '.md'}]
set nocompatible
filetype plugin on
syntax on


"color desert
set cursorline
hi CursorLine  term=bold cterm=bold guibg=Grey40
nnoremap <C-Left> :bprevious <CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-t> :e . <CR>
" source minimal file
source ~/.vimrc_min

set encoding=utf-8

" Font
set guifont=Inconsolata\ Medium\ 12,Monospace\ 11
" list of stored regex search patterns
" use like this:
" /<C-R>=MyRegExName<CR><CR>
source ~/.vim/regexlist.vim

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set wrap

set history=50    " keep 50 lines of command line history
set showcmd    " display incomplete commands
set incsearch    " do incremental searching
set diffopt=vertical,filler
set scrolloff=5

" set path for backup and swap files
" set backupdir=./.backup,/tmp,./tmp,~/tmp,~/.backup
set backupdir-=.
set backupdir-=~/
set backupdir+=./.backup
set backupdir+=/tmp
set backupdir+=/var/tmp
set directory-=.

"set numbering
set nu rnu

" In many terminal emulators the mouse works just fine, thus enable it.
"set mouse=a

" set nicer chars for :set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" delete comment chars, when joining comment lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
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

set autoindent    " always set autoindenting on

" genometools include path
set path+=$GTDIR/src

" completion settings
set wildmode=longest,list:longest,full
set wildmenu

" pop up length
set pumheight=10

"" highlight lines longer then 100chars
"highlight OverLength ctermbg=red ctermfg=white guifg=white guibg=#592929
"call matchadd('OverLength', '\%101c.*', 11)
highlight WhitespaceEOL ctermbg=red guibg=#592929
call matchadd('WhitespaceEOL', '\s\+$')

set viminfo+=!

"cscope settings
if has('cscope')
  set cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-,f-
  endif

  if filereadable("cscope.out")
    cs add cscope.out
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev cssh cs show
  cnoreabbrev csh cs help

  nmap <C-\>s :csf s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>g :csf g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>c :csf c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>t :csf t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>e :csf e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>f :csf f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\>i :csf i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-\>d :csf d <C-R>=expand("<cword>")<CR><CR>
endif

" hexedit
map <Leader>hon :%!xxd<CR>
map <Leader>hof :%!xxd -r<CR>

" printing options
set printoptions=paper:A4

" disable flashing
set noerrorbells visualbell t_vb=

" don't fold something that is only 1 or 2 lines long
set foldminlines=3

" this breaks lines without spaces at a given length
function BreakLines(length)
  let split_pattern = '\(.\{' . a:length . '\}\)'
  execute 's/' . split_pattern . '/&\r/g'
endfunction

" sum numbers
let g:S = 0  "result in global variable S
function! Sum(number)
  let g:S = g:S + a:number
  return a:number
endfunction

set tags+=./.tags

" add fugitive status
set laststatus=2
set statusline=%{fugitive#statusline()}\ %n\ -\ %.40f\ type:%y%m\ %h%w%q%=%l(%p%%):%c%V

"quickfixsigns settings
noremap <silent> <leader><C-L> :call quickfixsigns#RelNumbersOnce()<cr>

"EasyMotion mappings
let g:EasyMotion_mapping_j = '<Leader><Leader>t'
let g:EasyMotion_mapping_k = '<Leader><Leader>n'
let g:EasyMotion_mapping_n = '<Leader><Leader>l'
let g:EasyMotion_mapping_N = '<Leader><Leader>L'
let g:EasyMotion_mapping_t = '<Leader><Leader>j'
let g:EasyMotion_mapping_T = '<Leader><Leader>J'

" ycm
let g:ycm_complete_in_comments = 1
" let g:ycm_key_invoke_completion= '<C-c>'
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_global_ycm_extra_conf = '~/Repositories/configs/ycm_extra_conf.py.std'
" let g:ycm_filetype_whitelist = { 'cpp' : 1, 'c' : 1}
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-o>'
let g:UltiSnipsListSnippets='<c-l>'
let g:UltiSnipsJumpForwardTrigger='<c-o>'
let g:UltiSnipsJumpBackwardTrigger='<c-a>'

" NERDCommenter settings
let g:NERDRemoveExtraSpace=1
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDCustomDelimiters = {
      \ 'ruby': { 'left': '#', 'leftAlt': "=begin", 'rightAlt': "=end" }
      \ }

" Command-T options
let g:CommandTMaxHeight=16
let g:CommandTMaxFiles=40000
let g:CommandTWildignore="*.sb,*.splint,*.o,**/stest_testsuite/*"
let g:CommandTFileScanner="git"

" calendar options
let g:calendar_keys = { 'goto_today': 'T' }
let g:calendar_monday = 1
let g:calendar_wruler = 'So Mo Di Mi Do Fr Sa'
let g:calendar_mruler = 'Jan,Feb,Mär,Apr,Mai,Jun,Jul,Aug,Sep,Okt,Nov,Dez'
let g:calendar_weeknm = 5

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
" Indent_Guides
let g:indent_guides_enable_on_vim_startup = 1

" set syntax for .h to c
let g:c_syntax_for_h=1

" delimitMate settings
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),{:},[:]"

" vim: nowrap
"let g:livepreview_previewer = 'mupdf'
let g:livepreview_cursorhold_recompile = 0
inoremap jk <ESC>
nmap <C-b> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

"show hidden files in nerdtree
let NERDTreeShowHidden=1

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         

:set hlsearch
let g:NERDTreeIgnore = ['^node_modules$']

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

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

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json', 
  \ ]
" \ 'coc-prettier', 
" \ 'coc-eslint', 
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

""vim prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.jsx,*.tsx,*.html,*.ts,*.js,*.json,*.css,*.md,*.scss,*.less,*.graphql Prettier
""autoload file from disk
:set autoread
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

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = '/home/youssef/.mdconfig/css/normal.css'

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = '/home/youssef/.mdconfig/css/highlighted-line.css'

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

set cursorline
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg
" ₑₕᵢs
"alphsubs ---------------------- {{{
"https://en.wikipedia.org/wiki/List_of_Unicode_characters
        execute "digraphs ks " . 0x2096
        execute "digraphs as " . 0x2090
        execute "digraphs es " . 0x2091
        execute "digraphs hs " . 0x2095
        execute "digraphs is " . 0x1D62
        execute "digraphs ks " . 0x2096
        execute "digraphs ls " . 0x2097
        execute "digraphs mS " . 0x1D50
        execute "digraphs ms " . 0x2098
        execute "digraphs ns " . 0x2099
        execute "digraphs os " . 0x2092
        execute "digraphs ps " . 0x209A
        execute "digraphs rs " . 0x1D63
        execute "digraphs ss " . 0x209B
        execute "digraphs ts " . 0x209C
        execute "digraphs us " . 0x1D64
        execute "digraphs vs " . 0x1D65
        execute "digraphs xs " . 0x2093
        "
        "
        execute "digraphs jS "   0x02B2
"}}}
" prolog sytax highlighting for .pl files
autocmd BufNewFile,BufRead *.pl set filetype=prolog
