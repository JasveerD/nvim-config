return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				separator_style         = "slant",
				show_buffer_close_icons = true,
				show_close_icon         = false,
			},
		})
	end,
}
