return {

  {
    "rmagatti/session-lens",
    dependencies = {
      { "rmagatti/auto-session" },
      { "nvim-telescope/telescope.nvim" }
    },
    config = function()
      require("session-lens").setup({})

      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

      require("auto-session").setup({
        auto_session_enable_last_session = true,
        auto_session_suppress_dirs = { "~/", "~/code" },
      })

      require("which-key").register({
        s = {
          name = "session manager",
          ["<Space>"] = { ":SearchSession<cr>", "search session" },
          s = { ":SaveSession<cr>", "save session" },
          r = { ":RestoreSession<cr>", "restore session" },
          d = { ":DeleteSession<cr>", "delete session" },
        },
      }, { prefix = "<leader>" })

      require("telescope").load_extension("session-lens")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "rmagatti/session-lens", },
      { "danielvolchek/tailiscope.nvim" },
      { "tsakirist/telescope-lazy.nvim" },
      { "ahmedkhalf/project.nvim" },
      { "debugloop/telescope-undo.nvim" },
    },
    config = function()

      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git", "undo" },
        },
      })

      require('telescope').load_extension('tailiscope')
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("yank_history")
      require("telescope").load_extension("projects")
      require("telescope").load_extension("git_worktree")
      require("telescope").load_extension("lazy")
      require("telescope").load_extension("undo")

      local wk = require("which-key")

      wk.register({
        f = {
          name = "+find",
          ["<Space>"] = { ":Telescope resume<CR>", "resume" },
          f = { ":Telescope find_files hidden=true<CR>", "find files" },
          F = { ":Telescope file_browser<CR>", "file browser" },
          g = { ":Telescope git_files<CR>", "git files" },
          b = { ":Telescope buffers<CR>", "buffers" },
          p = { ":Telescope projects<CR>", "projects" },
          h = { ":Telescope harpoon marks<CR>", "harpoon" },
          H = { ":Telescope help_tags<CR>", "help tags" },
          R = { ":Telescope live_grep<CR>", "live grep" },
          t = { ":Telescope tags<CR>", "tags" },
          T = { ":Telescope tailiscope<CR>", "tailwind" },
          m = { ":Telescope marks<CR>", "marks" },
          o = { ":Telescope oldfiles<CR>", "old files" },
          q = { ":Telescope quickfix<CR>", "quickfix" },
          l = { ":Telescope loclist<CR>", "location list" },
          L = { ":Telescope lazy<CR>", "plugins" },
          C = { ":Telescope commands<CR>", "commands" },
          c = { ":Telescope command_history<CR>", "command history" },
          M = { ":Telescope keymaps<CR>", "keymaps" },
          s = { ":Telescope search_history<CR>", "search history" },
          u = { ":Telescope undo<CR>", "search history" },
          S = { ":Vista finder<CR>", "search history" },
        },
      }, { prefix = "<leader>" })

      vim.keymap.set("n", "<C-Space>", ":Telescope live_grep<CR>", { silent = true })
      vim.keymap.set("n", "<C-c>", ":Telescope command_history<CR>", { silent = true })
    end,
  },
  --
}
