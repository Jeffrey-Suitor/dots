local Hydra = require("hydra")
local splits = require("smart-splits")
local gitsigns = require("gitsigns")
local wk = require("which-key")
wk.register({
	g = "+git",
}, { prefix = "<leader>" })

Hydra({
	name = "Side scroll",
	mode = "n",
	body = "z",
	heads = {
		{ "h", "5zh" },
		{ "l", "5zl", { desc = "←/→" } },
		{ "H", "zH" },
		{ "L", "zL", { desc = "half screen ←/→" } },
	},
})

local hint = [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _K_: prev hunk   _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full
 ^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
 ^
 ^ ^              _<Enter>_: Neogit              _q_: exit
]]

Hydra({
	name = "Git",
	hint = hint,
	config = {
		buffer = bufnr,
		color = "pink",
		invoke_on_body = true,
		hint = {
			border = "rounded",
		},
		on_enter = function()
			vim.cmd("silent! %foldopen!")
			vim.bo.modifiable = false
			gitsigns.toggle_signs(true)
			gitsigns.toggle_linehl(true)
		end,
		on_exit = function()
			gitsigns.toggle_signs(false)
			gitsigns.toggle_linehl(false)
			gitsigns.toggle_deleted(false)
		end,
	},
	mode = { "n", "x" },
	body = "<leader>g",
	heads = {
		{
			"J",
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gitsigns.next_hunk()
				end)
				return "<Ignore>"
			end,
			{ expr = true, desc = "next hunk" },
		},
		{
			"K",
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gitsigns.prev_hunk()
				end)
				return "<Ignore>"
			end,
			{ expr = true, desc = "prev hunk" },
		},
		{ "s", ":Gitsigns stage_hunk<CR>", { silent = true, desc = "stage hunk" } },
		{ "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
		{ "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
		{ "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
		{ "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
		{ "b", gitsigns.blame_line, { desc = "blame" } },
		{
			"B",
			function()
				gitsigns.blame_line({ full = true })
			end,
			{ desc = "blame show full" },
		},
		{ "/", gitsigns.show, { exit = true, desc = "show base file" } }, -- show the base of the file
		{ "<Enter>", "<Cmd>Neogit<CR>", { exit = true, desc = "Neogit" } },
		{ "q", nil, { exit = true, nowait = true, desc = "exit" } },
	},
})

local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

local buffer_hydra = Hydra({
	name = "Buffer",
	config = {
		timeout = 2000,
	},
	heads = {
		{
			"h",
			function()
				vim.cmd("BufferPrevious")
			end,
			{ on_key = false },
		},
		{
			"l",
			function()
				vim.cmd("BufferNext")
			end,
			{ desc = "choose", on_key = false },
		},

		{
			"H",
			function()
				vim.cmd("BufferMovePrevious")
			end,
		},
		{
			"L",
			function()
				vim.cmd("BufferMoveNext")
			end,
			{ desc = "move" },
		},

		{
			"p",
			function()
				vim.cmd("BufferPin")
			end,
			{ desc = "pin" },
		},

		{
			"d",
			function()
				vim.cmd("BufferClose")
			end,
			{ desc = "close" },
		},
		{
			"c",
			function()
				vim.cmd("BufferClose")
			end,
			{ desc = false },
		},
		{
			"q",
			function()
				vim.cmd("BufferClose")
			end,
			{ desc = false },
		},

		{
			"od",
			function()
				vim.cmd("BufferOrderByDirectory")
			end,
			{ desc = "by directory" },
		},
		{
			"ol",
			function()
				vim.cmd("BufferOrderByLanguage")
			end,
			{ desc = "by language" },
		},
		{ "<Esc>", nil, { exit = true } },
	},
})

local function choose_buffer()
	if #vim.fn.getbufinfo({ buflisted = true }) > 1 then
		buffer_hydra:activate()
	end
end

vim.keymap.set("n", "gb", choose_buffer)

local window_hint = [[
 ^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
 ^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally
 _h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
 focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_: maximize
 ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
 _b_: choose buffer
]]

Hydra({
	name = "WINDOWS",
	hint = window_hint,
	config = {
		invoke_on_body = true,
		color = "pink",
		hint = {
			border = "rounded",
			position = "middle",
		},
	},
	mode = "n",
	body = "<C-w>",
	heads = {
		{ "h", "<C-w>h" },
		{ "j", "<C-w>j" },
		{ "k", cmd([[try | wincmd k | catch /^Vim\%((\a\+)\)\=:E11:/ | close | endtry]]) },
		{ "l", "<C-w>l" },

		{ "H", cmd("WinShift left") },
		{ "J", cmd("WinShift down") },
		{ "K", cmd("WinShift up") },
		{ "L", cmd("WinShift right") },

		{
			"<C-h>",
			function()
				splits.resize_left(2)
			end,
		},
		{
			"<C-j>",
			function()
				splits.resize_down(2)
			end,
		},
		{
			"<C-k>",
			function()
				splits.resize_up(2)
			end,
		},
		{
			"<C-l>",
			function()
				splits.resize_right(2)
			end,
		},
		{ "=", "<C-w>=", { desc = "equalize" } },

		{ "s", "<C-w>s" },
		{ "<C-s>", "<C-w><C-s>", { desc = false } },
		{ "v", "<C-w>v" },
		{ "<C-v>", "<C-w><C-v>", { desc = false } },

		{ "w", "<C-w>w", { exit = true, desc = false } },
		{ "<C-w>", "<C-w>w", { exit = true, desc = false } },

		{ "z", cmd("MaximizerToggle!"), { desc = "maximize" } },
		{ "<C-z>", cmd("MaximizerToggle!"), { exit = true, desc = false } },

		{ "z", cmd("MaximizerToggle!"), { desc = "maximize" } },
		{ "<C-z>", cmd("MaximizerToggle!"), { exit = true, desc = false } },

		{ "o", "<C-w>o", { exit = true, desc = "remain only" } },
		{ "<C-o>", "<C-w>o", { exit = true, desc = false } },

		{ "b", choose_buffer, { exit = true, desc = "choose buffer" } },

		{ "c", cmd([[try | close | catch /^Vim\%((\a\+)\)\=:E444:/ | endtry]]) },
		{ "q", cmd([[try | close | catch /^Vim\%((\a\+)\)\=:E444:/ | endtry]]), { desc = "close window" } },
		{ "<C-q>", cmd([[try | close | catch /^Vim\%((\a\+)\)\=:E444:/ | endtry]]), { desc = false } },
		{ "<C-c>", cmd([[try | close | catch /^Vim\%((\a\+)\)\=:E444:/ | endtry]]), { desc = false } },

		{ "<Esc>", nil, { exit = true, desc = false } },
	},
})
