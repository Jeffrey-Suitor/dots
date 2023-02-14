require('nvim-treesitter.configs').setup {
    -- ensure_installed = "all",
    ignore_install = { "php" },
	highlight = {
		enable = true
	},
	context_commentstring = {
		enable = true
	},
	rainbow = {
		enable = true,
		extended_mode = true
	},
	autotag = {
		enable = true
	},
}
