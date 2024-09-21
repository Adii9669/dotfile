return {
  --LSPConfig: Integrates Mason with nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "ts_ls", "lua_ls" }, -- Add the LSPs you need
        automatic_installation = true,
      })
    end
  },

  -- LSPConfig: Basic LSP setup for Neovim
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Default LSP mappings and settings
      local lspconfig = require("lspconfig")

      -- List of servers to setup
      local servers = { "clangd",  "ast_grep","pyright", "ts_ls", "lua_ls" } -- Add or modify the servers you want

      -- Loop through the servers and set them up
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          on_attach = function(_, bufnr)
            -- Example key mappings
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
          end,
          capabilities = require('cmp_nvim_lsp').default_capabilities()
        })
      end
    end
  },


}
