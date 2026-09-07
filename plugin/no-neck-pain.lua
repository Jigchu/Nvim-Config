-- Maybe set autocmds.skipEnteringNoNeckPainBuffer
-- May also add VimLeavePre autocmd

local pathToScratchPad = vim.fn.stdpath("data") .. "/notes.md"

vim.api.nvim_create_autocmd({ "WinClosed" }, {
  callback = function(ev)
    local buf = vim.api.nvim_win_get_buf(tonumber(ev.match))
    if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_name(buf) == pathToScratchPad then
      vim.api.nvim_buf_call(buf, function()
        vim.cmd("silent! update")
      end)
    end
  end,
})

vim.pack.add({ { src = "https://github.com/shortcuts/no-neck-pain.nvim" } })

require("no-neck-pain").setup({
  mappings = { enabled = true },
  buffers = {
    left = {
      enabled = true,
      scratchPad = {
        enabled = true,
        pathToFile = pathToScratchPad,
      },
    },
    right = { enabled = false },
  },
})
