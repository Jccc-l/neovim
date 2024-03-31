return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		local opts =
		{
			icons = {
				breadcrumb = "-", -- symbol used in the command line area that shows your active key combo
				separator = "-", -- symbol used between a key and it's label
				group = "-", -- symbol prepended to a group
			},
			mode = "n", -- NORMAL mode
			-- prefix: use "<leader>f" for example for mapping everything related to finding files
			-- the prefix is prepended to every mapping part of `mappings`
			prefix = " ",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = false, -- use `nowait` when creating keymaps
			expr = false, -- use `expr` when creating keymaps
		}
		local mappings = {
			f = {
				name = "Telescope",
				a = { function()
					require('telescope').extensions.ctags_outline.outline(require('telescope.themes')
						.get_dropdown({}))
				end, "Outline" },
				b = { function() require('telescope.builtin').buffers(require("telescope.themes").get_dropdown({})) end, "Buffer" },
				c = { function() require('telescope.builtin').commands(require("telescope.themes").get_ivy({})) end, "Command" },
				f = { function() require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({})) end, "Files" },
				g = { function() require('telescope.builtin').live_grep() end, "Global Search" },
				-- TODO: Switch from vimscript to lua
				t = { "<cmd>Telescope todo-comments<CR>", "TODO" },
			},
			l = {
				name = "LSP",
				f = { vim.lsp.buf.format, "Format" },
			},
			e = { require("nvim-tree.api").tree.toggle, "File Explorer" },
		}
		wk.register(mappings, opts)
	end
}
