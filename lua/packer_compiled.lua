-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/nathan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/nathan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/nathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/nathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/nathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { 'require("config.comment")' },
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["TrueZen.nvim"] = {
    commands = { "TZAtaraxis" },
    config = { "require('config.truezen')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  ["arm-syntax-vim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/arm-syntax-vim",
    url = "https://github.com/ARM9/arm-syntax-vim"
  },
  ["buftabline.nvim"] = {
    config = { "require('config.buftabline')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/buftabline.nvim",
    url = "https://github.com/jose-elias-alvarez/buftabline.nvim"
  },
  ["diffstatus.nvim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/diffstatus.nvim",
    url = "/Users/nathan/diffstatus.nvim"
  },
  ["easy-replace.nvim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/easy-replace.nvim",
    url = "https://github.com/nathom/easy-replace.nvim"
  },
  ["fast-python-indent"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/fast-python-indent",
    url = "/Users/nathan/fast-python-indent"
  },
  ["feline.nvim"] = {
    config = { "require('config.feline')" },
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/famiu/feline.nvim"
  },
  ["filetype.nvim"] = {
    config = { "require('config.filetype')" },
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "/Users/nathan/filetype.nvim"
  },
  ["formatter.nvim"] = {
    commands = { "FormatWrite" },
    config = { 'require("config.formatter")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["imagepaste.nvim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/imagepaste.nvim",
    url = "/Users/nathan/imagepaste.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("config.autopairs")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-lspconfig"] = {
    config = { "require('config.lsp')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { 'require("config.treesitter")' },
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ufo"] = {
    config = { "require('config.ufo')" },
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["orgmode.nvim"] = {
    config = { 'require("config.orgmode")' },
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/orgmode.nvim",
    url = "https://github.com/kristijanhusak/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pandoc.nvim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/pandoc.nvim",
    url = "/Users/nathan/pandoc.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["targets.vim"] = {
    keys = { { "o", "i" }, { "o", "a" }, { "o", "I" }, { "o", "A" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "require('config.telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { 'require("config.tmux")' },
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "/Users/nathan/tmux.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    config = { "require('config.trouble')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-cool"] = {
    keys = { { "n", "/" }, { "n", "?" }, { "n", "*" }, { "n", "#" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/vim-cool",
    url = "https://github.com/romainl/vim-cool"
  },
  ["vim-dirvish"] = {
    keys = { { "n", "-" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/vim-dirvish",
    url = "https://github.com/justinmk/vim-dirvish"
  },
  ["vim-eunuch"] = {
    commands = { "Delete", "Unlink", "Move", "Rename", "Chmod", "Mkdir", "Cfind", "Clocate", "Lfind", "SudoWrite", "SudoEdit", "Wall" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-gitbranch"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/vim-gitbranch",
    url = "https://github.com/itchyny/vim-gitbranch"
  },
  ["vim-pencil"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/vim-pencil",
    url = "https://github.com/preservim/vim-pencil"
  },
  ["vim-pydocstring"] = {
    commands = { "Pydocstring" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/vim-pydocstring",
    url = "https://github.com/heavenshell/vim-pydocstring"
  },
  ["vim-rooter"] = {
    config = { 'require("config.rooter")' },
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/vim-sayonara",
    url = "https://github.com/mhinz/vim-sayonara"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-table-mode"] = {
    commands = { "TableModeToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-wordmotion"] = {
    keys = { { "n", "w" }, { "n", "b" }, { "n", "W" }, { "n", "B" }, { "o", "w" }, { "o", "W" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/opt/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  vimtex = {
    config = { "require('config.vimtex')" },
    loaded = true,
    path = "/Users/nathan/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: formatter.nvim
time([[Setup for formatter.nvim]], true)
require('config.formatter_setup')
time([[Setup for formatter.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
require('config.telescope_setup')
time([[Setup for telescope.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
require('config.ufo')
time([[Config for nvim-ufo]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
require("config.rooter")
time([[Config for vim-rooter]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
require('config.feline')
time([[Config for feline.nvim]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
require("config.orgmode")
time([[Config for orgmode.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
require("config.tmux")
time([[Config for tmux.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
require('config.filetype')
time([[Config for filetype.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require("config.comment")
time([[Config for Comment.nvim]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
require('config.vimtex')
time([[Config for vimtex]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Move lua require("packer.load")({'vim-eunuch'}, { cmd = "Move", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Rename lua require("packer.load")({'vim-eunuch'}, { cmd = "Rename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Chmod lua require("packer.load")({'vim-eunuch'}, { cmd = "Chmod", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Mkdir lua require("packer.load")({'vim-eunuch'}, { cmd = "Mkdir", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Cfind lua require("packer.load")({'vim-eunuch'}, { cmd = "Cfind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Clocate lua require("packer.load")({'vim-eunuch'}, { cmd = "Clocate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lfind lua require("packer.load")({'vim-eunuch'}, { cmd = "Lfind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudoWrite lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Wall lua require("packer.load")({'vim-eunuch'}, { cmd = "Wall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FormatWrite lua require("packer.load")({'formatter.nvim'}, { cmd = "FormatWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZAtaraxis lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZAtaraxis", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Pydocstring lua require("packer.load")({'vim-pydocstring'}, { cmd = "Pydocstring", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudoEdit lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Delete lua require("packer.load")({'vim-eunuch'}, { cmd = "Delete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Unlink lua require("packer.load")({'vim-eunuch'}, { cmd = "Unlink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[nnoremap <silent> b <cmd>lua require("packer.load")({'vim-wordmotion'}, { keys = "b", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> - <cmd>lua require("packer.load")({'vim-dirvish'}, { keys = "-", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ? <cmd>lua require("packer.load")({'vim-cool'}, { keys = "?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> * <cmd>lua require("packer.load")({'vim-cool'}, { keys = "*", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> a <cmd>lua require("packer.load")({'targets.vim'}, { keys = "a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> w <cmd>lua require("packer.load")({'vim-wordmotion'}, { keys = "w", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> # <cmd>lua require("packer.load")({'vim-cool'}, { keys = "#", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> W <cmd>lua require("packer.load")({'vim-wordmotion'}, { keys = "W", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> / <cmd>lua require("packer.load")({'vim-cool'}, { keys = "/", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> A <cmd>lua require("packer.load")({'targets.vim'}, { keys = "A", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> I <cmd>lua require("packer.load")({'targets.vim'}, { keys = "I", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> W <cmd>lua require("packer.load")({'vim-wordmotion'}, { keys = "W", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> i <cmd>lua require("packer.load")({'targets.vim'}, { keys = "i", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> B <cmd>lua require("packer.load")({'vim-wordmotion'}, { keys = "B", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> w <cmd>lua require("packer.load")({'vim-wordmotion'}, { keys = "w", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType org ++once lua require("packer.load")({'vim-pencil'}, { ft = "org" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vim-pencil'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-pencil'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufAdd * ++once lua require("packer.load")({'buftabline.nvim'}, { event = "BufAdd *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
