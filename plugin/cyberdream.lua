vim.pack.add({{ src = "https://github.com/scottmckendry/cyberdream.nvim" }})

require("cyberdream").setup({
  transparent = false,
  italic_comments = false,
  colors = {
    bg = "#000000",
  },
})

vim.cmd.colorscheme("cyberdream")
