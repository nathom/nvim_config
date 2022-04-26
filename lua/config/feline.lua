local vi_mode_utils = require("feline.providers.vi_mode")
local utils = require("config.utils")
local colors = utils.colors

local math_letters = {
    [65] = "𝐀",
    [66] = "𝐁",
    [67] = "𝐂",
    [68] = "𝐃",
    [69] = "𝐄",
    [70] = "𝐅",
    [71] = "𝐆",
    [72] = "𝐇",
    [73] = "𝐈",
    [74] = "𝐉",
    [75] = "𝐊",
    [76] = "𝐋",
    [77] = "𝐌",
    [78] = "𝐍",
    [79] = "𝐎",
    [80] = "𝐏",
    [81] = "𝐐",
    [82] = "𝐑",
    [83] = "𝐒",
    [84] = "𝐓",
    [85] = "𝐔",
    [86] = "𝐕",
    [87] = "𝐖",
    [88] = "𝐗",
    [89] = "𝐘",
    [90] = "𝐙",
}

local getcwd = vim.fn.getcwd
local function shortened_filename()
    -- return "/some/file"
    -- .config/nvim/init.lua -> .c/n/init.lua

    -- Get relative path
    local relative = vim.api.nvim_buf_get_name(0):gsub(getcwd() .. "/", "")
    -- Shorten subdir names to a single character
    local shortened = relative:gsub([[([^/])[^/]+/]], [[%1/]])
    return " " .. shortened .. " "
end

local index = require("diffstatus").index
local expand = vim.fn.expand
local function git_diff_added()
    -- assumes using rooter.vim
    local fn = expand("%")
    local status = index[fn]
    if status and status[1] > 0 then
        return tostring(status[1]) .. "  "
    end

    return ""
end
local function git_diff_removed()
    local fn = expand("%")
    local status = index[fn]
    if status and status[2] > 0 then
        return tostring(status[2]) .. "  "
    end

    return ""
end

local mode_highlight = {
    NORMAL = "cyan",
    INSERT = "magenta",
    VISUAL = "yellow",
    COMMAND = "blue",
    BLOCK = "pink",
    REPLACE = "green",
    LINES = "orange",
    OP = "red",
    HELP = "green",

    -- Weird ones
    ["V-REPLACE"] = "green",
    MORE = "green",
    SHELL = "green",
    TERM = "green",
    NONE = "green",
    ENTER = "green",
    SELECT = "green",
}

local components = {
    active = {},
    inactive = {},
}

components.inactive[1] = {
    {
        provider = shortened_filename,
    },
}

local vim_mode = require("feline.providers.vi_mode").get_vim_mode
local git_branch = vim.fn["gitbranch#name"]
components.active[1] = {
    {
        provider = function()
            return " " .. (math_letters[vim_mode():byte(1)] or " ") .. " "
        end,
        hl = function()
            return {
                name = vi_mode_utils.get_mode_highlight_name(),
                bg = mode_highlight[vim_mode()],
                fg = colors.black,
                style = "bold",
            }
        end,
    },

    {
        provider = function()
            branch = git_branch()
            if #branch ~= 0 then
                return "  " .. branch .. " "
            else
                return ""
            end
        end,
        hl = {
            bg = colors.darkgray,
            fg = colors.white,
        },
    },
    {
        provider = shortened_filename,
    },
}

local display_wc = { md = true, tex = true }
local nvim_buf_get_lines = vim.api.nvim_buf_get_lines
components.active[2] = {
    {
        provider = function()
            if not display_wc[utils.bufext()] then
                return ""
            end

            local lines = nvim_buf_get_lines(0, 0, -1, false)
            local words = 0

            for _, line in ipairs(lines) do
                local _, words_in_line = line:gsub("%S+", "")
                words = words + words_in_line
            end

            return " " .. tostring(words) .. " words  "
        end,
        hl = {
            fg = "magenta",
            bg = "black",
        },
    },
    {
        provider = git_diff_added,
        hl = {
            fg = "green",
            bg = "black",
        },
    },
    {
        provider = git_diff_removed,
        hl = {
            fg = "red",
            bg = "black",
        },
    },
    {
        provider = "position",
        left_sep = " ",
        right_sep = " ",
    },
    {
        provider = "scroll_bar",
        hl = {
            fg = "skyblue",
            style = "bold",
        },
    },
    {},
}

local feline = require("feline")
feline.setup({
    components = components,
})
feline.use_theme(colors)
--[[

local math_letters_fancy = {
    [65] = "𝕬",
    [66] = "𝕭",
    [67] = "𝕮",
    [68] = "𝕯",
    [69] = "𝕰",
    [70] = "𝕱",
    [71] = "𝕲",
    [72] = "𝕳",
    [73] = "𝕴",
    [74] = "𝕵",
    [75] = "𝕶",
    [76] = "𝕷",
    [77] = "𝕸",
    [78] = "𝕹",
    [79] = "𝕺",
    [80] = "𝕻",
    [81] = "𝕼",
    [82] = "𝕽",
    [83] = "𝕾",
    [84] = "𝕿",
    [85] = "𝖀",
    [86] = "𝖁",
    [87] = "𝖂",
    [88] = "𝖃",
    [89] = "𝖄",
    [90] = "𝖅",
}]]
