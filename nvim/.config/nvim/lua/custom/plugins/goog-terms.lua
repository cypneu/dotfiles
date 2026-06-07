if not (_G.is_google3 and _G.is_google3()) then return end
-- Install and configure goog-terms.nvim
vim.pack.add { 'sso://user/vintharas/goog-terms.nvim' }
require('goog-terms').setup {
  tooltip_key = '<Leader>gt', -- Key to show tooltip
  action_key = '<Leader>ga', -- Key to perform action
}
