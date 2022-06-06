call plug#begin()

"LSP
Plug 'neovim/nvim-lspconfig' "Lsp for neovim
Plug 'williamboman/nvim-lsp-installer'
Plug 'github/copilot.vim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'p00f/nvim-ts-rainbow' "Rainbow parens
Plug 'romgrk/nvim-treesitter-context' "Show high level function info
Plug 'windwp/nvim-autopairs' "Autopairs
Plug 'windwp/nvim-ts-autotag' "Autotag
Plug 'JoosepAlviste/nvim-ts-context-commentstring' "Change the comment string dynamically

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'cljoly/telescope-repo.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-telescope/telescope-file-browser.nvim'

"Completion Sources
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" UX Improvements
Plug 'nacro90/numb.nvim' "Preview a line jump
Plug 'folke/which-key.nvim' "Better version of which key
Plug 'bfredl/nvim-miniyank' "Yank ring plugin
Plug 'machakann/vim-sandwich' "Change wrapping chars
Plug 'unblevable/quick-scope' "Find unique chars
Plug 'numtostr/FTerm.nvim' "Floating terminal
Plug 'kevinhwang91/nvim-hlslens' "highlight lens
Plug 'folke/twilight.nvim' "highlight mode
Plug 'folke/zen-mode.nvim' "zenmode for coding
Plug 'folke/persistence.nvim' "session persistence
Plug 'folke/todo-comments.nvim' "highlight todo comments
Plug 'folke/trouble.nvim' "trouble
Plug 'ray-x/lsp_signature.nvim' "show signature on typing

"Appearance
Plug 'romgrk/barbar.nvim' "Better jump for tabs
Plug 'chentoast/marks.nvim' "Better marks usage
Plug 'hoob3rt/lualine.nvim' "Lua statusline
Plug 'lukas-reineke/indent-blankline.nvim' "indent blanklines
Plug 'ryanoasis/vim-devicons' "Icons
Plug 'kyazdani42/nvim-web-devicons' "More icons

"Quality of life (run in the background)
Plug 'danilamihailov/beacon.nvim' "Show new jump location
Plug 'djoshea/vim-autoread' "Keep files in sync
Plug 'tpope/vim-speeddating' " Increment dates
Plug 'tpope/vim-repeat' " Repeat plugins
Plug 'tpope/vim-commentary' "Commenting plugin
Plug 'chaoren/vim-wordmotion' "Camel Case motion
Plug 'airblade/vim-rooter' "Change to root
Plug 'wellle/targets.vim' "More movement options
Plug 'jason0x43/vim-wildgitignore' "Add the gitignore to wild search
Plug 'lewis6991/gitsigns.nvim' "gitsigns
Plug 'tpope/vim-unimpaired' "better [ and ] pairings
Plug 'axelf4/vim-strip-trailing-whitespace' "Strip trailing whitespace

"Coding
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'} "Virtual env wrapper for python

"Colorschemes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

"Experimental
Plug 'sbdchd/vim-run' "Run the current file
Plug 'luukvbaal/stabilize.nvim' "Stabilize the events
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'akinsho/flutter-tools.nvim' " Flutter
Plug 'MunifTanjim/nui.nvim' "Required for fine-cmdline"
Plug 'VonHeikemen/fine-cmdline.nvim' "Better comamndline"

call plug#end()

let g:coq_settings = { 'auto_start': 'shut-up', 'display.pum.fast_close': v:false }
let g:rooter_cd_cmd = 'lcd'

