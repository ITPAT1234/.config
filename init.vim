syntax on
set guicursor=
set noshowmatch
set noshowmode
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set updatetime=50
set shortmess+=c
set encoding=utf-8
set signcolumn=yes


highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin(stdpath('data') . '/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'styled-components/vim-styled-components', { 'branch': 'main'  }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release'  }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:coc_global_extensions = [ 'coc-tsserver','coc-prettier', 'coc-pyright','coc-eslint','coc-html','coc-css' ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>nn <cmd>NERDTreeToggle<cr>
nnoremap <leader>ft <cmd>Telescope grep_string<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').grep_string()<cr>

set completeopt=menuone,noinsert
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach }
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}

EOF




