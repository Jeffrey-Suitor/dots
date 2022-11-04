local get_setup = require("utils").get_setup

return require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim" })
		use({ "folke/which-key.nvim", config = get_setup("which-key") })

		--------------------- LSP -------------------

		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })
		use({ "WhoIsSethDaniel/mason-tool-installer.nvim" })
		use({ "neovim/nvim-lspconfig" })
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = get_setup("lsp"),
		})
		----------------------------------------------

		----------------- TREESITTER -----------------
		use({ "nvim-treesitter/nvim-treesitter-context" })
		use({ "p00f/nvim-ts-rainbow" })
		use({ "windwp/nvim-ts-autotag" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring" })
		use({ "nvim-treesitter/nvim-treesitter", config = get_setup("treesitter"), run = ":TSUpdate" })
		----------------------------------------------

		-------------- UX IMPROVEMENTS ---------------
		use({ "smjonas/live-command.nvim", config = get_setup("live-command") })
		use({ "takac/vim-hardtime", config = get_setup("hardtime") })
		use({ "szw/vim-maximizer" })
		use({ "sindrets/winshift.nvim" })
		use({ "mrjones2014/smart-splits.nvim" })
		use({ "nacro90/numb.nvim", config = get_setup("numb") })
		use({ "gbprod/yanky.nvim", config = get_setup("yanky") })
		use({ "tpope/vim-surround" })
		use({ "djoshea/vim-autoread" })
		use({ "tpope/vim-speeddating" })
		use({ "tpope/vim-repeat" })
		use({ "tpope/vim-commentary" })
		use({ "tpope/vim-sleuth" })
		use({ "editorconfig/editorconfig" })
		use({ "chaoren/vim-wordmotion" })
		use({
			"ahmedkhalf/project.nvim",
			config = get_setup("project"),
		})
		use({ "wellle/targets.vim" })
		use({ "jason0x43/vim-wildgitignore" })
		use({ "tpope/vim-unimpaired" })
		use({ "ggandor/leap.nvim", config = get_setup("leap") })
		use({ "tpope/vim-abolish" })
		----------------------------------------------

		------------ APPEARANCE ----------------------
		use({ "danilamihailov/beacon.nvim" })
		use({ "folke/twilight.nvim", config = get_setup("twilight") })
		use({ "folke/zen-mode.nvim", config = get_setup("zen") })
		use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" }, config = get_setup("barbar") })
		use({ "chentoast/marks.nvim", config = get_setup("marks") })
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = get_setup("lualine"),
		})
		use({ "lukas-reineke/indent-blankline.nvim", config = get_setup("guides") })
		use({ "ryanoasis/vim-devicons" })
		use({ "kevinhwang91/nvim-hlslens", config = get_setup("hlslens") })
		use({ "haya14busa/vim-asterisk", config = get_setup("asterisk") })
		use({ "onsails/lspkind-nvim" })

		--------------- Colorschemes ------------------
		use({ "catppuccin/nvim", as = "catppuccin" })
		use({ "folke/tokyonight.nvim", config = get_setup("colorscheme") })
		----------------------------------------------

		--------------- CODE -------------------------
		use({ "ThePrimeagen/git-worktree.nvim" })
		use({ "ThePrimeagen/harpoon", config = get_setup("harpoon") })
		use({
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			config = get_setup("lsp_lines"),
		})
		use({ "windwp/nvim-autopairs", config = get_setup("autopairs") })
		use({ "folke/trouble.nvim", config = get_setup("trouble") })
		use({ "ray-x/lsp_signature.nvim", config = get_setup("lsp_signature") })
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = get_setup("todo-comments"),
		})
		use({ "lewis6991/gitsigns.nvim", config = get_setup("gitsigns") })
		use({
			"akinsho/flutter-tools.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = get_setup("flutter-tools"),
		})
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "hrsh7th/cmp-nvim-lsp-signature-help" },
				{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
				{ "hrsh7th/cmp-buffer" },
				-- { "hrsh7th/cmp-copilot" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-cmdline" },
				{ "dmitmel/cmp-cmdline-history" },
				{ "hrsh7th/vim-vsnip" },
				{ "hrsh7th/cmp-vsnip" },
				{ "hrsh7th/vim-vsnip-integ" },
				{ "hrsh7th/cmp-calc" },
				{ "rafamadriz/friendly-snippets" },
			},
			config = get_setup("cmp"),
		})
		use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
		use({ "liuchengxu/vista.vim" })
		use({
			"anuvyklack/hydra.nvim",
			requires = "anuvyklack/keymap-layer.nvim",
			config = get_setup("hydra"),
		})
		use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
		----------------------------------------------

		----------------- TELESCOPE ------------------
		use({ "nvim-telescope/telescope-file-browser.nvim" })
		use({
			"rmagatti/session-lens",
			requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
			config = get_setup("session-lens"),
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
			config = get_setup("telescope"),
		})
		----------------------------------------------
	end,
})
