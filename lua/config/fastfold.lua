local utils = require("config.utils")
local map = utils.map
local opt = utils.opt

vim.g.fastfold_fold_command_suffixes = {}
vim.g.fastfold_savehook = 1
vim.g.rust_fold = 1

map("n", "zuz", "<cmd>FastFoldUpdate!<cr>")
