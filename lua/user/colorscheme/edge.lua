if vim.fn.has("termguicolors") then
	vim.opt.termguicolors = true
end

vim.g.edge_better_performance = 1

lvim.colorscheme = "edge"
vim.o.background = "light"

lvim.builtin.lualine.options.theme = "edge"
