return {

 --For Color-Scheme 
 {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},

  config = function() 
   vim.cmd([[colorscheme tokyonight-night]])  
  end,
  },


  {
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			vim.cmd([[colorscheme tokyodark]])
		end,
	},


  --For icons 
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
