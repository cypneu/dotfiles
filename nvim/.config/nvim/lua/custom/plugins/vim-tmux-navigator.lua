-- [[ TMUX NAVIGATOR ]]
-- Seamless navigation between tmux panes and neovim splits
vim.pack.add { gh 'christoomey/vim-tmux-navigator' }

-- Tell the plugin not to set its own default mappings
-- so your explicit custom ones take precedence cleanly
vim.g.tmux_navigator_no_mappings = 1

-- Map the navigation commands for both Normal mode ('n') and Terminal mode ('t')
-- Adding Terminal mode allows you to escape an active terminal split using Ctrl+hjkl!
vim.keymap.set({ 'n', 't' }, '<c-h>', '<cmd>TmuxNavigateLeft<cr>', { desc = 'Move to Left Split/Pane' })
vim.keymap.set({ 'n', 't' }, '<c-j>', '<cmd>TmuxNavigateDown<cr>', { desc = 'Move to Lower Split/Pane' })
vim.keymap.set({ 'n', 't' }, '<c-k>', '<cmd>TmuxNavigateUp<cr>', { desc = 'Move to Upper Split/Pane' })
vim.keymap.set({ 'n', 't' }, '<c-l>', '<cmd>TmuxNavigateRight<cr>', { desc = 'Move to Right Split/Pane' })
vim.keymap.set({ 'n', 't' }, '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>', { desc = 'Move to Previous Split/Pane' })
