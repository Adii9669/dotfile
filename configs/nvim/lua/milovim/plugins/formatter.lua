return {
	"mhartington/formatter.nvim",

	config = function()
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,

			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
			},
			-- Use the special "*" filetype for defining formatter configurations on
			["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
		})
	end,
}
