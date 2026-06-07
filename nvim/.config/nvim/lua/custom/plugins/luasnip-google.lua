if not (_G.is_google3 and _G.is_google3()) then return end
-- Install and configure luasnip-google
vim.pack.add { 'sso://user/mccloskeybr/luasnip-google.nvim' }
require('luasnip-google').load_snippets()
