set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.config/nvim/lua
let &packpath=&runtimepath
source ~/.vimrc

lua require('debugging')
lua require('custom-keys')
