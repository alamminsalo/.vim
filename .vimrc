set number
set cindent
set ts=4 sw=4
set nocompatible
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on
nnoremap <C-n> :NERDTreeToggle<CR>
set t_Co:16
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:syntastic_cpp_check_header=1
set completeopt=menu,menuone
set laststatus=2
let g:airline_theme='airlineish'
