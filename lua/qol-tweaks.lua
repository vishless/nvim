-- if nvim starts with a directory as an argument, cd into it
if vim.fn.argc() == 1 then
	local arg = vim.fn.argv()[1]
	if vim.fn.isdirectory(arg) == 1 then
		vim.fn.chdir(arg)
	end
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- c: Suppresses "match 1 of x" messages.
-- I: Suppresses introductory messages and warnings (like deprecated warnings).
-- Mainly to suppress the below treesitter warning:
-- vim.treesitter.get_parser will return nil instead of raising an error in Neovim 0.12
vim.opt.shortmess:append("cI")
