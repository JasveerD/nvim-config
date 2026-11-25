return {
	"neovim/nvim-lspconfig",
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
			end
			local tb = require("telescope.builtin")
			map("gd",         tb.lsp_definitions,      "Go to definition")
			map("gr",         tb.lsp_references,        "Go to references")
			map("gI",         tb.lsp_implementations,   "Go to implementation")
			map("<leader>lt", tb.lsp_type_definitions,  "Type definition")
			map("<leader>ls", tb.lsp_document_symbols,  "Document symbols")
			map("<leader>lw", tb.lsp_workspace_symbols, "Workspace symbols")
			map("<leader>lr", vim.lsp.buf.rename,        "Rename symbol")
			map("<leader>la", vim.lsp.buf.code_action,   "Code action")
			map("K",          vim.lsp.buf.hover,         "Hover docs")
			map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
			map("[d",         vim.diagnostic.goto_prev,  "Prev diagnostic")
			map("]d",         vim.diagnostic.goto_next,  "Next diagnostic")
			map("<leader>ld", vim.diagnostic.open_float, "Diagnostic float")
		end

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN]  = " ",
					[vim.diagnostic.severity.HINT]  = "󰠠 ",
					[vim.diagnostic.severity.INFO]  = " ",
				},
			},
			virtual_text     = false,
			underline        = true,
			update_in_insert = false,
			float            = { border = "rounded" },
		})

		vim.lsp.config("pyright", { capabilities = capabilities, on_attach = on_attach })
		vim.lsp.config("clangd",  { capabilities = capabilities, on_attach = on_attach })
		vim.lsp.config("lua_ls",  {
			capabilities = capabilities,
			on_attach    = on_attach,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace   = { checkThirdParty = false },
				},
			},
		})
		vim.lsp.config("rust_analyzer", { on_attach = on_attach })

		vim.lsp.enable({ "pyright", "clangd", "lua_ls", "rust_analyzer" })

		if vim.fn.executable("swipl") == 1 then
			vim.lsp.config("prolog_ls", { capabilities = capabilities, on_attach = on_attach })
			vim.lsp.enable({ "prolog_ls" })
		end

		if vim.fn.executable("asm-lsp") == 1 then
			vim.lsp.config("asm_lsp", { capabilities = capabilities, on_attach = on_attach })
			vim.lsp.enable({ "asm_lsp" })
		end
	end,
}
