vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/scottmckendry/cyberdream.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/stevearc/conform.nvim" },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.x"),
  },
  { src = "https://github.com/lervag/vimtex", version = "v2.15" },
})

require("cyberdream").setup({
  transparent = false,
  italic_comments = false,
  colors = {
    bg = "#000000",
  },
})

require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})

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

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--completion-style=detailed",
  },
  init_options = {
    fallbackFlags = vim.uv.os_uname().sysname == "Windows_NT" and { "--target=x86_64-w64-windows-gnu" } or {},
  },
})

vim.lsp.config("ltex_plus", {
  settings = {
    ltex = {
      checkFrequency = "save",
      language = "en-GB",
      additionalRules = {
        languageModel = vim.fn.expand("~/models/ngrams"),
      },
    },
  },
})

-- Vimtex Configuration
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
  aux_dir = "build", -- Send aux/log files to a subdirectory
  out_dir = "", -- Leave PDF in root directory (or set to 'build')
  callback = 1, -- Enable callback on finish
  continuous = 1, -- Continuous compilation on save
  executable = "latexmk",
  options = {
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
  },
}

vim.lsp.enable({ "lua_ls", "clangd", "basedpyright", "ltex_plus", "texlab" })
vim.cmd.colorscheme("cyberdream")

vim.wo.relativenumber = true

vim.o.wrap = false
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
