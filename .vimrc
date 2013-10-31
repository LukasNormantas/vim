" Pathogen plugin to handle bundles.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" To enable Alt key bindings
" http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
let c='a'
    while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
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

" Cursor line and column selected
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" Clipboard
set guioptions+=a
set clipboard=unnamedplus

" put swp files into the tmp dir rather than next to the file!
set backupdir=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
set directory=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp

" Shortcut to rapidly toggle whitespaces
nmap <leader>p :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Generates ctags for all files
nmap <F12> :!ctags -R .<CR>

" For specific filetypes:
au BufRead,BufNewFile *.md set filetype=markdown

" CtrlP setup
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP .'
let g:ctrlp_by_filename=1
let g:ctrlp_regexp=0
let g:ctrlp_working_path_mode=1
let g:ctrlp_dotfiles=1
let g:ctrlp_max_files=100000
let g:ctrlp_match_window_reversed=0
nmap <A-p> :CtrlPTag<CR>

" Git Gutter
nmap <leader>g :GitGutterToggle<CR>
highlight clear SignColumn

" Fugitive
nmap <leader>gb :Gblame<CR>

" NerdTree
nmap <leader>e :NERDTreeFind<CR>
nmap <leader>ee :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1

" NERDCommenter
:nmap <leader>/ <Plug>NERDCommenterToggle
:vmap <leader>/ <Plug>NERDCommenterToggle

" Tagbar
nmap <leader>tt :TagbarToggle<CR>

" Toggle word wrap
nmap <silent> <leader>w :set wrap!<CR>

" Toggle spell checking
nmap <silent> <leader>s :set spell!<CR>
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

" Sytastic - do not compile java files on save
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['java'] }
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jshint']
" When writing a file, if there are errors, have Syntastic plugin mark them
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_jslint_conf = "--nomen --vars --plusplus"
let g:syntastic_javascript_jshint_conf = "~/.vim/jshint-conf.js"

set noautochdir " To make sure no plugin changes CWD

" Prevents artefacts
au BufWritePost * :silent! :syntax sync fromstart<cr>:redraw!<cr>

" It is essential to export TERM=xterm-256color
se t_Co=256
let g:solarized_termcolors=256
colorscheme solarized

" Include config file with customizations for local environment
" (this file is ignored by Git).
" Keep this line at the bottom of the file
source <sfile>:h/.vimrc.local
