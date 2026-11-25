return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup()
		wk.add({
			{ "<leader>f", group = "Find (Telescope)" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Hunk" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>c", group = "Config" },
			{ "<leader>d", group = "Debug" },
		})
	end,
}
