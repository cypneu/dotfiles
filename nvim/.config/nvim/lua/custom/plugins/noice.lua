-- Noice requires nui.nvim as a UI component dependency
vim.pack.add { gh 'MunifTanjim/nui.nvim' }
vim.pack.add { gh 'folke/noice.nvim' }

require('noice').setup {
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
}

-- If a message or an LSP notification flashes by too quickly, this opens it in a popup.
vim.keymap.set('n', '<leader>nl', function() require('noice').cmd 'last' end, { desc = '[N]oice Show [L]ast Message' })

-- View Full Message History
vim.keymap.set('n', '<leader>nh', function() require('noice').cmd 'history' end, { desc = '[N]oice [H]istory Log' })

vim.keymap.set("n", "<leader>na", function() require("noice").cmd("all") end, { desc = "[N]oice Show [A]ll Messages" })
