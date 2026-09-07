local pathToScratchPad = vim.fn.stdpath("data") .. "/notes.md"
-- Only open the right buffer for tex/md files
local pathToScratchPadRight = vim.fn.stdpath("data") .. "/notes_right.md"

local function is_scratch_pad_buf(buf)
  return vim.api.nvim_buf_is_valid(buf)
    and (vim.api.nvim_buf_get_name(buf) == pathToScratchPad or vim.api.nvim_buf_get_name(buf) == pathToScratchPadRight)
end

vim.api.nvim_create_autocmd({ "WinClosed" }, {
  callback = function(ev)
    local buf = vim.api.nvim_win_get_buf(tonumber(ev.match))
    if is_scratch_pad_buf(buf) then
      vim.api.nvim_buf_call(buf, function()
        vim.cmd("silent! update")
      end)
    end
  end,
})

vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  callback = function(ev)
    local bufs = vim.tbl_filter(is_scratch_pad_buf, vim.api.nvim_list_bufs())
    for _, buf in ipairs(bufs) do
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
    right = {
      enabled = false,
      scratchPad = {
        enabled = true,
        pathToFile = pathToScratchPadRight,
      },
    },
  },
})
