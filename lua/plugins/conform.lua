return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "isort", "black" },
      c = { "clang-format" },
    },
    formatters = {
      clang_format = {
        command = [[C:\Program Files\LLVM\bin\clang-format]],
        prepend_args = { "-style", [[file:"C:\Users\User\Documents\Lsp-Configs\.clang-format"]] },
      },
      isort = {
        command = "isort",
        args = {
          "-",
        },
      },
    },
  },
}
