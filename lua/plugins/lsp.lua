-- Easier configuration for LSP clients
-- Location information about the last message printed. The format is
-- `(did print, buffer number, line number)`.
local last_echo = { false, -1, -1 }

-- The timer used for displaying a diagnostic in the commandline.
local echo_timer = nil

-- The timer after which to display a diagnostic in the commandline.
local echo_timeout = 50

-- The highlight group to use for warning messages.
local warning_hlgroup = "WarningMsg"

-- The highlight group to use for error messages.
local error_hlgroup = "ErrorMsg"

-- If the first diagnostic line has fewer than this many characters, also add
-- the second line to it.
local short_line_limit = 20

-- Shows the current line's diagnostics in a floating window.
function show_line_diagnostics()
	vim.lsp.diagnostic.show_line_diagnostics({ severity_limit = "Warning" }, vim.fn.bufnr(""))
end

-- Prints the first diagnostic for the current line.
function echo_diagnostic()
	if echo_timer then
		echo_timer:stop()
	end

	echo_timer = vim.defer_fn(function()
		local line = vim.fn.line(".") - 1
		local bufnr = vim.api.nvim_win_get_buf(0)

		if last_echo[1] and last_echo[2] == bufnr and last_echo[3] == line then
			return
		end

		local diags = vim.lsp.diagnostic.get_line_diagnostics(bufnf, line, { severity_limit = "Warning" })

		if #diags == 0 then
			-- If we previously echo'd a message, clear it out by echoing an empty
			-- message.
			if last_echo[1] then
				last_echo = { false, -1, -1 }

				vim.api.nvim_command('echo ""')
			end

			return
		end

		last_echo = { true, bufnr, line }

		local diag = diags[1]
		local width = vim.api.nvim_get_option("columns") - 15
		local lines = vim.split(diag.message, "\n")
		local message = lines[1]
		local trimmed = false

		if #lines > 1 and #message <= short_line_limit then
			message = message .. " " .. lines[2]
		end

		if width > 0 and #message >= width then
			message = message:sub(1, width) .. "..."
		end

		local kind = "Warning"
		local hlgroup = warning_hlgroup

		if diag.severity == vim.lsp.protocol.DiagnosticSeverity.Error then
			kind = "Error"
			hlgroup = error_hlgroup
		end

		local chunks = {
			{ kind, hlgroup },
			{ ": " .. message },
		}

		vim.api.nvim_echo(chunks, false, {})
	end, echo_timeout)
end
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
			"ruff_lsp",
			-- "quick_lint_js",
			"svlangserver",
			"jdtls",
			"hls",
			"biome",
			"tsserver",
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
		-- vim.cmd([[autocmd CursorMoved * :lua echo_diagnostic()]])
	end,
	-- Lazy load this because it is *slow*
	-- An annoying thing with this setup is that
	-- you need to add filetypes to this array when you
	-- add a new LS.
	ft = { "c", "cpp", "rust", "go", "python", "javascript", "systemverilog", "java", "haskell", "json", "typescript" },
}
