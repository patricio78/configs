-- first we need to configure our custom server
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

configs.protobuf_language_server = {
    default_config = {
        cmd = { '/opt/homebrew/bin/protobuf-language-server' },
        filetypes = { 'proto', 'cpp' },
        root_dir = util.root_pattern('.git'),
        single_file_support = true,
        settings = {
        },
    }
}

-- then we can continue as we do with official servers
local lspconfig = require('lspconfig')
vim.lsp.config("protobuf_language_server", {
})
