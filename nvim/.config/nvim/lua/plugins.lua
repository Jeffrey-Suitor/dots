local use = require('packer').use
return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager

    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use 'jose-elias-alvarez/null-ls.nvim' -- Use formatters with built in LSP

    use 'github/copilot.vim' -- AI based completion prediction

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Install treesitter for better highlighting
    use 'nvim-treesitter/nvim-treesitter-textobjects' -- More treesitter object
    use 'nvim-treesitter/nvim-treesitter-refactor' -- Better treesitter refactor
    use 'p00f/nvim-ts-rainbow' -- Rainbow parens
    use 'romgrk/nvim-treesitter-context' -- Show high level function info
    use 'windwp/nvim-autopairs' -- Autopairs for treesitter
    use 'windwp/nvim-ts-autotag' -- Autotag for treesitter
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- Change the comment string based on TS

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- FZF based search
    use 'cljoly/telescope-repo.nvim' -- Repo based search
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-telescope/telescope-symbols.nvim'


    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            { 'tami5/sqlite.lua', module = 'sqlite' },
            { 'nvim-telescope/telescope.nvim' },
        },
        config = function()
            require('neoclip').setup()
        end,
    }

    use {
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    }

end)
