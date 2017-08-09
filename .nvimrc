set rtp+=~/.config/nvim/bundle/Vundle.vim
let path='~/.config/nvim/bundle'
call vundle#begin(path)
    Plugin 'gmarik/Vundle.vim'
    Plugin 'randy3k/wombat256.vim'
    Plugin 'godlygeek/tabular'
    Plugin 'LaTeX-Box-Team/LaTeX-Box'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'kassio/neoterm'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'JuliaEditorSupport/julia-vim'
    " Plugin 'epeli/slimux'
    " Plugin 'terryma/vim-multiple-cursors'
    " Plugin 'jalvesaq/Nvim-R'
call vundle#end()


syntax enable
filetype plugin on
filetype indent on
set mouse=a
set wildignorecase
if &buftype != 'terminal'
    set number
end
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set backspace=2
set clipboard=unnamed
" set notimeout
" set ttimeout
if has("gui_vimr")
    set termguicolors
endif

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#ff8787'
let g:terminal_color_2  = '#87d75f'
let g:terminal_color_3  = '#ffd75f'
let g:terminal_color_4  = '#87afff'
let g:terminal_color_5  = '#af87ff'
let g:terminal_color_6  = '#d7ff87'
let g:terminal_color_7  = '#bfbfbf'
let g:terminal_color_8  = '#000000'
let g:terminal_color_9  = '#ff8787'
let g:terminal_color_10 = '#87d75f'
let g:terminal_color_11 = '#ffd75f'
let g:terminal_color_12 = '#87afff'
let g:terminal_color_13 = '#af87ff'
let g:terminal_color_14 = '#d7ff87'
let g:terminal_color_15 = '#bfbfbf'

color wombat256mod
let g:airline_theme='wombat'
let g:airline_powerline_fonts=1
set laststatus =2
set ttimeoutlen=50

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let mapleader = " "
let g:NERDSpaceDelims = 1

noremap <C-f> <C-d>
noremap <C-b> <C-u>

tnoremap <esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
inoremap jk <esc>
cnoremap jk <C-c>

nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W

let g:neoterm_autoscroll = 1
augroup neoterm_keybinds
    autocmd!
    " autocmd filetype r,python inoremap <buffer> <silent> <C-j> <esc>:TREPLSendLine<CR>jI
    autocmd filetype r,python,julia nnoremap <buffer> <silent> <C-j> :TREPLSendLine<CR>j
    autocmd filetype r,python,julia vnoremap <buffer> <silent> <C-j> :TREPLSendSelection<CR>gv
augroup end
nnoremap <C-k> <Up>
nnoremap <C-l> <Right>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" disable ctrlp default keybind
let g:ctrlp_map = ''

autocmd! VimEnter * call s:fcy_nerdcommenter_map()
function! s:fcy_nerdcommenter_map()
    nmap <leader>cc <plug>NERDCommenterToggle
    vmap <leader>cc <plug>NERDCommenterToggle gv
endfunction

" spacemacs like keybinds

" zoom / restore window
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        exec t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()

function! s:WinLayoutToggle() abort
    if exists('t:horizonal') && t:horizonal
        let t:horizonal = 0
        execute "windo wincmd K"
    else
        let t:horizonal = 1
        execute "windo wincmd H"
    endif
endfunction
command! WinLayoutToggle call s:WinLayoutToggle()

nmap <Leader>bb :buffers<CR>
nmap <Leader>bd :bdelete<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>br :e<CR>

nmap <Leader>rc :e ~/.nvimrc<CR>
nmap <Leader>rr :source ~/.nvimrc<CR>
nmap <Leader>ff :CtrlPCurFile<CR>
nmap <Leader>fr :CtrlPMRU<CR>
nmap <Leader>fs :w<CR>
nmap <Leader>fS :wa<CR>
nmap <Leader>ft :NERDTreeToggle<CR>

nmap <Leader>tn :set number!<CR>
nmap <Leader>tl :set wrap!<CR>

nnoremap <silent> <Leader>l :nohlsearch<CR><C-l>

nmap <Leader>w- :sp<CR>
nmap <Leader>w\ :vsp<CR>
nmap <Leader>w<Bar> :vsp<CR>
nmap <Leader>w= <C-w>=
nmap <Leader>w+ :ZoomToggle<CR>
nmap <Leader>wt :WinLayoutToggle<CR>
nmap <Leader>wc :q<CR>
nmap <Leader>wh <C-w>h
nmap <Leader>wH <C-w>H
nmap <Leader>wj <C-w>j
nmap <Leader>wk <C-w>k
nmap <Leader>wl <C-w>l
nmap <Leader>wL <C-w>L
nmap <Leader>w<left> <C-w><
nmap <Leader>w<right> <C-w>>
nmap <Leader>ws <C-w>s
nmap <Leader>wv <C-w>v
nmap <Leader>ww <C-w><C-w>
