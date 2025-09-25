return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		-- Snippet Engine
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				-- Disable on Windows
				if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {},
		},
		"folke/lazydev.nvim",
		"Exafunction/codeium.nvim",
	},
	--- @module "blink.cmp"
	--- @type blink.cmp.Config
	opts = {
		keymap = {
			-- <c-y>: Accept ([y]es) the completion.
			-- <tab>/<s-tab>: Move to right/left of your snippet expansion
			-- <c-space>: Open menu or open docs if already open
			-- <c-n>/<c-p> or <up>/<down>: Select next/previous item
			-- <c-e>: Hide menu
			-- <c-k>: Toggle signature help
			preset = "default",
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			-- By default, you may press `<c-space>` to show the documentation.
			-- Optionally, set `auto_show = true` to show the documentation after a delay.
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},

		sources = {
			default = { "lsp", "path", "snippets", "lazydev", "codeium" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
        codeium = { name = "Codeium", module = "codeium.blink", async = true },
			},
		},

		snippets = { preset = "luasnip" },

		fuzzy = { implementation = "prefer_rust_with_warning" },

		signature = { enabled = true },
	},
}
