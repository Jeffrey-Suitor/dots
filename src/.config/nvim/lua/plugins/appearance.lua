return {
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        messages = {
          view_search = false,
          view_warn = 'mini',
          view = 'mini',
        },
        notify = {
          enabled = true,
          view = "mini",
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        integrations = {
          barbar = true,
          beacon = true,
          cmp = true,
          gitgutter = true,
          gitsigns = true,
          harpoon = true,
          leap = true,
          lsp_saga = true,
          lsp_trouble = true,
          mason = true,
          neogit = true,
          noice = true,
          notify = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          ts_rainbow = true,
          which_key = true,
          indent_blankline = {
            colored_indent_levels = true,
            enabled = true,
          }
        }
      })
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  { "feline-nvim/feline.nvim", dependencies = { "catppuccin/nvim" }, config = true },
  {
    "romgrk/barbar.nvim",
    config = function()
      require("bufferline").setup {
        exclude_ft = { "terminal" },
        auto_hide = true,
        diagnostics = {
          -- you can use a list
          { enabled = true }, -- ERROR
          { enabled = true }, -- WARN
          { enabled = true }, -- INFO
          { enabled = true }, -- HINT
        }
      }
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  }, -- Bufferline for neovim
  { "lukas-reineke/indent-blankline.nvim", config = true }, -- Add blank line indicators
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async', 'nvim-treesitter/nvim-treesitter' },
    config = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      require('ufo').setup({
        provider_selector = function(_, _, _)
          return { 'treesitter', 'indent' }
        end
      })


    end
  },

}
