return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = { "*" },
    user_default_options = {
      mode = "virtualtext",
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
    },
  },
}
