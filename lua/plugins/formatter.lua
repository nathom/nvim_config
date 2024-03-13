local function verible()
	return {
		exe = "verible-verilog-format",
		args = { "-" },
		stdin = true,
	}
end

local function ormolu()
	return {
		exe = "ormolu",
		args = {
			"--stdin-input-file",
			vim.api.nvim_buf_get_name(0),
		},
		stdin = true,
	}
end

local function prettier()
	return {
		exe = "prettier",
		args = {
			"--stdin-filepath",
			vim.api.nvim_buf_get_name(0),
			"--single-quote",
		},
		stdin = true,
	}
end

local function biome()
	return {
		exe = "biome",
		args = {
			"format",
			"--stdin-file-path",
			vim.api.nvim_buf_get_name(0),
			"--indent-style=space",
			"--indent-width=4",
		},
		stdin = true,
	}
end

function clangformat()
	local fn = vim.api.nvim_buf_get_name(0):gsub(".*/", "")
	return {
		exe = "clang-format",
		args = { "--assume-filename", fn },
		stdin = true,
		cwd = vim.fn.expand("%:p:h"), -- Run clang-format in parent directory of file
	}
end

local function rustfmt()
	return {
		exe = "rustfmt",
		args = { "--emit=stdout", "--edition=2021" },
		cwd = vim.fn.expand("%:p:h"),
		stdin = true,
	}
end

local function black()
	return {
		exe = "black",
		args = { "--fast" },
		stdin = false,
	}
end

local function ruff()
	return {
		exe = "ruff",
		-- args = {
		-- 	"check",
		-- 	"--fix",
		-- 	"--select=E,I,F",
		-- 	"--stdin-filename",
		-- 	vim.api.nvim_buf_get_name(0),
		-- },
		args = { "format", "--stdin-filename", vim.api.nvim_buf_get_name(0) },
		stdin = true,
	}
end

local function ruff_fix()
	-- Sort imports (I001)
	-- Remove unused imports (F401)
	return {
		exe = "ruff",
		args = { "check", "--fix", "--select=I,F401,D407,D412", "--stdin-filename", vim.api.nvim_buf_get_name(0) },
		stdin = true,
	}
end

local function google_java_format()
	return {
		exe = "google-java-format",
		args = { "-" },
		stdin = true,
	}
end

local function isort()
	return { exe = "isort", args = { "-", "--quiet" }, stdin = true }
end

local function gofmt()
	return { exe = "gofmt", stdin = true }
end

local function stylua()
	return {
		exe = "stylua",
		args = {
			"--search-parent-directories",
			"-",
		},
		stdin = true,
	}
end

local function latexindent()
	return {
		exe = "latexindent",
		args = { [[--yaml="defaultIndent=' '\n textWrapOptions:\n\t columns: 80"]] },
		stdin = true,
	}
end

local function fold()
	return {
		exe = "fold",
		args = { "-s" },
		stdin = true,
	}
end

local function wrapper()
	return {
		-- exe = "/Users/nathan/wrapper/target/release/wrapper",
		exe = "cmark",
		args = { "--width", "70", "-t", "commonmark" },
		stdin = true,
	}
end
-- local function cmake_format()
--   return { exe = 'cmake-format', args = { vim.fn.expand '%:t' }, stdin = false }
-- end

-- Format files on write
return {
	"mhartington/formatter.nvim",
	init = function(plugin)
		local extensions = {
			"c",
			"cpp",
			"go",
			"h",
			"hpp",
			"hs",
			"ino",
			"java",
			"js",
			"json",
			"css",
			"lua",
			"md",
			"py",
			"svelte",
			"html",
			"rs",
			"tex",
			"sv",
		}

		local extension_str = "*." .. table.concat(extensions, ",*.")

		vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost ]] .. extension_str .. [[ FormatWrite
augroup END
]], true)
	end,
	config = function(plugin)
		local formatter_setup = {
			logging = false,
			filetype = {
				-- cmake = { cmake_format },
				-- html = { prettier },
				arduino = { clangformat },
				c = { clangformat },
				cpp = { clangformat },
				go = { gofmt },
				haskell = { ormolu },
				java = { clangformat },
				javascript = { biome },
				json = { prettier },
				svelte = { prettier },
				html = { prettier },
				css = { prettier },
				lua = { stylua },
				-- markdown = { fold },
				-- markdown = { wrapper },
				python = { ruff, ruff_fix },
				-- python = { ruff },
				rust = { rustfmt },
				tex = { latexindent },
				systemverilog = { verible },
			},
		}

		require("formatter").setup(formatter_setup)
	end,
	cmd = "FormatWrite",
}
