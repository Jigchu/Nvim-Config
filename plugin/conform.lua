vim.pack.add({{ src = "https://github.com/stevearc/conform.nvim" }})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    c = { "clang-format" },
  },
  formatters = {
    clang_format = {
      prepend_args = {
        "-style",
        "'{BasedOnStyle: LLVM, IndentWidth: 4}'",
      },
    },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
