--mod
local cmd = vim.cmd
local o_s = vim.o

local M = {}

M.HOME = os.getenv("HOME")
-- legacy
M.map = vim.keymap.set

function M.opt(o, v, scopes)
	scopes = scopes or { o_s }
	for _, s in ipairs(scopes) do
		s[o] = v
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

function M.visual_selection_range()
	local _, cerow, cecol, _ = unpack(vim.fn.getpos("."))
	local _, csrow, cscol, _ = unpack(vim.fn.getpos("v"))
	if csrow < cerow or (csrow == cerow and cscol <= cecol) then
		return csrow - 1, cscol - 1, cerow - 1, cecol
	else
		return cerow - 1, cecol - 1, csrow - 1, cscol
	end
end
function M.mason_path(exec_name)
	return vim.fn.stdpath("data") .. "/mason/bin/" .. exec_name
end

return M
