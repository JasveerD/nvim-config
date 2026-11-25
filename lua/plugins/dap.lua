return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local dap = require("dap")

			-- codelldb (C/C++/Rust)
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.c = {
				{
					name = "Launch",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = true,
				},
			}
			dap.configurations.cpp = dap.configurations.c
			dap.configurations.rust = dap.configurations.c

			-- debugpy (Python)
			dap.adapters.python = function(cb, config)
				if config.request == "attach" then
					cb({ type = "server", host = config.connect.host or "127.0.0.1", port = config.connect.port })
				else
					cb({
						type = "executable",
						command = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter",
					})
				end
			end

			dap.configurations.python = {
				{
					name = "Launch file",
					type = "python",
					request = "launch",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}

			-- Breakpoint signs
			vim.api.nvim_set_hl(0, "DapBreakpointSign", { fg = "#e06c75", bold = true })
			vim.api.nvim_set_hl(0, "DapCondBreakpointSign", { fg = "#e5c07b", bold = true })
			vim.api.nvim_set_hl(0, "DapLogPointSign", { fg = "#61afef", bold = true })
			vim.api.nvim_set_hl(0, "DapStoppedSign", { fg = "#98c379", bold = true })
			vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e4234" })

			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpointSign", numhl = "DapBreakpointSign" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapCondBreakpointSign", numhl = "DapCondBreakpointSign" })
			vim.fn.sign_define("DapLogPoint", { text = "◉", texthl = "DapLogPointSign", numhl = "DapLogPointSign" })
			vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStoppedSign", linehl = "DapStoppedLine", numhl = "DapStoppedSign" })

			-- Keymaps
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { desc = "Debug: " .. desc })
			end
			map("<leader>db", dap.toggle_breakpoint, "Toggle breakpoint")
			map("<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, "Conditional breakpoint")
			map("<leader>dc", dap.continue, "Continue")
			map("<leader>do", dap.step_over, "Step over")
			map("<leader>di", dap.step_into, "Step into")
			map("<leader>dO", dap.step_out, "Step out")
			map("<leader>dr", dap.restart, "Restart")
			map("<leader>dt", dap.terminate, "Terminate")
			map("<leader>dl", dap.run_last, "Run last")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dapui = require("dapui")
			dapui.setup()

			local dap = require("dap")
			dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end

			vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
			vim.keymap.set({ "n", "v" }, "<leader>de", dapui.eval, { desc = "Debug: Eval expression" })
		end,
	},
}
