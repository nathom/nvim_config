local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({})
npairs.add_rule(Rule("$", "$", { "tex", "markdown" }))
npairs.add_rule(Rule("\\{", "\\}", "tex"))
npairs.add_rule(Rule("\\left(", "\\right)", { "tex", "markdown" }))
npairs.add_rule(Rule("\\left[", "\\right]", { "tex", "markdown" }))
npairs.add_rule(Rule("\\left{", "\\right}", { "tex", "markdown" }))
npairs.add_rule(Rule("\\lfloor", "\\rfloor", { "tex", "markdown" }))
npairs.add_rule(Rule("\\lceil", "\\rceil", { "tex", "markdown" }))

-- npairs.add_rule(
--     Rule("\\begin%{%w+%}$", "", { "plaintex", "markdown" })
--         :use_regex(true)
--         :replace_endpair(function(opts)
--             return opts.prev_char
--         end)
-- )
