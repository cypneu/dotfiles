if not _G.is_google3() then return end

-- [[ DIFF CONFIGURATION ]]
-- Using mini.diff with Google-specific diff-source.nvim for jj, hg, and p4.

-- Install diff-source.nvim (Google internal plugin)
vim.pack.add { 'sso://user/idk/diff-source.nvim' }

-- Configuration runs after plugins are loaded
local diff_source = require 'diff-source'

require('mini.diff').setup {
  view = {
    style = 'sign',
    signs = { add = '+', change = '~', delete = '_' },
  },
  mappings = {
    -- Textobject for hunk range under cursor (e.g., visually select hunk)
    textobject = '<leader>vh',
  },
  source = {
    diff_source.jj(),
    diff_source.hg(),
    diff_source.p4(),
  },
}

-- Sync highlight groups with SignColumn to match your colorscheme
local sync_diff_hl = function()
  local groups = { 'MiniDiffSignAdd', 'MiniDiffSignChange', 'MiniDiffSignDelete' }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { link = 'SignColumn' })
  end
end

-- Keep highlights in sync when colorscheme changes
sync_diff_hl()
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('DiffSourceGroup', { clear = true }),
  callback = sync_diff_hl,
})

-- Keymaps
vim.keymap.set('n', '<leader>vd', diff_source.full_window_diff, { desc = '[V]iew [D]iff File' })
vim.keymap.set('n', '<leader>vo', MiniDiff.toggle_overlay, { desc = 'Diff [O]verlay' })
vim.keymap.set('n', '<leader>vu', function() return MiniDiff.operator 'reset' .. '<leader>vh' end, { expr = true, remap = true, desc = 'Diff Hunk [U]ndo' })
