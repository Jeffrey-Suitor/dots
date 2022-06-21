require("trouble").setup {}

require("which-key").register({
	["2"] = {"<cmd>TroubleToggle<CR>", "error-list"},
}, {prefix = "<leader>"})

