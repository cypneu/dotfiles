if not (_G.is_google3 and _G.is_google3()) then return end
-- Install and configure googlepaths.nvim
vim.pack.add { 'sso://user/fentanes/googlepaths.nvim' }
require('googlepaths').setup()
