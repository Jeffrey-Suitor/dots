vim.keymap.set('t', '<9>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

local wk = require("which-key")
wk.register({
	["9"] = {"<CMD> lua require('FTerm').toggle()<CR>", "terminal"}
}, { prefix = "<leader>" })
