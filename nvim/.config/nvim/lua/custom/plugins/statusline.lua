-- 1. Install lualine using your pack manager
vim.pack.add { gh 'nvim-lualine/lualine.nvim' }

-- 2. Mimic LazyVim's "init" behavior to prevent flickering on startup
vim.g.lualine_laststatus = vim.o.laststatus
if vim.fn.argc(-1) > 0 then
  vim.o.statusline = ' '
else
  vim.o.laststatus = 0
end

-- 3. Run the setup configuration
require('lualine').setup {
  options = {
    theme = 'tokyonight-night', -- Blends with your active theme
    globalstatus = true, -- Locks a single bar across all window splits
    disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter', 'snacks_dashboard' } },

    -- Classic Powerline Style: Uses solid and hollow ">" shapes to cut sections
    section_separators = { left = '', right = '' }, -- Solid triangle dividers
    component_separators = { left = '', right = '' }, -- Thin chevron sub-dividers
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },

    lualine_c = {
      {
        'diagnostics',
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' ',
        },
      },
      {
        'filetype',
        icon_only = true,
        separator = '',
        padding = { left = 1, right = 0 },
        cond = function() return not string.match(vim.bo.filetype, 'snacks_picker') end,
      },
      {
        'filename',
        path = 1,
        cond = function() return not string.match(vim.bo.filetype, 'snacks_picker') end,
      },
    },

    lualine_x = {
      -- Displays search count or active command inputs from Noice
      {
        function() return require('noice').api.status.command.get() end,
        cond = function() return package.loaded['noice'] and require('noice').api.status.command.has() end,
        color = { fg = '#7aa2f7' },
      },
      -- Displays active macro recording state (e.g., recording @q)
      {
        function() return require('noice').api.status.mode.get() end,
        cond = function() return package.loaded['noice'] and require('noice').api.status.mode.has() end,
        color = { fg = '#e0af68' },
      },
      -- Displays active DAP debugging status if a debugging session is live
      {
        function() return '  ' .. require('dap').status() end,
        cond = function() return package.loaded['dap'] and require('dap').status() ~= '' end,
        color = { fg = '#f7768e' },
      },
      -- Displays Git diff metrics directly from Gitsigns
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
      },
    },

    lualine_y = {
      { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
      { 'location', padding = { left = 0, right = 1 } },
    },

    lualine_z = {
      function() return ' ' .. os.date '%R' end, -- Digital 24hr clock
    },
  },
}
