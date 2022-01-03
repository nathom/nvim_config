local colors = require("config.utils").colors
local fn = vim.fn

function filename_with_subdirs()
    -- return "/some/file"
    -- .config/nvim/init.lua -> .c/n/init.lua

    -- Get relative path
    local relative = fn.expand("%"):gsub(fn.getcwd() .. "/", "")
    -- Shorten subdir names to a single character
    local shortened = relative:gsub([[(%w)%w+/]], [[%1/]])
    return shortened
end

function platform()
    return ""
end

local gruvbox8 = {
    normal = {
        a = { bg = colors.cyan, fg = colors.black, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.gray },
    },
    insert = {
        a = { bg = colors.magenta, fg = colors.black, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.gray },
    },
    visual = {
        a = { bg = colors.orange, fg = colors.black, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.gray },
    },
    replace = {
        a = { bg = colors.pink, fg = colors.black, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.gray },
    },
    command = {
        a = { bg = colors.blue, fg = colors.black, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.gray },
    },
    inactive = {
        a = { bg = colors.gray, fg = colors.gray, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.gray },
    },
}

local diff = {
    "diff",
    symbols = { added = " ", modified = "柳", removed = " " },
    -- symbols = { added = "+", modified = "~", removed = "-" },
    color_added = colors.green,
    color_modified = colors.yellow,
    color_removed = colors.red,
}

-- local diff = {
--     "diff",
--     symbols = { added = " ", modified = "柳", removed = " " },
--     -- symbols = { added = "+", modified = "~", removed = "-" },
--     color_added = { fg = colors.green },
--     color_modified = { fg = colors.yellow },
--     color_removed = { fg = colors.red },
-- }

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = gruvbox8,
        component_separators = "|",
        section_separators = "",
    },
    sections = {
        lualine_c = { filename_with_subdirs, diff },
        lualine_x = { "encoding", platform, "filetype" },
    },
})
