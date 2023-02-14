return {
  { 
    "ThePrimeagen/git-worktree.nvim", 
    config = function()
      require("telescope").load_extension("git_worktree")
      local wk = require("which-key")
      wk.register({
        G = {
          name = "+git worktrees",
          c = { ":Telescope git_worktree create_git_worktree<CR>", "create worktree" },
          g = { ":Telescope git_worktree git_worktrees<CR>", "worktrees" },
          ["<Space>"] = { ":Telescope git_worktree git_worktrees<CR>", "worktrees" },
        },
      }, { prefix = "<leader>" })
    end
  },
}
