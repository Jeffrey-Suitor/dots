require('session-lens').setup {}

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require('auto-session').setup {
    auto_session_enable_last_session=true,
}

require('which-key').register({
	s = {
            name='session-manager',
            ["<Space>"] = {':SearchSession<cr>', 'search-session'},
            s = {':SaveSession<cr>', 'save-session'},
            r = {':RestoreSession<cr>', 'restore-session'},
            d = {':DeleteSession<cr>', 'delete-session'},
        },
}, {prefix='<leader>'})
