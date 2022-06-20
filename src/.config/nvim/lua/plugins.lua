local map = require('utils').map
local get_setup = require('utils').get_setup


return require("packer").startup({
    function(use)
        use({ "wbthomason/packer.nvim" })


        --------------------- LSP -------------------
        use({
            "williamboman/nvim-lsp-installer",
            config = function() require("nvim-lsp-installer").setup {} end
        })

        use({
            "neovim/nvim-lspconfig",
            after = "nvim-lsp-installer",
            config = function()
                -- require('lspconfig').sumneko_lua.setup {}
            end
        })
        ----------------------------------------------

        ----------------- TREESITTER -----------------
        use({ "nvim-treesitter/nvim-treesitter-context" })
        use({ 'p00f/nvim-ts-rainbow' })
        use({ 'windwp/nvim-ts-autotag' })
        use({ 'JoosepAlviste/nvim-ts-context-commentstring' })
        use({
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require('nvim-treesitter.configs').setup {
                    ensure_installed = "all",
                    highlight = {
                        enable = true,
                    },
                    context_commentstring = {
                        enable = true,
                    },
                    rainbow = {
                        enable = true,
                        extended_mode = true,
                    },
                    autotag = {
                        enable = true,
                    }
                }
            end,
            run = ":TSUpdate",
        })
        ----------------------------------------------

        ----------------- TELESCOPE ------------------
        use({ "cljoly/telescope-repo.nvim" })
        use({ "nvim-telescope/telescope-file-browser.nvim" })
        use({
            "nvim-telescope/telescope.nvim",
            module = "telescope",
            cmd = "Telescope",
            requires = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            },
            config = function()
                require("telescope").load_extension("fzf")
                require("telescope").load_extension("session-lens")
                require("telescope").load_extension("file_browser")
                require("telescope").load_extension("repo")
            end
        })
        ----------------------------------------------


        --------------- CODE -------------------------
        -- use({ 'windwp/nvim-autopairs', config = require('nvim-autopairs').setup {} })
    end
})
