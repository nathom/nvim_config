local map = require("config.utils").map

map("n", "<Left>", [[<cmd>lua require('tmux').move_left()<cr>]])
map("n", "<Down>", [[<cmd>lua require('tmux').move_down()<cr>]])
map("n", "<Up>", [[<cmd>lua require('tmux').move_up()<cr>]])
map("n", "<Right>", [[<cmd>lua require('tmux').move_right()<cr>]])
