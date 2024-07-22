return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason-lspconfig").setup({
			-- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
			-- This setting has no relation with the `automatic_installation` setting.
			---@type string[]
			ensure_installed = { "clangd", "lua_ls", "jdtls", "marksman", "texlab", "lemminx", "pyright" },

			-- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
			-- This setting has no relation with the `ensure_installed` setting.
			-- Can either be:
			--   - false: Servers are not automatically installed.
			--   - true: All servers set up via lspconfig are automatically installed.
			--   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
			--       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
			---@type boolean
			automatic_installation = true,

			-- See `:h mason-lspconfig.setup_handlers()`
			---@type table<string, fun(server_name: string)>?
			handlers = nil,
		})
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
		require('lspconfig')['clangd'].setup {
			capabilities = capabilities
		}
		require('lspconfig')['lua_ls'].setup {
			capabilities = capabilities
		}
		require('lspconfig')['marksman'].setup {
			capabilities = capabilities
		}
		require('lspconfig')['jdtls'].setup {
			capabilities = capabilities
		}
		require('lspconfig')['texlab'].setup {
			capabilities = capabilities
		}
		require('lspconfig')['pyright'].setup {
			capabilities = capabilities
		}
		require('lspconfig')['lemminx'].setup {
			capabilities = capabilities
		}
	end
}
