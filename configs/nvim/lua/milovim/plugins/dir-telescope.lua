return {
	"princejoogie/dir-telescope.nvim",
	-- telescope.nvim is a required dependency
	dependency = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		-- vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })

		require("dir-telescope").setup({
			-- these are the default options set
			hidden = true,
			no_ignore = false,
			show_preview = true,
		})
	end,
}

