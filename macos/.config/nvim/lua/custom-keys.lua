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
map('n', '<C-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<Leader>bc', '<Cmd>BufferClose<CR>', opts)
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

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
--
