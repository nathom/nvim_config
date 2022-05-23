local map = require("config.utils").map

local function ormolu()
	return {
		exe = "ormolu",
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
		-- args = { [[--yaml="defaultIndent=' '"]] },
		stdin = true,
	}
end

-- local function cmake_format()
--   return { exe = 'cmake-format', args = { vim.fn.expand '%:t' }, stdin = false }
-- end

local formatter_setup = {
	logging = false,
	filetype = {
		c = { clangformat },
		-- cmake = { cmake_format },
		cpp = { clangformat },
		-- html = { prettier },
		javascript = { prettier },
		json = { prettier },
		lua = { stylua },
		python = { isort, black },
		rust = { rustfmt },
		go = { gofmt },
		java = { clangformat },
		tex = { latexindent },
		haskell = { ormolu },
	},
}

require("formatter").setup(formatter_setup)
