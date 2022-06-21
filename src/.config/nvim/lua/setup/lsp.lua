local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup {}
lspconfig.tsserver.setup {}

require('which-key').register({
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
}, {prefix="<leader>"})
