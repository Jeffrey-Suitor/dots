return {
  {
    'glepnir/lspsaga.nvim',
    event = 'BufRead',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'folke/which-key.nvim' }
    },
    config = function()
      require('lspsaga').setup({
        symbol_in_winbar = {
          enable = false
        }
      })

      local wk = require("which-key")
      wk.register({
        h = { ":Lspsaga hover_doc<CR>", "hover" },
        H = { ":Lspsaga hover_doc ++keep<CR>", "hover keep" },
        r = { ":Lspsaga rename<CR>", "rename" },
        R = { ":Lspsaga rename ++project<CR>", "project wide rename" },
        o = { ":Lspsaga outline<CR>", "outline" },
        d = {
          name = "+diagnostics",
          l = { ":Lspsaga show_line_diagnostics<CR>", "line diagnostics" },
          b = { ":Lspsaga show_cursor_diagnostics<CR>", "cursor diagnostics" },
          c = { ":Lspsaga show_cursor_diagnostics<CR>", "cursor diagnostics" },
          k = { ":Lspsaga diagnostic_jump_prev<CR>", "prev diagnostic" },
          j = { ":Lspsaga diagnostic_jump_next<CR>", "next diagnostic" },
          K = { ":lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })",
            "prev error" },
          J = { ":lua require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })",
            "next error" },
        }
      }, { prefix = '<leader>' })
      -- Diagnostic jump can use `<c-o>` to jump back
      local keymap = vim.keymap.set
      keymap("n", "gh", ":Lspsaga lsp_finder<CR>")
      keymap("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", { desc = "next diagnostic" })
      keymap("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", { desc = "prev diagnostic" })
      keymap("n", "K", ":Lspsaga hover_doc ++quiet<CR>")
      keymap("n", "[D",
        function() require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
        { desc = "next error" })
      keymap("n", "]D",
        function() require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR }) end,
        { desc = "prev error" })
    end
  },
  { "windwp/nvim-autopairs", dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
      require("nvim-autopairs").setup {}
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- Visual appareance
      { "onsails/lspkind-nvim" },
      { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = true },

      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional
      { 'hrsh7th/cmp-cmdline' },
      { "dmitmel/cmp-cmdline-history" },
      { 'petertriho/cmp-git' },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol" },
      { "zbirenbaum/copilot-cmp", dependencies = { "copilot.lua" }, config = true },

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional

      -- Copilot
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
          require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
          })
        end
      },
    },
    config = function()
      local lsp = require('lsp-zero')
      local cmp = require("cmp")
      lsp.preset('recommended')
      lsp.setup_nvim_cmp({
        sources = {
          { name = "copilot" },
          { name = "nvim_lsp_signature_help" },
          { name = "cmp-nvim-lsp-document-symbol" },
          { name = "path" },
          { name = "git" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "luasnip" },
        },
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' },
          { name = 'cmdline_history' },
        })
      })

      -- (Optional) Configure lua language server for neovim
      lsp.nvim_workspace()
      lsp.setup()

      require("which-key").register({
        n = { ":lua require('ts-node-action').node_action()<CR>", "node action" },
        F = { ":LspZeroFormat<CR>", "format" },
        l = {
          name = "+lsp",
          s = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "symbols" },
          e = { ":Telescope lsp_workspace_diagnostics<cr>", "errors" },
          d = { ":Telescope lsp_definitions<cr>", "definitions" },
          D = { ":Lspsaga goto_definition<cr>", "goto definition" },
          p = { ":Lspsaga peek_definition<cr>", "peek definition" },
          r = { ":Telescope lsp_references<cr>", "references" },
          R = { ":Lspsaga rename<CR>", "rename" },
          P = { ":Lspsaga rename ++project<CR>", "project wide rename" },
          i = { ":Telescope lsp_implementations<cr>", "implementations" },
          t = { ":Telescope lsp_type_definitions<cr>", "type-definitions" },
          [","] = { ":Lspsaga diagnostic_jump_prev<CR>", "prev error" },
          [";"] = { ":Lspsaga diagnostic_jump_next<CR>", "next error" },
          a = { ":Lspsaga code_action<CR>", "code action" },
          f = { ":Lspsaga lsp_finder<CR>", "finder" },
          h = { ":Lspsaga hover_doc<CR>", "hover" },
          H = { ":Lspsaga hover_doc ++keep<CR>", "hover keep" },
          l = { ":lua require('lsp_lines').toggle<CR>", "Toggle lsp_lines" },
          c = {
            name = "+calls",
            i = { ":Lspsaga incoming_calls<CR>", "Incoming calls" },
            o = { ":Lspsaga outgoing_calls<CR>", "Outgoing calls" },
          }
        },
      }, { prefix = "<leader>" })
    end
  },
}