:lua << END


    local actions = require("telescope.actions")
    local telescope = require("telescope")

    telescope.setup {
        defaults = {
            file_ignore_patterns = {'node_modules/.*'},
        },
    }

    require("flutter-tools").setup{} -- use defaults

    telescope.load_extension('repo')
    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')

    require('nvim-autopairs').setup{}
    require('nvim-ts-autotag').setup()

    require('numb').setup()
    require("twilight").setup()
    require("zen-mode").setup()
    require("persistence").setup()
    require("todo-comments").setup()
    require('treesitter-context').setup()
    require('gitsigns').setup()
    require("lsp_signature").setup()
    require('marks').setup({})
    require("stabilize").setup()
    require("catppuccin").setup({
        integrations = {
            which_key = true
        }
    })

    require('lualine').setup{
        options = {
            theme = 'catppuccin'
        }
    }

    require("indent_blankline").setup({
        char = "┃",
    })

    require('nvim-treesitter.configs').setup({
        context_commentstring = { enable = true },
        autotag = { enable = true, },
        rainbow = {
            enable = true,
            extended_mode = true
        },
        refactor = {
            highlight_definitions = { enable = true },
        },
        highlight = { enable = true, },
        indent = { enable = true, },
        incremental_selection = { enable = true, }
    })

    local coq = require "coq"

    local lsp_installer = require("nvim-lsp-installer")
    lsp_installer.on_server_ready(function(server)
        server:setup(coq.lsp_ensure_capabilities{})
    end)

    local lsp = require 'lspconfig'
    lsp.clangd.setup {
        cmd = { "clangd", "--background-index", "--query-driver=/home/jeff/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-*" },
        root_dir = lsp.util.root_pattern('build/compile_commands.json', '.git'),
    }


    require('fine-cmdline').setup({
        popup = {
            position = {
            row = '50%',
            col = '50%',
            },
        }
    })

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    require("null-ls").setup({
        sources = {
            require("null-ls").builtins.formatting.stylua,
        },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
    })

    local wk = require('which-key')
    wk.register({
        f = {
            name = "+find",
            ["<Space>"] = {"<cmd>Telescope resume<cr>", "resume"},
            f = {"<cmd>Telescope find_files<cr>", "find files"},
            F = {"<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", "file browser"},
            g = {"<cmd>Telescope git_files<cr>", "git files"},
            b = {"<cmd>Telescope buffers<cr>", "buffers"},
            r = {'<cmd>lua require("telescope").extensions.repo.cached_list{file_ignore_patterns={"/%.cache/", "/%.cargo/"}}<CR>', "repos"},
            R = {"<cmd>Telescope live_grep<cr>", "live grep"},
            t = {"<cmd>Telescope tags<cr>", "tags"},
            m = {"<cmd>Telescope marks<cr>", "marks"},
            o = {"<cmd>Telescope oldfiles<cr>", "old files"},
            q = {"<cmd>Telescope quickfix<cr>", "quickfix"},
            l = {"<cmd>Telescope loclist<cr>", "location list"},
            C = {"<cmd>Telescope commands<cr>", "commands"},
            c = {"<cmd>Telescope command_history<cr>", "command history"},
            M = {"<cmd>Telescope keymaps<cr>", "keymaps"},
            s = {"<cmd>Telescope search_history<cr>", "search history"},
        },
        ["1"] = {"<cmd>Run<CR>", "compile"},
        ["2"] = {"<cmd>TroubleToggle<CR>", "error-list"},
        ["3"] = {"<cmd>set spell!<CR>", "toggle-spelling"},
        ["5"] = {"<cmd>ZenMode<CR>", "zen-mode"},
        ["9"] = {"<cmd>lua require('FTerm').toggle()<cr>", "terminal"},
        r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "rename"},
        F = {"<cmd>lua vim.lsp.buf.format()<cr>", "format"},
        ["\\"] = {"<cmd>nohlsearch<cr>", "clear highlight"},
        x = {
            name='session-manager',
            d = {'<cmd>lua require("persistence").load({ last = true })<cr>', 'load-last-session-directory'},
            r = {'<cmd>lua require("persistence").load()<cr>', 'restore-session'},
        },
        l = {
            name="+lsp",
            s = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "symbols"},
            e = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "errors"},
            d = {"<cmd>Telescope lsp_definitions<cr>", "diagnostics"},
            r = {"<cmd>Telescope lsp_references<cr>", "references"},
            i = {"<cmd>Telescope lsp_implementations<cr>", "implementations"},
            t = {"<cmd>Telescope lsp_type_definitions<cr>", "type-definitions"},
            [","] = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "prev-error"},
            [";"] = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "next-error"},
            l = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "code-action"},
            a = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "code-action"},
            f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "format"},
            h = {"<cmd>lua vim.lsp.buf.hover()<CR>", "hover"},
            m = {"<cmd>lua vim.lsp.buf.rename()<CR>", "rename"},
        },
        b = {
            name="+buffers",
            ['1'] = {"<cmd>BufferGoto 1<CR>", "buffer 1"},
            ['2'] = {"<cmd>BufferGoto 2<CR>", "buffer 2"},
            ['3'] = {"<cmd>BufferGoto 3<CR>", "buffer 3"},
            ['4'] = {"<cmd>BufferGoto 4<CR>", "buffer 4"},
            ['5'] = {"<cmd>BufferGoto 5<CR>", "buffer 5"},
            ['6'] = {"<cmd>BufferGoto 6<CR>", "buffer 6"},
            ['7'] = {"<cmd>BufferGoto 7<CR>", "buffer 7"},
            ['8'] = {"<cmd>BufferGoto 8<CR>", "buffer 8"},
            ['9'] = {"<cmd>BufferGoto 9<CR>", "buffer 9"},
            ['10'] = {"<cmd>BufferGoto 10<CR>", "buffer 10"},
            h = {"<cmd>BufferPrevious<CR>", "buffer previous"},
            l = {"<cmd>BufferNext<CR>", "buffer next"},
            k = {"<cmd>BufferMovePrevious<CR>", "buffer move previous"},
            j = {"<cmd>BufferMoveNext<CR>", "buffer move next"},
            p = {"<cmd>BufferPick<CR>", "buffer pick"},
            g = {"<cmd>BufferLast<CR>", "buffer last"},
            q = {"<cmd>BufferClose<CR>", "buffer close"},
            },
    }, { prefix = "<leader>" })

    wk.setup {spelling = { enabled = true}}
