execute pathogen#infect()
syntax on
filetype plugin indent on

let g:notes_directories = ['~/Dropbox/Shared Notes']
let mapleader=","

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

map <Leader>x :w!<CR>:w!/home/ivan/.tmp/vim-markdown.md<CR>:!pandoc -s -f markdown -t html -o /home/ivan/.tmp/vim-markdown.html /home/ivan/.tmp/vim-markdown.md<CR>:!surf file:///home/ivan/.tmp/vim-markdown.html > /dev/null 2> /dev/null&<CR><CR>
