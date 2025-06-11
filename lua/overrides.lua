
-- Mainly to suppress the below treesitter warning:
-- vim.treesitter.get_parser will return nil instead of raising an error in Neovim 0.12

local function safe_get_parser(bufnr, lang)
    local ok, parser = pcall(vim.treesitter.get_parser, bufnr, lang)
    if ok then
        return parser
    end
    return nil
end

vim.treesitter.get_parser = safe_get_parser

-- Disable Tree-sitter in Oil buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.treesitter.stop()
  end,
})

