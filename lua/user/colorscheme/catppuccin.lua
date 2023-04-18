-- vim.o.background = "light"

-- https://github.com/catppuccin/nvim/discussions/323#discussioncomment-5287724
local color_overrides = {
	mocha = {
		rosewater = "#EA6962",
		flamingo = "#EA6962",
		pink = "#D3869B",
		mauve = "#D3869B",
		red = "#EA6962",
		maroon = "#EA6962",
		peach = "#BD6F3E",
		yellow = "#D8A657",
		green = "#A9B665",
		teal = "#89B482",
		sky = "#89B482",
		sapphire = "#89B482",
		blue = "#7DAEA3",
		lavender = "#7DAEA3",
		text = "#D4BE98",
		subtext1 = "#BDAE8B",
		subtext0 = "#A69372",
		overlay2 = "#8C7A58",
		overlay1 = "#735F3F",
		overlay0 = "#5A4525",
		surface2 = "#4B4F51",
		surface1 = "#2A2D2E",
		surface0 = "#232728",
		base = "#1D2021",
		mantle = "#191C1D",
		crust = "#151819",
	},
	latte = {
		rosewater = "#c14a4a",
		flamingo = "#c14a4a",
		pink = "#945e80",
		mauve = "#945e80",
		red = "#c14a4a",
		maroon = "#c14a4a",
		peach = "#c35e0a",
		yellow = "#a96b2c",
		green = "#6c782e",
		teal = "#4c7a5d",
		sky = "#4c7a5d",
		sapphire = "#4c7a5d",
		blue = "#45707a",
		lavender = "#45707a",
		text = "#654735",
		subtext1 = "#7b5d44",
		subtext0 = "#8f6f56",
		overlay2 = "#a28368",
		overlay1 = "#b6977a",
		overlay0 = "#c9aa8c",
		surface2 = "#A79C86",
		surface1 = "#C9C19F",
		surface0 = "#DFD6B1",
		base = "#fbf1c7",
		mantle = "#F3EAC1",
		crust = "#E7DEB7",
	},
}

require("catppuccin").setup({
	flavour = "latte",
	-- flavour = "mocha",
	background = {
		light = "latte",
		dark = "mocha",
	},
	color_overrides = color_overrides,
	transparent_background = true,
	term_colors = true,
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
