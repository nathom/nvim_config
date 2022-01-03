local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({})
npairs.add_rule(Rule("$", "$", { "tex", "markdown" }))
npairs.add_rule(Rule("\\left(", "\\right)", { "tex", "markdown" }))
npairs.add_rule(Rule("\\left[", "\\right]", { "tex", "markdown" }))
npairs.add_rule(Rule("\\left{", "\\right}", { "tex", "markdown" }))
