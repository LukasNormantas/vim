" Pathogen plugin to handle bundles.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0

" Clipboard
set guioptions+=a
set clipboard=unnamedplus

" Shortcut to rapidly toggle whitespaces
nmap <leader>w :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" FuzzyFinder setup
nmap ,b :FufBuffer **/<CR>
nmap ,f :FufTaggedFile **/<CR>

" Generates ctags for all files
nmap <F12> !ctags -R --extra=+f --language-force=sh .<CR>

" Git Gutter
nmap <leader>g :GitGutterToggle<CR>
highlight clear SignColumn

" Toggle spell checking
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

" Toggle line numbers
nmap <silent> <leader>l :exec "se nu!"<CR>
set number
