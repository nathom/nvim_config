require("true-zen").setup({
    modes = {
        ataraxis = {
            left_padding = 3,
            right_padding = 3,
            top_padding = 1,
            bottom_padding = 1,
            ideal_writing_area_width = { 79 },
            auto_padding = true,
            keep_default_fold_fillchars = true,
            custom_bg = { "none", "" },
            bg_configuration = true,
            quit = "untoggle",
            ignore_floating_windows = true,
            affected_higroups = {
                NonText = true,
                FoldColumn = true,
                ColorColumn = true,
                VertSplit = true,
                StatusLine = true,
                StatusLineNC = true,
                SignColumn = true,
            },
        },
        focus = {
            margin_of_error = 5,
            focus_method = "experimental",
        },
    },
})
