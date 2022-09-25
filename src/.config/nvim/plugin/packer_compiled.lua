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
local package_path_str = "/home/jeff/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jeff/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jeff/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jeff/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jeff/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["FTerm.nvim"] = {
    config = { 'require("setup/fterm")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numtostr/FTerm.nvim"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/beacon.nvim",
    url = "https://github.com/danilamihailov/beacon.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  editorconfig = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/editorconfig",
    url = "https://github.com/editorconfig/editorconfig"
  },
  ["flutter-tools.nvim"] = {
    config = { 'require("setup/flutter-tools")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-worktree.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/git-worktree.nvim",
    url = "https://github.com/ThePrimeagen/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("setup/gitsigns")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hydra.nvim"] = {
    config = { 'require("setup/hydra")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/hydra.nvim",
    url = "https://github.com/anuvyklack/hydra.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require("setup/guides")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["keymap-layer.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/keymap-layer.nvim",
    url = "https://github.com/anuvyklack/keymap-layer.nvim"
  },
  ["leap.nvim"] = {
    config = { 'require("setup/leap")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { 'require("setup/lsp_lines")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { 'require("setup/lsp_signature")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("setup/lualine")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["marks.nvim"] = {
    config = { 'require("setup/marks")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-tool-installer.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/mason-tool-installer.nvim",
    url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["null-ls.nvim"] = {
    config = { 'require("setup/lsp")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["numb.nvim"] = {
    config = { 'require("setup/numb")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("setup/autopairs")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { 'require("setup/cmp")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-hlslens"] = {
    config = { 'require("setup/hlslens")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { 'require("setup/treesitter")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { 'require("setup/project")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["session-lens"] = {
    config = { 'require("setup/session-lens")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  ["smart-splits.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  ["stabilize.nvim"] = {
    config = { 'require("setup/stabilize")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("setup/telescope")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { 'require("setup/todo-comments")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { 'require("setup/colorscheme")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { 'require("setup/trouble")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { 'require("setup/twilight")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-asterisk"] = {
    config = { 'require("setup/asterisk")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-asterisk",
    url = "https://github.com/haya14busa/vim-asterisk"
  },
  ["vim-autoread"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-autoread",
    url = "https://github.com/djoshea/vim-autoread"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-hardtime"] = {
    config = { 'require("setup/hardtime")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-hardtime",
    url = "https://github.com/takac/vim-hardtime"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-speeddating",
    url = "https://github.com/tpope/vim-speeddating"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  },
  ["vim-wildgitignore"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-wildgitignore",
    url = "https://github.com/jason0x43/vim-wildgitignore"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { 'require("setup/which-key")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["winshift.nvim"] = {
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/winshift.nvim",
    url = "https://github.com/sindrets/winshift.nvim"
  },
  ["yanky.nvim"] = {
    config = { 'require("setup/yanky")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/yanky.nvim",
    url = "https://github.com/gbprod/yanky.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { 'require("setup/zen")' },
    loaded = true,
    path = "/home/jeff/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
require("setup/zen")
time([[Config for zen-mode.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require("setup/gitsigns")
time([[Config for gitsigns.nvim]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
require("setup/lsp_lines")
time([[Config for lsp_lines.nvim]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
require("setup/hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: session-lens
time([[Config for session-lens]], true)
require("setup/session-lens")
time([[Config for session-lens]], false)
-- Config for: vim-hardtime
time([[Config for vim-hardtime]], true)
require("setup/hardtime")
time([[Config for vim-hardtime]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("setup/lualine")
time([[Config for lualine.nvim]], false)
-- Config for: flutter-tools.nvim
time([[Config for flutter-tools.nvim]], true)
require("setup/flutter-tools")
time([[Config for flutter-tools.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("setup/which-key")
time([[Config for which-key.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require("setup/lsp")
time([[Config for null-ls.nvim]], false)
-- Config for: hydra.nvim
time([[Config for hydra.nvim]], true)
require("setup/hydra")
time([[Config for hydra.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
require("setup/marks")
time([[Config for marks.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
require("setup/leap")
time([[Config for leap.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require("setup/trouble")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("setup/cmp")
time([[Config for nvim-cmp]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
require("setup/stabilize")
time([[Config for stabilize.nvim]], false)
-- Config for: yanky.nvim
time([[Config for yanky.nvim]], true)
require("setup/yanky")
time([[Config for yanky.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("setup/treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
require("setup/lsp_signature")
time([[Config for lsp_signature.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
require("setup/project")
time([[Config for project.nvim]], false)
-- Config for: vim-asterisk
time([[Config for vim-asterisk]], true)
require("setup/asterisk")
time([[Config for vim-asterisk]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
require("setup/numb")
time([[Config for numb.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("setup/telescope")
time([[Config for telescope.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
require("setup/todo-comments")
time([[Config for todo-comments.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require("setup/guides")
time([[Config for indent-blankline.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
require("setup/twilight")
time([[Config for twilight.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
require("setup/colorscheme")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("setup/autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
require("setup/fterm")
time([[Config for FTerm.nvim]], false)

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
