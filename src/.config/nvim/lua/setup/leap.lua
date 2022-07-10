local map = require("../utils").map

function leap_all_windows()
	require("leap").leap({
		["target-windows"] = vim.tbl_filter(function(win)
			return vim.api.nvim_win_get_config(win).focusable
		end, vim.api.nvim_tabpage_list_wins(0)),
	})
end

function leap_bidirectional()
	require("leap").leap({ ["target-windows"] = { vim.api.nvim_get_current_win() } })
end

vim.keymap.set("n", "s", leap_bidirectional, { silent = true })
vim.keymap.set("n", "S", leap_all_windows, { silent = true })
