return {
  "mason.nvim",
  { 
    "williamboman/mason-lspconfig.nvim",
    config = function() 
    local keymap = vim.keymap.set
      keymap("n" , "<leader>cm" , "<CMD>Mason<CR>")
    end
  },
}
