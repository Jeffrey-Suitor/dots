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
	hint = hint,
	config = {
		color = "pink",
		invoke_on_body = true,
		hint = {
			position = "bottom",
			border = "rounded",
		},
		on_enter = function()
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
			{ expr = true },
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
			{ expr = true },
		},
		{ "s", ":Gitsigns stage_hunk<CR>", { silent = true } },
		{ "u", gitsigns.undo_stage_hunk },
		{ "S", gitsigns.stage_buffer },
		{ "p", gitsigns.preview_hunk },
		{ "d", gitsigns.toggle_deleted, { nowait = true } },
		{ "b", gitsigns.blame_line },
		{
			"B",
			function()
				gitsigns.blame_line({ full = true })
			end,
		},
		{ "/", gitsigns.show, { exit = true } }, -- show the base of the file
		{ "<Enter>", "<cmd>Neogit<CR>", { exit = true } },
		{ "q", nil, { exit = true, nowait = true } },
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
		{ "h", cmd("BufferPrevious") },
		{ "l", cmd("BufferNext"), { desc = "choose" } },
		{ "H", cmd("BufferMovePrevious") },
		{ "L", cmd("BufferMoveNext"), { desc = "move" } },
		{ "q", cmd("BufferClose"), { desc = "close" } },
		{ "b", cmd("Telescope buffers"), { exit = true, desc = "Explorer" } },
		{ "od", cmd("BufferOrderByDirectory"), { desc = "by directory" } },
		{ "ol", cmd("BufferOrderByLanguage"), { desc = "by language" } },
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
 ^^^^^^     Move     ^^^^^^   ^^    Size   ^^   ^^     Split
 ^^^^^^--------------^^^^^^   ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^   ^ ^ _K_ ^ ^    ^   _<C-k>_   ^   _s_: horizontally
 _h_ ^ ^ _l_   _H_ ^ ^ _L_    _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^    ^   _<C-j>_   ^   _q_: close
 focus^^^^^^   window^^^^^^   ^ _=_ equalize^   _b_: choose buffer
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
		{ "v", "<C-w>v" },
		{ "b", choose_buffer, { exit = true, desc = "choose buffer" } },
		{ "q", cmd([[try | close | catch /^Vim\%((\a\+)\)\=:E444:/ | endtry]]) },
		{ "<Esc>", nil, { exit = true, desc = false } },
	},
})
