return {
	"gsuuon/model.nvim",

	-- Don't need these if lazy = false
	cmd = { "M", "Model", "Mchat" },
	init = function()
		vim.filetype.add({
			extension = {
				mchat = "mchat",
			},
		})
	end,
	ft = "mchat",

	keys = {
		{ "<C-m>d", ":Mdelete<cr>", mode = "n" },
		{ "<C-m>s", ":Mselect<cr>", mode = "n" },
		{ "<C-m><space>", ":Mchat<cr>", mode = "n" },
	},

	-- To override defaults add a config field and call setup()

	config = function()
		require("model.providers.openai").initialize({
			model = "gpt-4o-mini",
		})
		local gpt_mini_chat = {
			provider = require("model.providers.openai"),
			system = "You are a helpful assistant",
			params = {
				model = "gpt-4o-mini",
			},
			create = function(input, context)
				return context.selection and input or ""
			end,
			run = function(messages, config)
				if config.system then
					table.insert(messages, 1, {
						role = "system",
						content = config.system,
					})
				end

				return { messages = messages }
			end,
		}
		local gpt_4_chat = {
			provider = require("model.providers.openai"),
			system = "You are a helpful assistant",
			params = {
				model = "gpt-4o",
			},
			create = function(input, context)
				return context.selection and input or ""
			end,
			run = function(messages, config)
				if config.system then
					table.insert(messages, 1, {
						role = "system",
						content = config.system,
					})
				end

				return { messages = messages }
			end,
		}
		require("model").setup({
			-- default_prompt = "You are a programming expert. Based on",
			-- prompts = {},
			chats = {
				mini = gpt_mini_chat,
				big = gpt_4_chat,
			},
			-- hl_group = 'Comment',
			-- join_undo = true,
		})
	end,
}
