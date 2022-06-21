local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- code actions
        null_ls.builtins.code_actions.eslint_d,
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
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.tsc,
        null_ls.builtins.diagnostics.zsh,
        -- formatting
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.trim_newlines,
        null_ls.builtins.formatting.trim_whitespace
    },
})
