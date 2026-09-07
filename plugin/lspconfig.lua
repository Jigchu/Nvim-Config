vim.pack.add({{ src = "https://github.com/neovim/nvim-lspconfig" }})

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
      checkFrequency = "edit",
      language = "en-GB",
      additionalRules = {
        languageModel = vim.fn.expand("~/models/ngrams"),
      },
    },
  },
})

vim.lsp.enable({ "lua_ls", "clangd", "basedpyright", "ltex_plus", "texlab" })
