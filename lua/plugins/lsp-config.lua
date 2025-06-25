local servers = {
	c = { "clangd" },
	ocaml = { "ocamllsp" },
	cpp = { "clangd" },
	rust = { "rust_analyzer" },
	go = { "gopls" },
	python = { "pyright", "ruff" },
	lua = { "lua_ls" },
	systemverilog = { "svlangserver", "verible" },
	tex = { "texlab" },
	java = { "jdtls" },
	zig = { "zls" },
	javascript = { "biome", "ts_ls" },
	typescript = { "ts_ls" },
}

local enabled_fts = {}

for ft, _ in pairs(servers) do
	table.insert(enabled_fts, ft)
end

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",

		config = function()
			require("mason-lspconfig").setup()

			local utils = require("utils")
			local colors = utils.colors
			local sethl = utils.sethl
			local lspconfig = require("lspconfig")
			local lsp = vim.lsp

			local function on_attach(client, bufnr)
				local opts = { noremap = true, silent = true }
				local function lsp_map(mapping, action)
					-- Mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						mapping,
						"<cmd>lua vim.lsp.buf." .. action .. "()<CR>",
						opts
					)
				end
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
				lsp_map("gD", "declaration")
				lsp_map("gd", "definition")
				lsp_map("K", "hover")
				lsp_map("gi", "implementation")
				lsp_map("<C-k>", "signature_help")
				lsp_map("<leader>D", "type_definition")
				lsp_map("<leader>rn", "rename")
				lsp_map("<leader>ca", "code_action")
				lsp_map("gr", "references")
				-- lsp_map("<leader>f", "formatting")
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			for _, ft_servers in pairs(servers) do
				for _, s in ipairs(ft_servers) do
					local settings
					if s == "lua_ls" then
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						}
					else
						settings = {}
					end
					lspconfig[s].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = settings,
					})
				end
			end

			lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
				virtual_text = false,
				signs = true,
				update_in_insert = false,
				underline = true,
			})

			local types = { "Error", "Warn", "Hint", "Info" }
			local signs = {}
			for _, type in ipairs(types) do
				signs[type] = "■■"
				-- signs[type] = ""
				-- signs[type] = ""
				-- signs[type] = ""
				-- signs[type] = "••"
				-- signs[type] = ""
			end

			sethl("DiagnosticError", colors.red, colors.darkgray)
			sethl("DiagnosticWarn", colors.yellow, colors.darkgray)
			sethl("DiagnosticHint", colors.cyan, colors.darkgray)
			sethl("DiagnosticInfo", colors.white, colors.darkgray)

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
			-- vim.cmd([[autocmd CursorMoved * :lua echo_diagnostic()]])
		end,
		enabled = true,
		ft = enabled_fts,
	},
}
