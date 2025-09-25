return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		require("codeium").setup {
			enable_chat = false,
			enable_cmp_source = false,
			virtual_text = {
				enabled = false,
				default_filetype_enabled = true,
			},
		}
	end,
}
