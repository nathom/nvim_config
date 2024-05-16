return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			-- local dap = require("dap")
			-- dap.setup()
			-- local utils = require("utils")
			-- local HOME = utils.HOME
			-- local mason_path = utils.mason_path
			-- dap.adapters.executable = {
			-- 	type = "executable",
			-- 	command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
			-- 	name = "lldb1",
			-- 	host = "127.0.0.1",
			-- 	port = 13000,
			-- }
			-- dap.adapters.codelldb = {
			-- 	name = "codelldb server",
			-- 	type = "server",
			-- 	port = "${port}",
			-- 	executable = {
			-- 		command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
			-- 		args = { "--port", "${port}" },
			-- 	},
			-- }
			-- dap.configurations.cpp = {
			-- 	{
			-- 		name = "Launch",
			-- 		type = "lldb",
			-- 		request = "launch",
			-- 		program = function()
			-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- 		end,
			-- 		cwd = "${workspaceFolder}",
			-- 		stopOnEntry = false,
			-- 		args = {},
			-- 		runInTerminal = true,
			-- 	},
			-- }
			-- dap.adapters.python = {
			-- 	type = "executable",
			-- 	command = mason_path("debugpy-adapter"),
			-- }
			-- dap.configurations.python = {
			-- 	{
			-- 		type = "python",
			-- 		request = "launch",
			-- 		name = "Launch file",
			-- 		program = "${file}",
			-- 		pythonPath = function()
			-- 			return HOME .. "/.pyenv/shims/python"
			-- 		end,
			-- 	},
			-- }
		end,
		keys = {
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				mode = { "n" },
				desc = "Continue debugger",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				mode = { "n" },
				desc = "Toggle breakpoint",
			},
			{
				"<leader>ds",
				function()
					require("dap").step_into()
				end,
				mode = { "n" },
				desc = "Step into",
			},
			{
				"<leader>dS",
				function()
					require("dap").step_into()
				end,
				mode = { "n" },
				desc = "Step over",
			},
		},
	},
}
