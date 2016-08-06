execute pathogen#infect()
syntax on
filetype plugin indent on

set encoding=utf-8
set term=xterm
set t_Co=256
set updatetime=500
set viewoptions=cursor,folds,slash,unix
set rtp+=~/.fzf
let mapleader=","
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
set hidden
set number
set laststatus=2
set noswapfile
set pastetoggle=<leader>v
colorscheme desert
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
let python_highlight_all=1
let g:syntastic_always_populate_loc_list = 1
let fortran_fold=1
let fortran_fold_conditionals=1

"highlight Normal ctermbg=232
"au InsertEnter * hi Normal term=NONE ctermbg=235     "
"au InsertLeave * hi Normal term=NONE ctermbg=232     "
"
map <leader>z :!python % <CR>
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
nnoremap <leader>fw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <leader>b :SCCompile<cr>
nmap <leader>r :SCCompileRun<cr>
nmap <leader>ss :VimShell<cr>
nmap <leader>sp :VimShellPop<cr>
nnoremap <silent> > :exe "vertical resize" . (winheight(0) * 3/2)<CR>
nnoremap <silent> < :exe "vertical resize" . (winheight(0) * 2/3)<CR>
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 2/3)<CR>

let g:diminactive_use_syntax = 1
let g:diminactive_use_colorcolumn = 0
hi ColorColumn ctermbg=0 guibg=#eee8d5

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


function! NumberToggle()
  if(&rnu == 0 && &nu == 0)
    set nu
  elseif(&nu == 1)
    set nonu
    set rnu
  else
    set nornu
  endif
endfunc


nnoremap <leader>t :call NumberToggle()<cr>
