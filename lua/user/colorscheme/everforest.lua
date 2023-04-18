if vim.fn.has("termguicolors") then
	vim.opt.termguicolors = true
end

vim.g.everforest_better_performance = 1

lvim.colorscheme = "everforest"
vim.o.background = "light"
-- vim.g.everforest_background = "hard"

lvim.builtin.lualine.options.theme = "everforest"
