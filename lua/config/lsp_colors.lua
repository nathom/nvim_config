local colors = require("config.utils").colors

require("lsp-colors").setup({
    Error = colors.green,
    Warning = colors.yellow,
    Information = colors.bright_cyan,
    Hint = colors.gray,
})
