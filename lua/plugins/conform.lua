return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "isort", "black" },
      c = { "clang-format" },
      lua = { "stylua" },
    },
    formatters = {
      clang_format = {
        command = [[clang-format]],
        prepend_args = { "-style", [[file:~/.clang-format]] },
      },
      isort = {
        command = "isort",
        args = {
          "-",
        },
      },
      stylua = {
        command = "stylua",
      },
    },
  },
}
