" Get onedark theme for iterm2
" Escape+ options key in iterm for mac
" Change OS key repeat

call plug#begin('~/.vim/plugged')
Plug 'monsonjeremy/onedark.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-dirvish'
" allows for unix commands in vim
Plug 'tpope/vim-eunuch'
Plug 'ap/vim-css-color'
Plug 'windwp/nvim-autopairs'
" lualine 
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" quickfix-reflector adds allows you to make files modifiable in the results
" list - you can also remove files lines from the result before VG
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/rainbow_parentheses.vim'
" repo for snippets, not a plugin
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'rhysd/conflict-marker.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'camspiers/lens.vim'
Plug 'tpope/vim-obsession'
Plug 'machakann/vim-highlightedyank'
" lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
" completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" other lsp stuff
Plug 'nvim-lua/plenary.nvim'
" telescope
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

call plug#end()

lua require("lsp")
lua require("plugins")

let mapleader = " "

"signify config
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap ]g <plug>(signify-next-hunk)
nmap [g <plug>(signify-prev-hunk)

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
