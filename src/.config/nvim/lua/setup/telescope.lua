require('telescope').setup {}
require("telescope").load_extension("fzf")
require("telescope").load_extension("session-lens")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("repo")
require("telescope").load_extension("yank_history")

local wk = require('which-key')

wk.register({
	f = {
		name = "+find",
		["<Space>"] = { "<cmd>Telescope resume<cr>", "resume" },
		f = { "<cmd>Telescope find_files<cr>", "find files" },
		F = { "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", "file browser" },
		g = { "<cmd>Telescope git_files<cr>", "git files" },
		b = { "<cmd>Telescope buffers<cr>", "buffers" },
		r = { '<cmd>lua require("telescope").extensions.repo.cached_list{file_ignore_patterns={"/%.cache/", "/%.cargo/"}}<CR>',
			"repos" },
		R = { "<cmd>Telescope live_grep<cr>", "live grep" },
		t = { "<cmd>Telescope tags<cr>", "tags" },
		m = { "<cmd>Telescope marks<cr>", "marks" },
		o = { "<cmd>Telescope oldfiles<cr>", "old files" },
		q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
		l = { "<cmd>Telescope loclist<cr>", "location list" },
		C = { "<cmd>Telescope commands<cr>", "commands" },
		c = { "<cmd>Telescope command_history<cr>", "command history" },
		M = { "<cmd>Telescope keymaps<cr>", "keymaps" },
		s = { "<cmd>Telescope search_history<cr>", "search history" },
	},
}, {prefix = "<leader>"})

local map = require("../utils").map
map("n", "<C-Space>", ":Telescope live_grep<CR>", {silent = true})
map("n", "<C-c>", ":Telescope command_history<CR>", {silent = true})
