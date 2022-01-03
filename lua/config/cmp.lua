local cmp = require("cmp")
local lspkind = require("lspkind")

local function check_backspace()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local feedkeys = vim.fn.feedkeys
local pumvisible = vim.fn.pumvisible
local replace_termcodes = vim.api.nvim_replace_termcodes
local next_item_keys = replace_termcodes("<c-n>", true, true, true)
local prev_item_keys = replace_termcodes("<c-p>", true, true, true)
local backspace_keys = replace_termcodes("<tab>", true, true, true)

cmp.setup({
    formatting = {
        format = function(_, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
                .. " "
                .. vim_item.kind
            return vim_item
        end,
    },
    mapping = {
        ["<cr>"] = cmp.mapping.confirm(),
        ["<tab>"] = cmp.mapping(function(fallback)
            if pumvisible() == 1 then
                feedkeys(next_item_keys, "n")
            elseif check_backspace() then
                feedkeys(backspace_keys, "n")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    ["<s-tab>"] = cmp.mapping(function(fallback)
        if pumvisible() == 1 then
            feedkeys(prev_item_keys, "n")
        else
            fallback()
        end
    end, {
        "i",
        "s",
    }),
    sources = {
        { name = "buffer" },
        { name = "spell" },
        { name = "orgmode" },
        -- { name = "nvim_lsp" },
        -- { name = "nvim_lua" },
        -- { name = "path" },
        -- { name = "luasnip" },
    },
})
