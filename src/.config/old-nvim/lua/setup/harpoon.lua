require("harpoon").setup({
	menu = {
		width = vim.api.nvim_win_get_width(0) - 32,
	},
})

require("which-key").register({
	m = {
		name = "+marks",
		["1"] = { ":lua require('harpoon.ui').nav_file(1)<CR>", "mark 1" },
		["2"] = { ":lua require('harpoon.ui').nav_file(2)<CR>", "mark 2" },
		["3"] = { ":lua require('harpoon.ui').nav_file(3)<CR>", "mark 3" },
		["4"] = { ":lua require('harpoon.ui').nav_file(4)<CR>", "mark 4" },
		["5"] = { ":lua require('harpoon.ui').nav_file(5)<CR>", "mark 5" },
		["6"] = { ":lua require('harpoon.ui').nav_file(6)<CR>", "mark 6" },
		["7"] = { ":lua require('harpoon.ui').nav_file(7)<CR>", "mark 7" },
		["8"] = { ":lua require('harpoon.ui').nav_file(8)<CR>", "mark 8" },
		["9"] = { ":lua require('harpoon.ui').nav_file(9)<CR>", "mark 9" },
		["0"] = { ":lua require('harpoon.ui').nav_file(0)<CR>", "mark 0" },
		h = { ":lua require('harpoon.ui').nav_next()<CR>", "next file" },
		l = { ":lua require('harpoon.ui').nav_prev()<CR>", "prev file" },
		m = { ":lua require('harpoon.mark').add_file()<CR>", "mark file" },
		["<Space>"] = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "marks" },
	},
	t = {
		name = "+terminal",
		["1"] = { ":lua require('harpoon.term').gotoTerminal(1)<CR>", "terminal 1" },
		["2"] = { ":lua require('harpoon.term').gotoTerminal(2)<CR>", "terminal 2" },
		["3"] = { ":lua require('harpoon.term').gotoTerminal(3)<CR>", "terminal 3" },
		["4"] = { ":lua require('harpoon.term').gotoTerminal(4)<CR>", "terminal 4" },
		["5"] = { ":lua require('harpoon.term').gotoTerminal(5)<CR>", "terminal 5" },
		["6"] = { ":lua require('harpoon.term').gotoTerminal(6)<CR>", "terminal 6" },
		["7"] = { ":lua require('harpoon.term').gotoTerminal(7)<CR>", "terminal 7" },
		["8"] = { ":lua require('harpoon.term').gotoTerminal(8)<CR>", "terminal 8" },
		["9"] = { ":lua require('harpoon.term').gotoTerminal(9)<CR>", "terminal 9" },
		["0"] = { ":lua require('harpoon.term').gotoTerminal(0)<CR>", "terminal 10" },
		m = { "lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", "terminal commands" },
		["<Space>"] = { "lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", "terminal commands" },
	},
}, { prefix = "<leader>" })

require("telescope").load_extension("harpoon")

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { silent = true })
