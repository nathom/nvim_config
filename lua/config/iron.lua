local iron = require("iron")
iron.core.add_repl_definitions({
    lua = {
        croissant = {
            command = { "croissant" },
        },
    },
    fennel = {
        fennel = {
            command = { "fennel" },
        },
    },
    python = {
        ptipython = {
            command = { "ptipython", "--vi" },
        },
        ipython = {
            command = { "ipython", "--vi" },
        },
    },
    rust = {
        papyrus = {
            command = { "papyrus" },
        },
    },
})

iron.core.set_config({
    preferred = {
        python = "ptipython",
        -- haskell = 'intero',
        -- lisp    = 'sbcl',
        -- ocaml   = 'utop',
        -- scheme  = 'csi',
        lua = "croissant",
        rust = "papyrus",
    },
})
