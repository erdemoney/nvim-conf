" Plugins
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"Startify settings
let g:startify_custom_header = [
\ '      ___           ___           ___                                    ___     ',
\ '     /__/\         /  /\         /  /\          ___        ___          /__/\    ',
\ '     \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\   ',
\ '      \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\  ',
\ '  _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\ ',
\ ' /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\',
\ ' \  \:\~~\~~\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/',
\ '  \  \:\  ~~~   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\      ',
\ '   \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\     ',
\ '    \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\    ',
\ '     \__\/         \__\/         \__\/           ~~~~                   \__\/    ',
\ ]

"General Vim Settings
set showmatch               " Show matching brackets.
set expandtab               " Insert spaces when TAB is pressed.
set tabstop=4               " Render TABs using this many spaces.
set shiftwidth=4            " Indentation amount for < and > commands.
set title                   " Show current file as window title
set clipboard=unnamedplus   " Share vim clipboard and system clipboard
set autowriteall
set splitbelow              " Set default split to below.        
set splitright              " Set default vsplit to right.
set rtp+=/usr/local/opt/fzf

"Keybindings
map <C-p>	  :Files<CR>	
map <C-f>	  :Rg<CR>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" move between splits without the ctrl-w prefix
nnoremap <silent><C-J> <C-W><C-J>:call Splitresize()<CR>
nnoremap <silent><C-K> <C-W><C-K>:call Splitresize()<CR>
nnoremap <silent><C-L> <C-W><C-L>:call Splitresize()<CR>
nnoremap <silent><C-H> <C-W><C-H>:call Splitresize()<CR>

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
endfunction

" Resize the current split to at least (90,25) but no more than (140,60)
" or 2/3 of the available space otherwise.
function Splitresize()
    let hmax = max([winwidth(0), float2nr(&columns*0.66), 90])
    let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
    exe "vertical resize" . (min([hmax, 140]))
    exe "resize" . (min([vmax, 60]))
endfunction
