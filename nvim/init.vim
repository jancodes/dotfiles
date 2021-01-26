" Get onedark theme for iterm2
" Escape+ options key in iterm for mac
" Change OS key repeat

" vim-polyglot has vim-jsx-pretty
let g:polyglot_disabled = ['jsx']

call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
" onedark uses vim-polygot
Plug 'mhinz/vim-signify'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
" powerline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" quickfix-reflector adds allows you to make files modifiable in the results
" list - you can also remove files lines from the result before VG
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/rainbow_parentheses.vim'
" This is for Coc extensions, but coc has bad proxy support
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'rhysd/conflict-marker.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'camspiers/lens.vim'
Plug 'tpope/vim-obsession'
": THIS MUST BE LAST PLUGIN
Plug 'ryanoasis/vim-devicons'

call plug#end()

let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 1

" jsconfig.json needed for js files to work with tsserver - use global
" .gitignore
" vscode snippet extensions - remove main field in package.json
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-css',
      \]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"onedark theme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

" airline status bar config
"let g:airline_theme='dark_minimal'
let g:airline#extensions#coc#enabled = 1
let g:airline_section_b = ""
let g:airline_section_c = '%f%m'
let g:airline_section_z = airline#section#create(['maxlinenr'])  

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" airline tabline at top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse=0
let g:airline#extensions#tabline#fnametruncate=0

let mapleader = " "

" lens.vim config
let g:lens#disabled_filetypes = ['fzf']

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

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

" Formatting selected code.
xmap <leader>fc <Plug>(coc-format-selected)
nmap <leader>fc <Plug>(coc-format-selected)

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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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

" fzf mappings
let $FZF_DEFAULT_COMMAND='rg --files --smart-case'
nmap <C-f> :Files<CR>

nmap <C-g> :Rg 

nmap <C-l> :Lines<CR>

" fzf notes for editing fzf results
" alt+a to select all, alt+d to deselect
" tab to select one at a time
" ENTER to transfer to quickfix
" in quickfix mode, you can select the files and do :s/oldterm/newterm/g

let g:fzf_layout = { 'down': '~40%' }

" RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
nmap <leader>rp :RainbowParentheses!!<CR>

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
set clipboard+=unnamedplus " use system clipboard
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

" coc settings 
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction 
let g:coc_snippet_next = '<tab>'

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

let g:coc_node_path = "/usr/local/bin/node"