END

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

let g:coq_settings = {'auto_start': v:true, 'clients.tabnine.enabled': v:true, "keymap.manual_complete": "", "keymap.recommended": v:false, }
" Keybindings
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

"leader remap
nnoremap <Space> <Nop>
let g:mapleader = "\<Space>"


" Override default p and P
nnoremap p <Plug>(miniyank-autoput)
nnoremap P <Plug>(miniyank-autoPut)
nnoremap ]p <Plug>(miniyank-cycle)<CR>
nnoremap [p <Plug>(miniyank-cycleback)<CR>

"Quick commands
nnoremap <silent> <C-Space> :Telescope live_grep<CR>
nnoremap <C-c> :lua require"telescope.builtin".command_history{}<CR>

" Keep search results at the center of screen
nnoremap j gj
nnoremap k gk

" Set mouse remap
nnoremap <LeftMouse> :lua vim.lsp.buf.hover()<CR>
nnoremap <RightMouse> :lua vim.lsp.buf.definition()<CR>

nnoremap <CR> <cmd>FineCmdline<CR>

"Basic Configurations

set backspace=indent,eol,start "Fix backspace issues
set belloff=all "Turn off all bells
set breakindent

set complete-=i "Don't search included files
set clipboard=unnamed,unnamedplus "Set clipboard
set colorcolumn=120
set completeopt=menu,menuone,noselect
set cursorline

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

set gdefault "when substituting use g by default

set ignorecase "ignore letter case

set linebreak " Break lines at words
set lazyredraw "faster on large files
set list
set listchars=tab:>~,trail:~,extends:>,precedes:<,nbsp:_

set matchpairs+=<:>
set modelines=1 "check the file line of the file for modeline

set number relativenumber "Set hybrid lines
set nospell " no spelling"
set nobackup nowritebackup noswapfile "If you save often then this stuff gets annoying

set signcolumn
set shortmess+=c
set shiftround "round indent to a multiple of shift width for << or >>
set spellfile=~/.config/nvim/spell/dictionary.utf-8.add spelllang=en_ca
set smartcase "override ignore case if there is capitals

set smartindent
set showcmd showmode title "show command and show mode
set splitbelow splitright "Make splits proper
set scrolloff=999 "Lets you scroll through your document
set showbreak=\\ " [bonus]
syntax enable "enable syntax processing
set sessionoptions=folds

set thesaurus+=~/.config/nvim/spell/Thesaurus.txt
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab "Set tab stops to 4 spaces
set timeoutlen=500
set updatetime=1

set undodir=/tmp
set undofile

set viewoptions=folds,cursor

set wildmenu wildchar=<TAB> wildmode=list:longest,full

"Plugin Configurations

" HL search
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>
tnoremap <Esc> <C-\><C-n>

"Quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

colorscheme catppuccin

augroup spelling
    autocmd!
    autocmd FileType markdown setlocal spell
augroup END

autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
autocmd BufWritePre lua vim.lsp.buf.formatting_sync()

augroup SmallSpacing
    autocmd!
    autocmd FileType typescript setlocal ts=2 sw=2 sts=2 expandtab colorcolumn=80
    autocmd FileType typescriptreact setlocal ts=2 sw=2 sts=2 expandtab colorcolumn=80
    autocmd FileType c setlocal ts=2 sw=2 sts=2 expandtab colorcolumn=80
augroup END
