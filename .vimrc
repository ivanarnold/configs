execute pathogen#infect()
syntax on
filetype plugin indent on

set term=xterm
set t_Co=256
set updatetime=500
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']
let mapleader=","
let g:neocomplcache_enable_at_startup = 1
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:neocomplcache_enable_at_startup = 0

set hidden
set number
set laststatus=2
set noswapfile
set pastetoggle=<leader>v
set autochdir 

colorscheme elisex

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

let g:syntastic_always_populate_loc_list = 1

let fortran_fold=1
let fortran_fold_conditionals=1

" Make the C-] combination search for @tags:
imap <C-]> <C-o>:SearchNotes<CR>
nmap <C-]> :SearchNotes<CR>

"highlight Normal ctermbg=232
"au InsertEnter * hi Normal term=NONE ctermbg=235     "
"au InsertLeave * hi Normal term=NONE ctermbg=232     "
map <leader>o :browse confirm e <CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>z :!python % <CR>
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
nnoremap <leader>fw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
nmap <leader>ss :VimShell<cr>
nmap <leader>sp :VimShellPop<cr>
map  <leader>ac :NeoComplCacheEnable <cr>	
map  <leader>ad :NeoComplCacheDisable <cr>	


let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
 
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

