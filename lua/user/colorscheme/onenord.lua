require("onenord").setup()

vim.cmd.colorscheme("onenord")
lvim.colorscheme = "onenord"

-- lualine.nvim integration
lvim.builtin.lualine.options.theme = "onenord"
