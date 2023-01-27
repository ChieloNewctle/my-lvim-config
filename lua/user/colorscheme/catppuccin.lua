-- vim.o.background = "light"
require("catppuccin").setup({
	-- flavour = "latte",
	flavour = "macchiato",
	background = {
		light = "latte",
		dark = "macchiato",
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		mason = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		treesitter = true,
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		dap = {
			enabled = true,
			enable_ui = true,
		},
	},
})

vim.cmd.colorscheme("catppuccin")
lvim.colorscheme = "catppuccin"

-- bufferline.nvim integration
lvim.builtin.bufferline.highlights = require("catppuccin.groups.integrations.bufferline").get()

-- lualine.nvim integration
lvim.builtin.lualine.options.theme = "catppuccin"

-- nvim-dap integration
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local sign = vim.fn.sign_define
		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
	end,
})
