return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ltex_plus = {
        settings = {
          ltex = {
            checkFrequency = "save",
            language = "en-GB",
            additionalRules = {
              languageModel = [[C:\Users\User\ngrams]],
            },
          },
        },
      },
      clangd = {
        mason = false,
        cmd = {
          "clangd",
          "--completion-style=detailed",
        },
        init_options = {
          fallbackFlags = { "--target=x86_64-w64-windows-gnu" },
        },
      },
      basedpyright = {
        cmd = {
          "basedpyright-langserver",
          [[--project C:\Users\User\Documents\Lsp-Configs\pyrightconfig.json]],
          "--stdio",
        },
      },
    },
  },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
}
