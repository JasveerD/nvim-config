return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = {
			"c", "cpp", "python", "rust", "lua",
			"typescript", "javascript", "json", "yaml", "markdown",
		},
		highlight = { enable = true },
	},
}
