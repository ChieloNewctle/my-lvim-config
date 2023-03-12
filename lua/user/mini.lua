require("mini.ai").setup()
require("mini.indentscope").setup()
require("mini.surround").setup({
	mappings = {
		add = "Sa",
		delete = "Sd",
		find = "Sf",
		find_left = "SF",
		highlight = "Sh",
		replace = "Sr",
		update_n_lines = "Sn",
		suffix_last = "p",
		suffix_next = "n",
	},
	n_lines = 64,
})
require("mini.move").setup({
	mappings = {
		left = "<M-H>",
		right = "<M-L>",
		down = "<M-J>",
		up = "<M-K>",
		line_left = "<M-H>",
		line_right = "<M-L>",
		line_down = "<M-J>",
		line_up = "<M-K>",
	},
})
require("mini.trailspace").setup()

vim.g.miniindentscope_disable = true
