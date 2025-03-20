set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua require('bar')
lua require('debugging')
lua require('custom-keys')
lua require('rust')
lua require('treesitter')
lua require('clangd')
"lua require('java')
lua require('typescript')
lua require('helm')
lua require('go-init')

lua require("nvim-dap-virtual-text").setup()

lua vim.loader.enable()
