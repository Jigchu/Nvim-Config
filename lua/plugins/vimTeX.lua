return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  init = function()
    vim.g.vimtex_view_method = "general"
    vim.g.vimtex_view_general_viewer = "SumatraPDF"
    vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
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
  end,
}
