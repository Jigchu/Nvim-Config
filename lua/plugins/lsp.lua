return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			lua_ls = {
				mason = false,
				cmd = {
					"lua-language-server"
				},
			},
			ltex_plus = {
				settings = {
					ltex = {
						checkFrequency = "save",
						language = "en-GB",
						additionalRules = {
							languageModel = [[~/models/ngrams/]],
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
			},
		}
	},
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	}
}
