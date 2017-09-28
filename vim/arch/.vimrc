execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader=","

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

let g:notes_directories = ['~/Dropbox/Shared Notes']

map <Leader>x :w!<CR>:w!/home/ivan/.tmp/vim-markdown.md<CR>:!pandoc -s -f markdown -t html -o /home/ivan/.tmp/vim-markdown.html /home/ivan/.tmp/vim-markdown.md<CR>:!surf file:///home/ivan/.tmp/vim-markdown.html > /dev/null 2> /dev/null&<CR><CR>
