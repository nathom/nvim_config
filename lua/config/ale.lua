-- ALE Config
local utils = require("config.utils")
local colors = utils.colors
local map = utils.map

vim.g.ale_shell = "/bin/bash"
vim.g.ale_use_global_executables = 1
vim.g.ale_rust_cargo_use_clippy = 1

vim.g.ale_linters = {
    zsh = {},
    python = { "flake8", "mypy" },
    rust = { "analyzer" },
    lua = {}, -- Causes errors with vim configs
}
-- vim.g.ale_fixers = {
-- 	python = "black",
-- 	c = "clang-format",
-- 	rust = "rustfmt",
-- 	java = "google_java_format",
-- 	lua = "stylua",
-- }

vim.g.ale_lint_on_text_changed = "never"
vim.g.ale_set_highlights = 0

vim.g.ale_python_flake8_options = "--max-line-length 100" -- Black will automatically cut lines to 86 anyway
-- vim.g.ale_python_pyright_config = {
--     python = {
--         pythonPath = "~/.pyenv/shims/python",
--     },
--     pyright = {
--         -- reportMissingImports = false,
--         -- reportMissingModuleSource = false,
--     },
-- }

-- vim.g.ale_fix_on_save = 1
-- vim.g.ale_python_black_options = "--fast"
-- vim.g.ale_c_clangformat_options = "--style=file"
vim.g.ale_lint_delay = 0

vim.g.ale_sign_error = ""
vim.g.ale_sign_warning = ""
vim.g.ale_sign_info = ""
vim.cmd(
    "highlight ALEErrorSign guifg="
        .. colors.red
        .. " guibg="
        .. colors.darkgray
)
vim.cmd(
    "highlight ALEWarningSign guifg="
        .. colors.yellow
        .. " guibg="
        .. colors.darkgray
)
vim.cmd(
    "highlight ALEInfoSign guifg="
        .. colors.gray
        .. " guibg="
        .. colors.darkgray
)
map("n", "gj", "<cmd>ALENextWrap<cr>")
map("n", "gk", "<cmd>ALEPreviousWrap<cr>")
map("n", "g1", "<cmd>ALEFirst<cr>")
