local map = require("config.utils").map
local is_in_repo = require("config.utils").is_in_repo

local silent = { silent = true }

in_repo = nil
function run_telescope_command()
    print("running telescope command")
    if in_repo == nil then
        in_repo = is_in_repo()
    end
    if in_repo then
        vim.cmd("Telescope git_files")
    else
        vim.cmd("Telescope find_files")
    end
end
map("n", "<C-p>", [[<cmd>lua run_telescope_command()<cr>]], silent)
map("n", "<C-g>", [[<cmd>Telescope live_grep<cr>]], silent)
map("n", "<leader>H", [[<cmd>Telescope help_tags<cr>]], silent)
