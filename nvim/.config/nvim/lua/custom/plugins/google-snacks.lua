if not (_G.is_google3 and _G.is_google3()) then return end
-- Install google-snacks.nvim
vim.pack.add { 'sso://user/yairhochner/google-snacks.nvim' }
local gsnacks = require 'google-snacks'
-- Configure google-snacks (Enable experimental Blaze visualizations/spinners)
gsnacks.setup {
  blaze = {
    opts = {
      viz = { enable = true },
    },
  },
}
-- 1. Safely load the jj log configuration module
local jj_log = require 'google-snacks.jj.log'
-- 2. Disable the conflicting Ctrl keymaps and explicitly restore standard scrolling
jj_log.win.input.keys['<c-b>'] = { 'preview_scroll_up', mode = { 'i', 'n' } }
jj_log.win.input.keys['<c-u>'] = { 'list_scroll_up', mode = { 'i', 'n' } }
jj_log.win.input.keys['<c-a>'] = { 'select_all', mode = { 'i', 'n' } }
jj_log.win.input.keys['<c-d>'] = { 'list_scroll_down', mode = { 'i', 'n' } }
jj_log.win.input.keys['<c-D>'] = false -- Disable the conflicting Drop CL capital D mapping
-- 3. Remap the Jujutsu actions to Alt (Meta) keys
jj_log.win.input.keys['<m-b>'] = { 'rebase_before', desc = 'Rebase Before', mode = { 'n', 'i' } }
jj_log.win.input.keys['<m-u>'] = { 'upload', desc = 'Upload', mode = { 'n', 'i' } }
jj_log.win.input.keys['<m-a>'] = { 'uploadall', desc = 'Upload All', mode = { 'n', 'i' } }
jj_log.win.input.keys['<m-d>'] = { 'cls_drop', desc = 'Drop CL (Abandon)', mode = { 'n', 'i' } }
-- 4. JJ Keymaps
vim.keymap.set('n', '<leader>jl', function() gsnacks.jj.log() end, { desc = 'JJ [L]og' })
vim.keymap.set('n', '<leader>js', function() gsnacks.jj.status() end, { desc = 'JJ [S]tatus' })
-- 5. CodeSearch and Critique Keymaps
vim.keymap.set('n', '<leader>cc', function() gsnacks.comments.list() end, { desc = 'Critique [C]omments' })
vim.keymap.set('n', '<leader>cu', function() gsnacks.comments.list { resolved = false } end, { desc = 'Critique [U]nresolved Comments' })
vim.keymap.set('n', '<leader>cs', function() gsnacks.codesearch.query() end, { desc = 'Code[S]earch Query' })
vim.keymap.set('n', '<leader>cw', function() gsnacks.codesearch.word() end, { desc = 'CodeSearch current [W]ord' })
vim.keymap.set('v', '<leader>cv', function() gsnacks.codesearch.visual() end, { desc = 'CodeSearch [V]isual Selection' })
-- 6. Blaze Keymaps
vim.keymap.set('n', '<leader>bb', function() gsnacks.blaze.build() end, { desc = 'Blaze Build' })
vim.keymap.set('n', '<leader>bt', function() gsnacks.blaze.test() end, { desc = 'Blaze Test' })
vim.keymap.set('n', '<leader>bu', function() gsnacks.blaze.test { under_cursor = true } end, { desc = 'Blaze Test Under Cursor' })
vim.keymap.set('n', '<leader>bc', function() gsnacks.blaze.build_cleaner() end, { desc = 'Blaze Build Cleaner' })
vim.keymap.set('n', '<leader>by', function() gsnacks.blaze.copy() end, { desc = 'Blaze Yank Target' })
vim.keymap.set('n', '<leader>bY', function() gsnacks.blaze.copy { under_cursor = true } end, { desc = 'Blaze Yank Target Under Cursor' })
vim.keymap.set('n', '<leader>bp', function() gsnacks.blaze.targets() end, { desc = 'Blaze Targets Picker' })
vim.keymap.set('n', '<leader>bx', function() gsnacks.blaze.commands() end, { desc = 'Blaze Commands Picker' })
vim.keymap.set('n', '<leader>bl', function() gsnacks.blaze.terminals() end, { desc = 'Blaze Active Terminals' })
