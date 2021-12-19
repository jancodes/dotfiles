" Get onedark theme for iterm2
" Escape+ options key in iterm for mac
" Change OS key repeat

lua require("plugins")
lua require("lsp")
lua require("commands")

let mapleader = " "

" no highlight
nmap <leader>nh :noh<CR>

" close panel hotkey
nmap <leader>wq <C-w>q

"remaps paste to delete then paste first
xnoremap <silent> p p:let @+=@0<CR>:let @"=@0<CR>

" vim sneak
" use cl (change letter) and cc (change line) instead
" overwritten by sneak

" this allows you to press s again to search next (if you don't move cursor)
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1

let g:sneak#prompt = '🕵'
let g:sneak#prompt = '🔎'

highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

map s <Plug>Sneak_s
map S <Plug>Sneak_S

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

map J <Nop>

" navigation remapping leader + h same as ctrl w h
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>cw :wincmd w<CR>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" buffers
nmap <silent> [b :bprevious<CR>
nmap <silent> ]b :bnext<CR>
nmap <silent> [B :bfirst<CR>
nmap <silent> ]B :blast<CR>

nmap <leader>ut :UndotreeShow<CR>

" telescope mappings
nmap <C-f> <cmd>Telescope find_files<cr>

nmap <C-g> <cmd>Telescope live_grep<cr>

nmap <C-b> <cmd>Telescope buffers<cr>

" Cheatsheet
nmap <leader>cs :Cheatsheet<CR>

" RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
nmap <leader>rp :RainbowParentheses!!<CR>

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" vim settings
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set backspace=indent,eol,start
set clipboard=unnamedplus " use system clipboard
set history=200
" added for signify
set updatetime=300
au FocusGained,BufEnter * checktime

"line number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" split config
set splitbelow
set splitright
