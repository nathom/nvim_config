local map = require("config.utils").map

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
    return {
        exe = "clang-format",
        args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
        stdin = true,
        cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
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
            "--indent-type",
            "Spaces",
            "--column-width",
            "79",
            "--search-parent-directories",
            "-",
        },
        stdin = true,
    }
end

-- local function latexindent()
--   return { exe = 'latexindent', args = { '-sl', '-g /dev/stderr', '2>/dev/null' }, stdin = true }
-- end

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
        -- tex = { latexindent },
    },
}

require("formatter").setup(formatter_setup)
