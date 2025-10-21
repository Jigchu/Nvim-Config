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

vim.lsp.config("ltex_plus", {
  settings = {
    ltex = {
      checkFrequency = "save",
      language = "en-GB",
      additionalRules = {
        languageModel = [[C:\Users\User\ngrams]],
      },
    },
  },
})

vim.lsp.enable("clangd")

require("conform").setup({
  formatters_by_ft = {
    python = { "isort", "black" },
    c = { "clang-format" },
  },
  formatters = {
    clang_format = {
      command = [[C:\Program Files\LLVM\bin\clang-format]],
      prepend_args = { "-style", [[file:"C:\Users\User\.clang-format]] },
    },
    isort = {
      command = "isort",
      args = {
        "-",
      },
    },
  },
})

vim.cmd("filetype plugin indent on")

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
