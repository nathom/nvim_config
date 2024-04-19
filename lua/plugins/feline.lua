-- Fast statusline
-- Doesn't erase the startup screen like lualine does

-- To get a letter index by ascii value - 64
local utils = require("utils")
local colors = utils.colors

local getcwd = vim.fn.getcwd
local math_letters = {
	"𝐀",
	"𝐁",
	"𝐂",
	"𝐃",
	"𝐄",
	"𝐅",
	"𝐆",
	"𝐇",
	"𝐈",
	"𝐉",
	"𝐊",
	"𝐋",
	"𝐌",
	"𝐍",
	"𝐎",
	"𝐏",
	"𝐐",
	"𝐑",
	"𝐒",
	"𝐓",
	"𝐔",
	"𝐕",
	"𝐖",
	"𝐗",
	"𝐘",
	"𝐙",
}
local function mode_to_math_letter(mode)
	return " " .. (math_letters[mode:byte(1) - 64] or " ") .. " "
end

local git_branch = vim.fn["gitbranch#name"]
local function git_branch_with_icon()
	local branch = git_branch()
	if #branch ~= 0 then
		return "  " .. branch .. " "
	else
		return ""
	end
end

local function cool_substitute_status()
	if vim.g.cool_substitute_is_applying then
		return " ⇔ " .. vim.g.cool_substitute_current_match .. "/" .. #vim.g.cool_substitute_matches
	elseif vim.g.cool_substitute_is_active then
		return " ✎ " .. vim.g.cool_substitute_current_match .. "/" .. #vim.g.cool_substitute_matches
	else
		return ""
	end
end

local function shortened_filename()
	-- return "/some/file"
	-- .config/nvim/init.lua -> .c/n/init.lua

	-- Get relative path
	local relative = vim.api.nvim_buf_get_name(0):gsub(getcwd() .. "/", "")
	-- Shorten subdir names to a single character
	local shortened = relative:gsub([[([^/])[^/]+/]], [[%1/]])
	return " " .. shortened .. " "
end

local display_wc = { md = true, tex = true }
local nvim_buf_get_lines = vim.api.nvim_buf_get_lines
local function word_count_current_buf()
	if not display_wc[utils.bufext()] then
		return ""
	end
	local lines
	local in_visual
	if vim.fn.mode():lower() == "v" then
		local row1, _, row2, _ = utils.visual_selection_range()
		lines = nvim_buf_get_lines(0, row1, row2 + 1, false)
		in_visual = true
	else
		lines = nvim_buf_get_lines(0, 0, -1, false)
		in_visual = false
	end

	local words = 0
	for _, line in ipairs(lines) do
		local _, words_in_line = line:gsub("%S+", "")
		words = words + words_in_line
	end

	local vis
	if in_visual then
		vis = "selected"
	else
		vis = ""
	end
	return " " .. tostring(words) .. " words " .. vis .. " "
end
-- Git diff
-- Lines removed and added
local index = require("diffstatus").index
local expand = vim.fn.expand
local function git_diff_added()
	-- assumes using rooter.vim
	local fn = expand("%")
	local status = index[fn]
	if status and status[1] > 0 then
		-- return tostring(status[1]) .. " ＋ "
		return tostring(status[1]) .. "  "
	end

	return ""
end
local function git_diff_removed()
	local fn = expand("%")
	local status = index[fn]
	if status and status[2] > 0 then
		return tostring(status[2]) .. "  "
		-- return tostring(status[2]) .. " － "
	end

	return ""
end

-- Mapping from mode to highlight color
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

return {
	"famiu/feline.nvim",
	config = function(_)
		local vi_mode_utils = require("feline.providers.vi_mode")
		local vim_mode = require("feline.providers.vi_mode").get_vim_mode
		local status_left = {
			{
				provider = function()
					return mode_to_math_letter(vim_mode())
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
				provider = git_branch_with_icon,
				hl = {
					bg = colors.darkgray,
					fg = colors.white,
				},
			},
			{
				provider = cool_substitute_status,
				hl = {
					fg = colors.pink,
				},
			},
			{
				provider = shortened_filename,
			},
		}

		local status_right = {
			{
				provider = word_count_current_buf,
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
			components = {
				active = { status_left, status_right },
				inactive = {},
			},
		})
		feline.use_theme(colors)
	end,
	dependencies = { "itchyny/vim-gitbranch" },
}
