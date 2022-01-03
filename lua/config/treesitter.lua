local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

-- parser_configs.norg = {
--     install_info = {
--         url = "https://github.com/nvim-neorg/tree-sitter-norg",
--         files = { "src/parser.c", "src/scanner.cc" },
--         branch = "main",
--     },
-- }

-- Haskell doesn't work without this
require("nvim-treesitter.configs").compilers = { "gcc-11" }

parser_configs.org = {
    install_info = {
        url = "https://github.com/milisims/tree-sitter-org",
        revision = "main",
        files = { "src/parser.c", "src/scanner.cc" },
    },
    filetype = "org",
}

require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "python", "rust", "toml", "org" },
    highlight = {
        enable = true,
        disable = { "org" },
        additional_vim_regex_highlighting = { "org" },
    },
})

-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
