require("mason").setup({})
require("mason-lspconfig").setup({
	automatic_installation = true,
})

-- Should match the tools in null-ls
require("mason-tool-installer").setup({
	ensure_installed = {
		"shellcheck",
		"actionlint",
		"codespell",
		"editorconfig-checker",
		"eslint-lsp",
		"prettierd",
		"stylua",
	},
	run_on_start = true,
})

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = true,
	sources = {
		-- code actions
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.code_actions.shellcheck,
		-- completion
		null_ls.builtins.completion.spell,
		null_ls.builtins.completion.tags,
		null_ls.builtins.completion.vsnip,
		-- diagnostics
		null_ls.builtins.diagnostics.actionlint,
		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.diagnostics.editorconfig_checker,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.zsh,
		-- formatting
		-- null_ls.builtins.formatting.eslint,
		-- null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		-- null_ls.builtins.formatting.trim_newlines,
		-- null_ls.builtins.formatting.trim_whitespace,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(server)
							return server.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig")["sumneko_lua"].setup({
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})

require("lspconfig")["tsserver"].setup({
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end,
	capabilities = capabilities,
})

require("lspconfig")["yamlls"].setup({
	capabilities = capabilities,
})

require("lspconfig")["clangd"].setup({
	capabilities = capabilities,
})

require("lspconfig")["jsonls"].setup({
	capabilities = capabilities,
})

require("which-key").register({
	l = {
		name = "+lsp",
		s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "symbols" },
		e = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "errors" },
		d = { "<cmd>Telescope lsp_definitions<cr>", "definitions" },
		r = { "<cmd>Telescope lsp_references<cr>", "references" },
		i = { "<cmd>Telescope lsp_implementations<cr>", "implementations" },
		t = { "<cmd>Telescope lsp_type_definitions<cr>", "type-definitions" },
		[","] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "prev-error" },
		[";"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "next-error" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code-action" },
		f = { "<cmd>lua vim.lsp.buf.format({async=true})<CR>", "format" },
		h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
		m = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
	},
}, { prefix = "<leader>" })

vim.keymap.set("", "<Leader>ll", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
