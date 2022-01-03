local map = require("config.utils").map
local is_in_repo = require("config.utils").is_in_repo

local silent = { silent = true }

in_repo = nil
function run_fzf_command()
    if in_repo == nil then
        in_repo = is_in_repo()
    end
    if in_repo then
        vim.cmd("GFiles")
    else
        vim.cmd("Files")
    end
end

map("n", "<C-p>", "<cmd>lua run_fzf_command()<cr>")
