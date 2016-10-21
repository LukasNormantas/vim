" Pathogen plugin to handle bundles.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set timeout ttimeoutlen=50

" keep following commented as it causes artefacts,
" but it is essential for real-time git-gutter updates
"set updatetime=1000 " too low wil cause artefacts!

set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0
let mapleader=','
filetype plugin on
set wildmode=list:longest
set hlsearch
syntax on
nnoremap <CR> :nohlsearch<CR><CR>
set ignorecase

" Specific identation settings to some file types
autocmd Filetype erb setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Clipboard
set guioptions+=a
set clipboard=unnamedplus

" put swp files into the tmp dir rather than next to the file!
set backupdir=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
set directory=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp

" Shortcut to rapidly toggle whitespaces
nmap <leader>p :set list!<CR>
set listchars=tab:>-,eol:$

" Generates ctags for all files
nmap <F12> :!ctags -R .<CR>

" For specific filetypes:
au BufRead,BufNewFile *.md set filetype=markdown

" Quicker window movement
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-h> <C-w>h
 nnoremap <C-l> <C-w>l

" bind" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" CtrlP setup
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP .'
let g:ctrlp_by_filename=1
let g:ctrlp_regexp=0
let g:ctrlp_working_path_mode=""
let g:ctrlp_dotfiles=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_match_window_reversed=0
nmap <A-p> :CtrlPTag<CR>
nmap <leader><tab> :CtrlPBuffer<CR>

nmap <leader>ag :Ag<CR>

" Git Gutter
nmap <leader>g :GitGutterToggle<CR>
highlight clear SignColumn
"nmap <Leader>ha <Plug>GitGutterStageHunk
"nmap <Leader>hu <Plug>GitGutterRevertHunk

" Fugitive
nmap <leader>gb :Gblame<CR>

" NerdTree
nmap <leader>e :NERDTreeFind<CR>
nmap <leader>ee :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$']

" NERDCommenter
:nmap <leader>/ <Plug>NERDCommenterToggle
:vmap <leader>/ <Plug>NERDCommenterToggle

" Tagbar
nmap <leader>tt :TagbarToggle<CR>

" Toggle word wrap
nmap <silent> <leader>w :set wrap!<CR>

" Toggle spell checking
nmap <silent> <leader>ss :set spell!<CR>
set spelllang=en_us

" Toggle line numbers
nmap <silent> <leader>l :set number!<CR>
set number

" Pushing lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>s :SyntasticCheck<CR> :SyntasticToggleMode<CR>
" Sytastic - do not compile java files on save
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['java', 'html'] }
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jshint']
let s:php_executable = "/usr/bin/php"
let g:syntastic_php_checkers = ['php'] ", 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=PSR2 -n --report=csv"

" When writing a file, if there are errors, have Syntastic plugin mark them
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_jslint_conf = "--nomen --vars --plusplus"
let g:syntastic_javascript_jshint_conf = "~/.vim/jshint-conf.js"
let g:syntastic_perl_lib_path = '/usr/lib64/perl5/vendor_perl/5.20.2/x86_64-linux'
let g:syntastic_cpp_include_dirs=['/usr/include/GL/']

set noautochdir " To make sure no plugin changes CWD

" Prevents artefacts
au BufWritePost * :silent! :syntax sync fromstart<cr>:redraw!<cr>

set background=dark
set t_Co=256

let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" prevents bold
if !has('gui_running')
    set t_md=
endif
" Cursor line and column selected
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline nocursorcolumn

hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
hi Visual cterm=NONE ctermbg=7 ctermfg=Black
hi SignColumn ctermbg=NONE
hi clear SpellBad
hi SpellBad cterm=underline

set laststatus=2

" Include config file with customizations for local environment
" (this file is ignored by Git).
" Keep this line at the bottom of the file
source <sfile>:h/.vimrc.local
" DO NOT EDIT BELLOW THIS LINE!

