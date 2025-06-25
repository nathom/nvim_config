return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.formatters.latexindent = {
			prepend_args = { "-m", "--yaml", [[modifyLineBreaks: textWrapOptions: columns: 80]] },
		}
		conform.formatters.mdformat = {
			prepend_args = { "--wrap", "80" },
		}
		conform.setup({
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
				ocaml = { "ocamlformat" },
				xml = { "xmlformat" },
				-- markdown = { "mdformat" },
				sh = { "beautysh" },
				bash = { "beautysh" },
			},
			formatters = {
				verible = {
					command = "verible-verilog-format",
					args = { "--stdin_name", "$FILENAME", "-" },
					stdin = true,
				},
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
