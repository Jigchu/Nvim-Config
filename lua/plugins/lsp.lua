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
    },
  },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
}
