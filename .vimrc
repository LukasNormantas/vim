" Pathogen plugin to handle bundles.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set updatetime=400

set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0
let mapleader=','

" Clipboard
set guioptions+=a
set clipboard=unnamedplus

" Shortcut to rapidly toggle whitespaces
nmap <leader>p :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Generates ctags for all files
nmap <F12> :!ctags -R --extra=+f --language-force=sh .<CR>

" CtrlP setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename=1
let g:ctrlp_regexp=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_dotfiles=1
let g:ctrlp_custom_ignore=100000
let g:ctrlp_max_files=30
let g:ctrlp_match_window_reversed=0

" Git Gutter
nmap <leader>g :GitGutterToggle<CR>
highlight clear SignColumn

" NerdTree
nmap <leader>r :NERDTreeFind<CR>
nmap <leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1

" Toggle word wrap
nmap <silent> <leader>w :set wrap!<CR>

" Toggle spell checking
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

" Toggle line numbers
nmap <silent> <leader>l :set number!<CR>
set number

" To enable Alt key bindings
" http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Pushing lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Sytastic - do not compile java files on save
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['foo', 'bar'],
                           \ 'passive_filetypes': ['java'] }
