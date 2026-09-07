vim.pack.add({ {
  src = "https://github.com/saghen/blink.cmp",
  version = vim.version.range("1.x"),
} })

require("blink.cmp").setup({
  keymap = {
    preset = "super-tab",
    ["<C-y>"] = { "show_documentation", "hide_documentation" },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
