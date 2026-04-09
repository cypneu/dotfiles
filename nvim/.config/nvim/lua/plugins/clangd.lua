return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.clangd = opts.servers.clangd or {}

      local clangd = vim.fn.exepath("clangd")
      local gxx = vim.fn.exepath("g++-15")
      local gcc = vim.fn.exepath("gcc-15")

      opts.servers.clangd.cmd = {
        clangd ~= "" and clangd or "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        "--query-driver=" .. table.concat(
          vim.tbl_filter(function(x)
            return x and x ~= ""
          end, { gxx, gcc }),
          ","
        ),
      }
    end,
  },
}
