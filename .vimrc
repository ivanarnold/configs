execute pathogen#infect()
syntax on
filetype plugin indent on

let g:syntastic_python_checkers = ['flake8']

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1

set viewoptions=cursor,folds,slash,unix
let mapleader=","
set pastetoggle=<leader>v

set hidden
set number
set laststatus=2
set noswapfile

colorscheme desert


let fortran_fold=1
let fortran_fold_conditionals=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

map <leader>z :!python3 % <CR>
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
nnoremap <leader>fw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" Detects if file has folds and shows them.
function HasFolds()
    "Attempt to move between folds, checking line numbers to see if it worked.
    "If it did, there are folds.

    function! HasFoldsInner()
        let origline=line('.')
        :norm zk
        if origline==line('.')
            :norm zj
            if origline==line('.')
                return 0
            else
                return 1
            endif
        else
            return 1
        endif
        return 0
    endfunction

    let l:winview=winsaveview() "save window and cursor position
    let foldsexist=HasFoldsInner()
    if foldsexist
        set foldcolumn=1
    else
        "Move to the end of the current fold and check again in case the
        "cursor was on the sole fold in the file when we checked
        if line('.')!=1
            :norm [z
            :norm k
        else
            :norm ]z
            :norm j
        endif
        let foldsexist=HasFoldsInner()
        if foldsexist
            set foldcolumn=1
        else
            set foldcolumn=0
        endif
    end
    call winrestview(l:winview) "restore window/cursor position
endfunction

au CursorHold,BufWinEnter ?* call HasFolds()
