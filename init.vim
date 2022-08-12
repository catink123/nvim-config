set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set number
set wildmode=longest,list
"set cc=80
filetype plugin indent on
syntax on
set mouse=a
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
call plug#end()

set timeoutlen=500

if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme dracula

set splitright
set splitbelow

" Mappings
" nnoremap <C-q> :Telescope find_files<cr>
nnoremap <C-q> :lua require("telescope").extensions.file_browser.file_browser()<cr>
nnoremap <silent> <A-A> <Leader>c<space>

" COC Mappings

" Insert <tab> when previous text is space, refresh completion if not.

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" <C-Space> to open completion menu
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" <CR> to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | :set nonumber | endif
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

" BarBar Config (NOT ACTIVE)
" Move to previous/next
" nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
" nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
" nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent> <A-<> <Cmd>tabn<CR>
nnoremap <silent> <A-,> <Cmd>bn<CR>
" nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
nnoremap <silent> <A->> <Cmd>tabp<CR>
nnoremap <silent> <A-.> <Cmd>bp<CR>
" Goto buffer in position...
" nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
" nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
" nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
" nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
" nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
" nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
" nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
" nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
" nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
" nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
" nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
" Close buffer
" nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
nnoremap <silent>    <A-c> <Cmd>bdelete<CR>
nnoremap <silent> <Space><A-c> <Cmd>bdelete!<CR>
" Magic buffer-picking mode
" nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
" Commenting
nnoremap <silent> <Space>c <Plug>NERDCommenterToggle<CR>
vnoremap <silent> <Space>c <Plug>NERDCommenterToggle<CR>

" Custom commands
command! SetupCoc :CocInstall coc-tsserver coc-json coc-html coc-css coc-vue coc-angular coc-svelte coc-lua coc-snippets
" NERDCommenter Settings
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_js = 1

" vim-airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
