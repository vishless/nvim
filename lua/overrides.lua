-- Disable Tree-sitter in Oil buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.treesitter.stop()
  end,
})

