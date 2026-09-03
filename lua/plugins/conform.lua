return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "black" },
      c = { "clang-format" },
    },
    formatters = {
      clang_format = {
        command = { [[C:\Program Files\LLVM\bin\clang-format]] },
        prepend_args = {
          "-style",
          'file:"C:\\Users\\Admin\\.clang-format"',
        },
      },
    },
  },
}
