return {
	"neovim/nvim-lspconfig",

	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("de1ay-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(mode, keys, func, desc)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("n", "K", vim.lsp.buf.hover, "Brief info")
				map("n", "gd", require("telescope.builtin").lsp_definitions, "Go to definition")
				map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				map("n", "gi", require("telescope.builtin").lsp_implementations, "List implementations")
				map("n", "gt", require("telescope.builtin").lsp_type_definitions, "Go to type definition")
				map("n", "gr", require("telescope.builtin").lsp_references, "Show references")
				map("n", "<leader>cr", vim.lsp.buf.rename, "Rename all references")
				map({ "n", "x" }, "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format code")
				map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
			end,
		})

		vim.diagnostic.config {
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		}

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}

					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end
}
