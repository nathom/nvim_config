return {
	"mfussenegger/nvim-jdtls",
	config = function()
		local function on_attach(_, bufnr)
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
			-- lsp_map("<leader>f", "formatting")
		end
		local config = {
			cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
			root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
			on_attach = on_attach,
		}
		require("jdtls").start_or_attach(config)
	end,
	enabled = false,
}
