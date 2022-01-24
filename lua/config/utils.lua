local cmd = vim.cmd
local o_s = vim.o
local map_key = vim.api.nvim_set_keymap

local M = {}

M.HOME = os.getenv("HOME")

function M.opt(o, v, scopes)
    scopes = scopes or { o_s }
    for _, s in ipairs(scopes) do
        s[o] = v
    end
end

function M.map(modes, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    if type(modes) == "string" then
        modes = { modes }
    end
    for _, mode in ipairs(modes) do
        map_key(mode, lhs, rhs, opts)
    end
end

-- From gruvbox8 colorscheme
M.colors = {
    -- black = "#282828",
    black = "Background",
    red = "#cc241d",
    green = "#98971a",
    yellow = "#d79921",
    blue = "#458588",
    magenta = "#b16286",
    cyan = "#689d6a",
    gray = "#928374",
    darkgray = "#3c3836",
    pink = "#fb4934",
    white = "#ebdbb2",
    orange = "#fe8019",
}

-- For feline
M.colors.bg = M.colors.black
M.colors.fg = M.colors.gray
M.colors.skyblue = M.colors.cyan
M.colors.oceanblue = M.colors.blue
M.colors.violet = M.colors.magenta

-- Requires rooter.nvim
function M.is_in_repo(path)
    return os.execute("[ -d .git ]") == 0
    -- return os.capture("fd -H --max-depth 1 '^.git$'") ~= ""
end

function M.bufext(bufn)
    if bufn == nil then
        bufn = 0
    end
    return vim.api.nvim_buf_get_name(bufn):match(".*%.(%w+)")
end

function M.sethl(group, fg, bg)
    vim.cmd("hi " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
end

return M
