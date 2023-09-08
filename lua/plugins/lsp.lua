-- Easier configuration for LSP clients
return {
	"neovim/nvim-lspconfig",
	config = function(plugin)
		local utils = require("utils")
		local colors = utils.colors
		local sethl = utils.sethl
		local lspconfig = require("lspconfig")
		local lsp = vim.lsp

		local servers = {
			"clangd",
			"rust_analyzer",
			"gopls",
			"pyright",
			"quick_lint_js",
			"svlangserver",
			-- "rome",
			--[[ "svls" ]]
		}

		local function on_attach(client, bufnr)
			local opts = { noremap = true, silent = true }
			local function lsp_map(mapping, action)
				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				vim.api.nvim_buf_set_keymap(bufnr, "n", mapping, "<cmd>lua vim.lsp.buf." .. action .. "()<CR>", opts)
			end
			-- Enable completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			lsp_map("gD", "declaration")
			lsp_map("gd", "definition")
			lsp_map("K", "hover")
			lsp_map("gi", "implementation")
			lsp_map("<C-k>", "signature_help")
			-- lsp_map("<space>wa", "add_workspace_folder")
			-- lsp_map("<space>wr", "remove_workspace_folder")
			-- lsp_map("<space>wl", "list_workspace_folders")
			lsp_map("<leader>D", "type_definition")
			lsp_map("<leader>rn", "rename")
			lsp_map("<leader>ca", "code_action")
			lsp_map("gr", "references")
			lsp_map("<leader>f", "formatting")
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		for _, s in ipairs(servers) do
			lspconfig[s].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
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
			signs[type] = ""
			-- signs[type] = ""
			-- signs[type] = ""
			-- signs[type] = "•"
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
	end,
	-- Lazy load this because it is *slow*
	-- An annoying thing with this setup is that
	-- you need to add filetypes to this array when you
	-- add a new LS.
	ft = { "c", "cpp", "rust", "go", "python", "javascript", "systemverilog" },
}
