vim.g.mapleader = " "
vim.opt.timeoutlen = 0

local map = require("../utils").map

map("n", "j", "gj", {silent = true})
map("n", "k", "gk", {silent = true})
map("n", "<CR>", ":FineCmdline<CR>", {silent = true})

local wk = require("which-key")
wk.setup {spelling = { enabled = true}}

wk.register({
	b = {
		name = "+buffers",
	['1'] = { "<cmd>BufferGoto 1<CR>", "buffer 1" },
	['2'] = { "<cmd>BufferGoto 2<CR>", "buffer 2" },
	['3'] = { "<cmd>BufferGoto 3<CR>", "buffer 3" },
		['4'] = { "<cmd>BufferGoto 4<CR>", "buffer 4" },
		['5'] = { "<cmd>BufferGoto 5<CR>", "buffer 5" },
		['6'] = { "<cmd>BufferGoto 6<CR>", "buffer 6" },
		['7'] = { "<cmd>BufferGoto 7<CR>", "buffer 7" },
		['8'] = { "<cmd>BufferGoto 8<CR>", "buffer 8" },
		['9'] = { "<cmd>BufferGoto 9<CR>", "buffer 9" },
		['10'] = { "<cmd>BufferGoto 10<CR>", "buffer 10" },
		h = { "<cmd>BufferPrevious<CR>", "buffer previous" },
		l = { "<cmd>BufferNext<CR>", "buffer next" },
		k = { "<cmd>BufferMovePrevious<CR>", "buffer move previous" },
		j = { "<cmd>BufferMoveNext<CR>", "buffer move next" },
		p = { "<cmd>BufferPick<CR>", "buffer pick" },
		g = { "<cmd>BufferLast<CR>", "buffer last" },
		q = { "<cmd>BufferClose<CR>", "buffer close" },
	},

        r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "rename"},
        f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "format"},
        ["\\"] = {"<cmd>nohlsearch<cr>", "clear highlight"},
}, { prefix = "<leader>" })
