set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua require('bar')
lua require('debugging')
lua require('custom-keys')
lua require('rust')
lua require('treesitter')

lua vim.loader.enable()
