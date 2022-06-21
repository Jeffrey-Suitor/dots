require("zen-mode").setup {}

require('which-key').register({
	["5"] = {"<cmd>ZenMode<CR>", "zen-mode"},
}, {prefix="<leader>"})
