return require("packer").startup(function(use)
    -- Packer can manage itself
    -- lua require'easy_replace'.replace_selection()
    use("wbthomason/packer.nvim")

    -- Linting and lsp
    -- use({
    --     "w0rp/ale",
    --     -- ft = { "python", "rust", "lua", "c", "cpp" },
    --     config = [[require("config.ale")]],
    --     disable = true,
    -- })

    -- use({
    --     "gabrielelana/vim-markdown",
    --     setup = [[require('config.vim_markdown')]],
    -- })
    use({
        "plasticboy/vim-markdown",
        setup = [[require('config.vim_markdown')]],
        ft = "markdown",
    })

    -- Navigate between marks
    -- use({ "kshenoy/vim-signature" })

    -- View the contents of registers
    -- use({
    --     "tversteeg/registers.nvim",
    --     keys = { { "n", '"' }, { "i", "<c-r>" } },
    -- })

    -- Highlights
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = [[require("config.treesitter")]],
    })

    -- Fast statusline
    -- use({
    --     -- "shadmansaleh/lualine.nvim",
    --     "hoob3rt/lualine.nvim",
    --     requires = { "kyazdani42/nvim-web-devicons", opt = true },
    --     config = [[require('config.lualine')]],
    --     disable = true,
    -- })

    -- Nice buffer quitting
    use({ "mhinz/vim-sayonara", cmd = "Sayonara" })

    -- Redefine 'w' to be more useful
    use({
        "chaoren/vim-wordmotion",
        keys = { "w", "b" },
    })

    -- Improved quickfix window
    use("kevinhwang91/nvim-bqf")

    -- Surround text with characters
    -- use({
    --     "machakann/vim-sandwich",
    --     setup = [[require('config.sandwich_setup')]],
    --     config = [[require('config.sandwich')]],
    --     event = "InsertEnter",
    --     disable = true,
    -- })

    use({
        "tpope/vim-surround",
        disable = false,
    })

    -- New word objects
    use({
        "wellle/targets.vim",
        keys = { { "o", "i" }, { "o", "a" }, { "o", "I" }, { "o", "A" } },
    })

    -- Stop highlighting after searching for text
    use({
        "romainl/vim-cool",
        keys = { { "n", "/" }, { "n", "?" }, { "n", "*" }, { "n", "#" } },
    })

    -- Fast python indent
    use("~/fast-python-indent")

    -- Fuzzy finding and live grep
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            -- "telescope-frecency.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        setup = [[require('config.telescope_setup')]],
        config = [[require('config.telescope')]],
        cmd = "Telescope",
        module = "telescope",
    })

    -- Faster fuzzy finding
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Undo tree
    -- use({
    --     "mbbill/undotree",
    --     cmd = "UndotreeToggle",
    --     config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
    -- })

    -- Git
    use({
        {
            "tpope/vim-fugitive",
            cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
            disable = true,
        },
        {
            "lewis6991/gitsigns.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = [[require('config.gitsigns')]],
            -- event = "BufEnter",
        },
    })
    -- use({
    --     "TimUntersberger/neogit",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "sindrets/diffview.nvim",
    --     },
    --     cmd = "Neogit",
    --     config = [[require('config.neogit')]],
    --     disable = false,
    -- })

    -- colorscheme
    use("lifepillar/vim-gruvbox8")

    -- Only compute folds on write
    -- use({
    --     "Konfekt/FastFold",
    --     setup = [[require("config.fastfold_setup")]],
    --     config = [[require("config.fastfold")]],
    --     keys = { { "n", "z" } },
    --     disable = true,
    -- })

    -- Automatically complete pairs
    use({
        "windwp/nvim-autopairs",
        config = [[require("config.autopairs")]],
        event = "InsertEnter",
    })

    -- Fast netrw replacement
    use({ "justinmk/vim-dirvish", keys = { { "n", "-" } } })

    -- Change directory to root automatically
    use({ "airblade/vim-rooter", config = [[require("config.rooter")]] })

    -- use({
    --     "norcalli/nvim-colorizer.lua",
    --     config = [[require("colorizer").setup()]],
    --     ft = { "vim", "lua" },
    -- })

    use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })

    -- use({
    --     "tpope/vim-commentary",
    --     keys = {
    --         { "v", "gc" },
    --         { "n", "gc" },
    --         { "o", "gc" },
    --         { "n", "gcc" },
    --     },
    -- })

    use({
        "jose-elias-alvarez/buftabline.nvim",
        event = "BufAdd",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = [[require('config.buftabline')]],
    })

    -- Switch between vim splits and tmux panes easily
    use({
        "~/tmux.nvim",
        -- "nathom/tmux.nvim",
        config = [[require("config.tmux")]],
    })

    -- Smooth scrolling
    use({
        "psliwka/vim-smoothie",
        keys = {
            { "n", "<C-f>" },
            { "n", "<C-b>" },
            { "n", "<C-d>" },
            { "n", "<C-u>" },
        },
        disable = true,
    })

    -- Format files on write
    use({
        "mhartington/formatter.nvim",
        setup = [[require('config.formatter_setup')]],
        config = [[require("config.formatter")]],
        cmd = "FormatWrite",
    })

    -- Better f and F command
    use({
        "rhysd/clever-f.vim",
        keys = { { "n", "f" }, { "n", "F" } },
        disable = true,
    })

    -- Built in REPLs
    use({
        "hkupty/iron.nvim",
        setup = [[vim.g.iron_map_defaults = 0]],
        config = [[require('config.iron')]],
        cmd = { "IronRepl", "IronSend", "IronReplHere", "IronFocus" },
    })

    -- Easier unix commands within vim
    use({
        "tpope/vim-eunuch",
        cmd = {
            "Delete",
            "Unlink",
            "Move",
            "Rename",
            "Chmod",
            "Mkdir",
            "Cfind",
            "Clocate",
            "Lfind",
            "SudoWrite",
            "SudoEdit",
            "Wall",
        },
    })

    use({
        "andymass/vim-matchup",
        setup = [[require('config.matchup')]],
        event = "BufEnter",
        disable = true,
    })

    -- Easily replace text
    use("nathom/easy-replace.nvim")

    -- Faster filetype resolving
    -- use({ "nathom/filetype.nvim", disable = false })
    use({
        "~/filetype.nvim",
        disable = false,
        config = [[require('config.filetype')]],
    })

    -- Fuzzy finding
    use({ "junegunn/fzf", run = [[fzf#install()]], disable = true })
    use({
        "junegunn/fzf.vim",
        setup = [[require("config.fzf")]],
        cmd = { "Files", "GFiles" },
        after = "fzf",
        disable = true,
    })

    -- Can remove when 0.6 is released
    -- Speeds up startup
    use("lewis6991/impatient.nvim")

    use({
        "goolord/alpha-nvim",
        config = [[require("config.alpha")]],
        disable = true,
    })

    use({
        "kristijanhusak/orgmode.nvim",
        -- ft = { "org" },
        -- keys = { "<leader>oa", "<leader>oc" },
        config = [[require("config.orgmode")]],
    })

    use({
        "nvim-neorg/neorg",
        ft = "norg",
        config = [[require("config.neorg")]],
        disable = true,
    })

    use({
        "hrsh7th/nvim-cmp",
        requires = {
            -- "L3MON4D3/LuaSnip",
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            -- "hrsh7th/cmp-nvim-lsp",
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            -- { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            -- { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
        },
        config = [[require('config.cmp')]],
        event = "InsertEnter *",
        disable = true,
    })

    -- Autocomplete menu
    -- use({
    --     "onsails/lspkind-nvim",
    -- })

    use({
        "neovim/nvim-lspconfig",
        config = [[require('config.lsp')]],
        ft = { "c", "cpp", "rust", "go" },
    })
    use({
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        config = [[require('config.trouble')]],
    })
    use({
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood",
        diable = true,
    })

    use({
        "heavenshell/vim-pydocstring",
        -- setup = [[require('config.pydocstring_setup')]],
        run = "make install",
        cmd = "Pydocstring",
    })

    -- Fast statusline
    -- Doesn't erase the startup screen like lualine does
    use({
        "famiu/feline.nvim",
        config = [[require('config.feline')]],
    })

    use("kyazdani42/nvim-web-devicons")

    -- Wrap long lines automatically
    -- WIP
    use({ "~/wrapsody.nvim", disable = true })

    -- Automatically render markdown on write
    -- WIP
    use("~/pandoc.nvim")

    use({
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        run = function()
            vim.cmd("call mkdp#util#install()")
        end,
        disable = true,
    })

    use({ "dhruvasagar/vim-table-mode", cmd = "TableModeToggle" })

    use("~/imagepaste.nvim")

    use({ "preservim/vim-pencil", ft = { "markdown", "org" } })

    -- use({ "junegunn/goyo.vim", cmd = "Goyo" })

    use({ "Pocco81/TrueZen.nvim", config = [[require('config.truezen')]] })

    use({
        "akinsho/org-bullets.nvim",
        config = [[require('config.org_bullets')]],
    })

    use("tpope/vim-sleuth")

    use("ARM9/arm-syntax-vim")

    use({ "numToStr/Comment.nvim", config = [[require("config.comment")]] })
end)
