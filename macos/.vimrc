set background=dark
set number
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

call plug#begin('~/.vim/plugged')

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'mrcjkb/rustaceanvim'
"Plug 'dense-analysis/ale'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'jparise/vim-graphql'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'brainfucksec/neovim-lua'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'vim-airline/vim-airline'
Plug 'voldikss/vim-floaterm'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'dhruvasagar/vim-zoom'
Plug 'preservim/nerdcommenter'
Plug 'sindrets/diffview.nvim'
Plug 'timonv/vim-cargo'
" Plug 'tpope/vim-dispatch'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-obsession'
Plug 'p00f/clangd_extensions.nvim'
Plug 'nvim-neotest/nvim-nio'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'github/copilot.vim'
Plug 'towolf/vim-helm'
Plug 'mrjosh/helm-ls'
Plug 'alexander-born/bazel.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
Plug 'theHamsta/nvim-dap-virtual-text'

call plug#end()

set cursorline

" let g:rustfmt_autosave = 1
" let g:rustfmt_emit_files = 1
" let g:rustfmt_fail_silently = 0
let g:cargo_command = "Dispatch cargo {cmd}"
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
"
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Nerdtree
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <leader>nt :NERDTreeToggle<CR>
" nnoremap <leader>nf :NERDTreeFind<CR>

function! LinterStatus() abort
      let l:counts = ale#statusline#Count(bufnr(''))

      let l:all_errors = l:counts.error + l:counts.style_error
      let l:all_non_errors = l:counts.total - l:all_errors

      return l:counts.total == 0 ? '? all good ?' : printf(
            \   '?? %dW %dE',
            \   all_non_errors,
            \   all_errors
            \)
endfunction

let g:zoom#statustext = "Z"
let g:airline_section_c = airline#section#create(['%<', 'file', g:airline_symbols.space, 'readonly', 'lsp_progress'])
let g:airline_section_c = g:airline_section_c . '%{zoom#statusline()}'

" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on
set termguicolors
colorscheme iceberg

autocmd BufWritePre * lua vim.lsp.buf.format()
