local get_setup = require('utils').get_setup

return require("packer").startup({ function(use)
	use({ "wbthomason/packer.nvim" })
	use({ 'github/copilot.vim' })
	use({ 'folke/which-key.nvim', config = get_setup('which-key') })

	--------------------- LSP -------------------
	use({ "williamboman/nvim-lsp-installer", config = get_setup('lsp-installer') })
	use({ "neovim/nvim-lspconfig", config = get_setup('lsp') })
	use({ "jose-elias-alvarez/null-ls.nvim", config = get_setup('null-ls') })
	----------------------------------------------

	----------------- TREESITTER -----------------
	use({ "nvim-treesitter/nvim-treesitter-context" })
	use({ 'p00f/nvim-ts-rainbow' })
	use({ 'windwp/nvim-ts-autotag' })
	use({ 'JoosepAlviste/nvim-ts-context-commentstring' })
	use({ "nvim-treesitter/nvim-treesitter", config = get_setup('treesitter'), run = ":TSUpdate" })
	----------------------------------------------

	-------------- UX IMPROVEMENTS ---------------
	use({ 'nacro90/numb.nvim', config = get_setup('numb') })
	use({ "gbprod/yanky.nvim", config = get_setup('yanky') })
	use({ 'machakann/vim-sandwich' })
	use({ 'numtostr/FTerm.nvim', config = get_setup('fterm') })
	use({ 'djoshea/vim-autoread' })
	use({ 'tpope/vim-speeddating' })
	use({ 'tpope/vim-repeat' })
	use({ 'tpope/vim-commentary' })
	use({ 'tpope/vim-sleuth' })
	use({ 'editorconfig/editorconfig' })
	use({ 'chaoren/vim-wordmotion' })
	use({ 'airblade/vim-rooter', config = get_setup('rooter') })
	use({ 'wellle/targets.vim' })
	use({ 'jason0x43/vim-wildgitignore' })
	use({ 'tpope/vim-unimpaired' })
	----------------------------------------------

	------------ APPEARANCE ----------------------
	use({ 'danilamihailov/beacon.nvim' })
	use({ 'folke/twilight.nvim', config = get_setup('twilight') })
	use({ 'folke/zen-mode.nvim', config = get_setup('zen') })
	use({ 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
	use({ 'chentoast/marks.nvim', config = get_setup('marks') })
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = get_setup('lualine')
	}
	use({ 'lukas-reineke/indent-blankline.nvim', config = get_setup('guides') })
	use({ 'ryanoasis/vim-devicons' })
	use({ 'unblevable/quick-scope' })
	use({ 'kevinhwang91/nvim-hlslens', config = get_setup('hlslens') })
	use({ 'haya14busa/vim-asterisk', config = get_setup('asterisk') })
	use {
		'VonHeikemen/fine-cmdline.nvim',
		requires = { { 'MunifTanjim/nui.nvim' } },
		config = get_setup('fine-cmdline')
	}
	use({ 'luukvbaal/stabilize.nvim', config = get_setup('stabilize') })
	use({ "onsails/lspkind-nvim" })
	use({ 'folke/tokyonight.nvim', config = get_setup("colorscheme") })
	----------------------------------------------

	--------------- CODE -------------------------
	use({ 'windwp/nvim-autopairs', config = get_setup('autopairs') })
	use({ 'folke/trouble.nvim', config = get_setup('trouble') })
	use({ 'ray-x/lsp_signature.nvim', config = get_setup('lsp_signature') })
	use({
		'folke/todo-comments.nvim',
		requires = "nvim-lua/plenary.nvim",
		config = get_setup('todo-comments')
	})
	use({ 'lewis6991/gitsigns.nvim', config = get_setup('gitsigns') })
	use({
		'akinsho/flutter-tools.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = get_setup('flutter-tools')
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' },
			{ 'hrsh7th/cmp-nvim-lsp-document-symbol' },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-copilot" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ 'dmitmel/cmp-cmdline-history' },
			{ "hrsh7th/vim-vsnip" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip-integ" },
			{ "hrsh7th/cmp-calc" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = get_setup("cmp"),
	})
	use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
	----------------------------------------------

	----------------- TELESCOPE ------------------
	use({ "cljoly/telescope-repo.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({
		'rmagatti/session-lens',
		requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
		config = get_setup('session-lens')
	})
	use { 'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	use({
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } },
		config = get_setup('telescope')
	})
	----------------------------------------------

end })
