local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Color Themes
	require("user.plugins.solarized"),
	require("user.plugins.dracula"),
	require("user.plugins.vim-snazzy"),
	require("user.plugins.monokai"),

	-- Todo Comments Hightlight
	require("user.plugins.todo-comments"),

	-- Markdown
	require("user.plugins.nvim-surround"),
	require("user.plugins.markdown-preview"),
	require("user.plugins.vim-table-mode"),
	require("user.plugins.nvim-telescope"),

	--Align
	require("user.plugins.vim-easy-align"),

	-- LSP
	require("user.plugins.mason"),
	require("user.plugins.mason-lspconfig"),
	require("user.plugins.nvim-cmp"),

	-- Keymap
	require("user.plugins.which-key"),

	-- File Explorer
	require("user.plugins.nvim-tree"),

	-- Outline
	require("user.plugins.symbols-outline"),

	require("user.plugins.nvim-treesitter"),
})
