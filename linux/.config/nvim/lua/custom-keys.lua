local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Debugging
-- Press Ctrl+d to toggle debug mode, will remove NvimTree also
map('n', '<F2>', [[:NERDTreeClose<CR> :lua require'dapui'.toggle()<CR>]], {})
-- Press f5 to debug
map('n', '<F5>', [[:lua require'dap'.continue()<CR>]], {})
-- Press F4 to toggle regular breakpoint
map('n', '<F4>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})
-- Press CTRL + c to toggle Breakpoint with Condition
map('n', '<C-c>', [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], {})
-- Press CTRL + l to toggle Logpoint
map('n', '<C-l>', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]], {})
-- Pressing F10 to step over
map('n', '<F10>', [[:lua require'dap'.step_over()<CR>]], {})
-- Pressing F11 to step into
map('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], {})
-- Pressing F12 to step out
map('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], {})
-- Press F6 to open REPL
map('n', '<F6>', [[:lua require'dap'.repl.open()<CR>]], {})
-- Press dl to run last ran configuration (if you used f5 before it will re run it etc)
map('n', 'dl', [[:lua require'dap'.run_last()<CR>]], {})

-- barbar
-- Move to previous/next
map('n', '<C-Left>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-Right>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<C-S-Left>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<C-S-Right>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<Leader>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<Leader>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<Leader>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<Leader>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<Leader>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<Leader>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<Leader>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<Leader>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<Leader>9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<Leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<C-i>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<Leader>bc', '<Cmd>BufferClose<CR>', opts)
map('n', '<Leader>be', '<Cmd>BufferRestore<CR>', opts)
map('n', '<Leader>bw', '<Cmd>BufferWipeout<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- FloaTerm configuration
map('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ", opts)
map('n', "<leader>t", ":FloatermToggle myfloat<CR>", opts)
map('t', "<Esc>", "<C-\\><C-n>:q<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
--

local keymap_opts = { buffer = buffer }
-- Code navigation and shortcuts
vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
-- Goto previous/next diagnostic warning/error
--vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
--vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymap_opts)
-- vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, keymap_opts)

--- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, {})

local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup {
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}

telescope.load_extension("live_grep_args")

-- Nerd treee
map('n', '<leader>n', [[:NERDTree<CR>]], {})
map('n', '<leader>t', [[:NERDTreeToggle<CR>]], {})
map('n', '<leader>f', [[:NERDTreeFind<CR>]], {})

-- Diff

map('n', '<leader>d', [[:DiffviewOpen<CR>]], {})
map('n', '<leader>dd', [[:DiffviewClose<CR>]], {})
