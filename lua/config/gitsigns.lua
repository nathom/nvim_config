local utils = require("config.utils")
local colors = utils.colors
local sethl = utils.sethl

sethl("GitSignsAdd", colors.green, colors.darkgray)
sethl("GitSignsChange", colors.yellow, colors.darkgray)
sethl("GitSignsDelete", colors.red, colors.darkgray)

require("gitsigns").setup({
    signcolumn = true,
    -- symbols = { added = " ", modified = "柳", removed = " " },
    signs = {
        add = {
            hl = "GitSignsAdd",
            -- text = "",
            text = "|",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
        },
        change = {
            hl = "GitSignsChange",
            -- text = "柳",
            text = "|",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
        },
        delete = {
            hl = "GitSignsDelete",
            -- text = "",
            text = "|",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
        },
        topdelete = {
            hl = "GitSignsDelete",
            text = "‾",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
        },
        changedelete = {
            hl = "GitSignsChange",
            text = "~",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
        },
    },
})
