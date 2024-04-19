return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				arduino = { "clang_format" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				go = { "gofmt" },
				haskell = { "ormolu" },
				html = { "prettier" },
				java = { "clang_format" },
				javascript = { "clang_format" },
				json = { "clang_format" },
				lua = { "stylua" },
				python = { "ruff_format", "ruff_fix" },
				rust = { "rustfmt" },
				systemverilog = { "verible" },
				tex = { "latexindent" },
				toml = { "taplo" },
				css = { "prettierd" },
				xml = { "xmlformat" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
	opts = {},
	enabled = true,
}
