return {

	"laytan/cloak.nvim",

	config = function()
		require("cloak").setup({
			enabled = true,
			cloak_character = "*",
			-- the applied highlight group (colors) on the cloaking, see `:h highlight`.
			highlight_group = "comment",
			-- applies the length of the replacement characters for all matched
			-- patterns, defaults to the length of the matched pattern.
			cloak_length = nil, -- provide a number if you want to hide the true length of the value.
			-- whether it should try every pattern to find the best fit or stop after the first.
			try_all_patterns = true,
			-- set to true to cloak telescope preview buffers. (required feature not in 0.1.x)
			cloak_telescope = true,
			-- re-enable cloak when a matched buffer leaves the window.
			cloak_on_leave = false,
			patterns = {
				{
					-- match any file starting with '.env'.
					-- this can be a table to match multiple file patterns.
					file_pattern = ".env*",
					-- match an equals sign and any character after it.
					-- this can also be a table of patterns to cloak,
					-- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
					cloak_pattern = "=.+",
					-- a function, table or string to generate the replacement.
					-- the actual replacement will contain the 'cloak_character'
					-- where it doesn't cover the original text.
					-- if left empty the legacy behavior of keeping the first character is retained.
					replace = nil,
				},
			},
		})
	end,
}

