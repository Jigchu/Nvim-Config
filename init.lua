-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--completion-style=detailed",
  },
  init_options = {
    fallbackFlags = { "--target=x86_64-w64-windows-gnu" },
  },
})

vim.lsp.enable("clangd")

vim.cmd("filetype plugin indent on")

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
