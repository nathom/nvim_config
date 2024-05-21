return {
	"rcarriga/nvim-dap-ui",
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		require("nvim-dap-virtual-text").setup()
		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
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
}
