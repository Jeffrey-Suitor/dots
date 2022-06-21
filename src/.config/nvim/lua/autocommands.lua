local api = vim.api

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, { pattern = "*", command = "set cursorline", group = cursorGrp })
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- show cursor col line only in active window
local cursorColGrp = api.nvim_create_augroup("CursorColumn", { clear = true })
api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", command = "set cursorcolumn", group = cursorColGrp }
)
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorcolumn", group = cursorColGrp }
)
 
 -- go to last loc when opening a buffer
  api.nvim_create_autocmd(
    "BufReadPost",
    { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
  )

-- api.nvim_create_augroup("SmallSpacing", { clear = true })
-- api.nvim_create_autocmd("{BufEnter}", { pattern = "*.ts", command = "setlocal nonumber", group = "SmallSpacing" })

-- augroup SmallSpacing
--     autocmd!
--     autocmd FileType typescript setlocal ts=2 sw=2 sts=2 expandtab colorcolumn=80
--     autocmd FileType typescriptreact setlocal ts=2 sw=2 sts=2 expandtab colorcolumn=80
--     autocmd FileType c setlocal ts=2 sw=2 sts=2 expandtab colorcolumn=80
-- augroup END
