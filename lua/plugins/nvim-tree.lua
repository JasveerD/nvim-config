return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-tree").setup({
			view = { width = 35 },
			renderer = {
				group_empty   = true,
				highlight_git = true,
				icons = { show = { git = true } },
			},
			filters = { dotfiles = false },
			git     = { enable = true },
			actions = { open_file = { quit_on_open = false } },
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				api.config.mappings.default_on_attach(bufnr)
			end,
		})
	end,
}
