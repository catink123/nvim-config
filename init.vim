set nocompatible
set showmatch
set ignorecase
set hlsearch
set shiftwidth=2
set autoindent
set number
set relativenumber
set mouse=a
set wildmode=longest,list
"set cc=80
filetype plugin indent on
syntax on
filetype plugin on
set cursorline
set ttyfast

call plug#begin()
  Plug 'dracula/vim'

  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  " Plug 'romgrk/barbar.nvim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'

  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'nvim-telescope/telescope-file-browser.nvim'

  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sheerun/vim-polyglot'

  " Language plugins
  Plug 'evanleck/vim-svelte'
  Plug 'Glench/Vim-Jinja2-Syntax'
  Plug 'lervag/vimtex'
call plug#end()

" set timeoutlen=500

if (has("termguicolors"))
  set termguicolors
endif
syntax enable
" let g:dracula_colorterm = 0
colorscheme dracula

set splitright
set splitbelow

" Mappings
" nnoremap <C-q> :Telescope find_files<cr>
nnoremap <silent> <C-q> :lua require("telescope").extensions.file_browser.file_browser()<cr>
nnoremap <silent> <A-A> <Leader>c<space>

" ---------------------------

" COC Mappings
"
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <C-Space> to open completion menu
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" <CR> to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

nnoremap <space>r <Plug>(coc-rename)
nnoremap <silent> <space>f <Plug>(coc-codeaction-selected)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" ---------------------------------------

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | :set norelativenumber | :set nonumber | :set signcolumn=no | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" vim-airline Keymaps
" Move to previous/next
nnoremap <silent> <A-<> <Cmd>tabn<CR>
nnoremap <silent> <A-,> <Cmd>bn<CR>
nnoremap <silent> <A->> <Cmd>tabp<CR>
nnoremap <silent> <A-.> <Cmd>bp<CR>
" Close buffer
nnoremap <silent>    <A-c> <Cmd>bdelete<CR>
nnoremap <silent> <Space><A-c> <Cmd>bdelete!<CR>
" Commenting
nnoremap <silent> <Space>c <Plug>NERDCommenterToggle<CR>
vnoremap <silent> <Space>c <Plug>NERDCommenterToggle<CR>

" Custom commands
command! SetupCoc :CocInstall coc-tsserver coc-json coc-html coc-css coc-vue coc-angular coc-svelte coc-lua coc-snippets coc-emmet
" NERDCommenter Settings
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_js = 1

" vim-airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Don't hide buffers
" autocmd WinClosed * if &buftype == '' && !&modified | :bdelete | endif
" Remove search highlight keymap
nnoremap <Space>/ <Cmd>nohls<CR>

" Russian langmap
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-l> <C-^>
