local utils = require("config.utils")
local colors = utils.colors
local sethl = utils.sethl
local lspconfig = require("lspconfig")
local lsp = vim.lsp

lspconfig.clangd.setup({
    -- cmd = { "clangd", "--background-index" },
})

lspconfig.rust_analyzer.setup({})

lspconfig.gopls.setup({})

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = true,
    }
)

-- local signs = {
--     Error = "",
--     Warn = "",
--     Hint = "",
--     Info = "",
-- }

local types = { "Error", "Warn", "Hint", "Info" }
local signs = {}
for _, type in ipairs(types) do
    signs[type] = ""
    -- signs[type] = ""
    -- signs[type] = ""
    -- signs[type] = "•"
    -- signs[type] = ""
end
-- local signs = {
--     Error = " ",
--     Warn = " ",
--     Hint = " ",
--     Info = " ",
-- }

-- Make this a less jarring red
sethl("DiagnosticError", colors.red, colors.darkgray)
sethl("DiagnosticWarn", colors.yellow, colors.darkgray)
sethl("DiagnosticHint", colors.cyan, colors.darkgray)
sethl("DiagnosticInfo", colors.white, colors.darkgray)

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
