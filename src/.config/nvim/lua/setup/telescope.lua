require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", ".git", "undo" },
	},
	extensions = {
		repo = {
			list = {
				fd_opts = {
					"--no-ignore-vcs",
				},
				search_dirs = {
					"~/code",
				},
			},
		},
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("session-lens")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("repo")
require("telescope").load_extension("yank_history")
require("telescope").load_extension("projects")

local wk = require("which-key")

wk.register({
	f = {
		name = "+find",
		["<Space>"] = { ":Telescope resume<CR>", "resume" },
		f = { ":Telescope find_files hidden=true<CR>", "find files" },
		F = { ":Telescope file_browser<CR>", "file browser" },
		g = { ":Telescope git_files<CR>", "git files" },
		b = { ":Telescope buffers<CR>", "buffers" },
		r = { ":Telescope repo list<CR>", "repos" },
		h = { ":Telescope help_tags<CR>", "help tags" },
		R = { ":Telescope live_grep<CR>", "live grep" },
		t = { ":Telescope tags<CR>", "tags" },
		m = { ":Telescope marks<CR>", "marks" },
		o = { ":Telescope oldfiles<CR>", "old files" },
		q = { ":Telescope quickfix<CR>", "quickfix" },
		l = { ":Telescope loclist<CR>", "location list" },
		C = { ":Telescope commands<CR>", "commands" },
		c = { ":Telescope command_history<CR>", "command history" },
		M = { ":Telescope keymaps<CR>", "keymaps" },
		s = { ":Telescope search_history<CR>", "search history" },
		s = { ":Vista finder<CR>", "search history" },
	},
}, { prefix = "<leader>" })

local map = require("../utils").map
map("n", "<C-Space>", ":Telescope live_grep<CR>", { silent = true })
map("n", "<C-c>", ":Telescope command_history<CR>", { silent = true })
