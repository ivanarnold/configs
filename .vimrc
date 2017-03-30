execute pathogen#infect()
syntax on
filetype plugin indent on
let mapleader=","


set noswapfile
set pastetoggle=<leader>v
set hidden
set laststatus=2
set tabstop=2
set number
colorscheme desert
set nofoldenable


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set foldmethod=manual

let g:cellmode_tmux_sessionname=''  " Will try to automatically pickup tmux session
let g:cellmode_tmux_windowname=''
let g:cellmode_tmux_panenumber='1'

let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
let g:syntastic_python_checkers=['pep8']
let g:syntastic_python_pep8_args= "--ignore=E121,E122,E123,E124,E125,E126,E127,E128,E241,E266"
let g:pep8_ignore="E121,E122,E123,E124,E125,E126,E127,E128,E241,E266"

let g:instant_markdown_slow=1
let g:instant_markdown_autostart=0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8']

let g:slime_target = "tmux"
map <leader>r :Ranger<CR>

:nnoremap <silent> <leader>fw :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

