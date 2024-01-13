return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"fcying/telescope-ctags-outline.nvim"
		}
	},
	config = function()
		require('telescope').setup {
			extensions = {
				ctags_outline = {
					--ctags option
					ctags = { 'ctags' },
					--ctags filetype option
					ft_opt = {
						vim = '--vim-kinds=fk',
						lua = '--lua-kinds=fk',
					},
				},
			},
		}
		require('telescope').load_extension('ctags_outline')
	end
}
