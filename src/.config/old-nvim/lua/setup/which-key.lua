vim.g.mapleader = " "
vim.opt.timeoutlen = 0

local map = require("../utils").map

map("n", "j", "gj", { silent = true })
map("n", "k", "gk", { silent = true })

local wk = require("which-key")
wk.setup({ spelling = { enabled = true } })

wk.register({
	b = {
		name = "+buffers",
		["1"] = { ":BufferGoto 1<CR>", "buffer 1" },
		["2"] = { ":BufferGoto 2<CR>", "buffer 2" },
		["3"] = { ":BufferGoto 3<CR>", "buffer 3" },
		["4"] = { ":BufferGoto 4<CR>", "buffer 4" },
		["5"] = { ":BufferGoto 5<CR>", "buffer 5" },
		["6"] = { ":BufferGoto 6<CR>", "buffer 6" },
		["7"] = { ":BufferGoto 7<CR>", "buffer 7" },
		["8"] = { ":BufferGoto 8<CR>", "buffer 8" },
		["9"] = { ":BufferGoto 9<CR>", "buffer 9" },
		["0"] = { ":BufferGoto 10<CR>", "buffer 10" },
		h = { ":BufferPrevious<CR>", "buffer previous" },
		l = { ":BufferNext<CR>", "buffer next" },
		H = { ":BufferMovePrevious<CR>", "buffer move previous" },
		L = { ":BufferMoveNext<CR>", "buffer move next" },
		p = { ":BufferPick<CR>", "buffer pick" },
		g = { ":BufferLast<CR>", "buffer last" },
		q = { ":BufferClose<CR>", "buffer close" },
		o = {
			name = "+order",
			b = { ":BufferOrderByBufferNumber<CR>", "buffer number" },
			d = { ":BufferOrderByDirectory<CR>", "directory" },
			l = { ":BufferOrderByLanguage<CR>", "language" },
			w = { ":BufferOrderByWindowNumber<CR>", "window number" },
		},
	},
	r = { ":lua vim.lsp.buf.rename()<cr>", "rename" },
	F = { ":lua vim.lsp.buf.format()<cr>", "format" },
	["\\"] = { ":nohlsearch<cr>", "clear highlight" },
	["1"] = { ":Neogit<cr>", "git window" },
	["8"] = { ":Vista<cr>", "symbols" },
}, { prefix = "<leader>" })
