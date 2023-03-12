-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
	-- Colorschemes
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{ "sainnhe/edge" },
	{ "RRethy/nvim-base16" },
	{ "ellisonleao/gruvbox.nvim" },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"rmehri01/onenord.nvim",
		branch = "main",
	},
	-- Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
			require("neo-tree").setup({
				close_if_last_window = true,
				source_selector = {
					winbar = true,
				},
				buffers = {
					follow_current_file = true,
				},
				filesystem = {
					follow_current_file = true,
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = {
							"node_modules",
						},
						never_show = {
							".DS_Store",
							"thumbs.db",
						},
					},
				},
			})
		end,
	},
	-- Functionalities
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})

			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })
			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })
		end,
	},
	{ "echasnovski/mini.nvim" },
	{
		"ggandor/lightspeed.nvim",
		event = "BufRead",
		config = function()
			vim.keymap.set("n", "s", "<Plug>Lightspeed_omni_s", { desc = "Bidirectional search" })
			vim.keymap.set("x", "s", "<Plug>Lightspeed_omni_s", { desc = "Bidirectional search" })
			vim.keymap.set("n", "gs", "<Plug>Lightspeed_omni_gs", { desc = "Bidirectional search" })
			vim.keymap.set("x", "gs", "<Plug>Lightspeed_omni_gs", { desc = "Bidirectional search" })
			local lightspeed = require("lightspeed")
			lightspeed.opts.jump_to_unique_chars = false
			lightspeed.opts.force_beacons_into_match_width = true
		end,
	},
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("numb").setup({
				show_numbers = true,
				show_cursorline = true,
			})
		end,
	},
	{ "mrjones2014/nvim-ts-rainbow" },
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				throttle = true,
				max_lines = 0,
				patterns = {
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		event = "VimEnter",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
			local dap_python = require("dap-python")
			dap_python.setup(mason_path .. "packages/debugpy/venv/bin/python")
			lvim.builtin.which_key.vmappings["d"] = {
				name = "Debug",
				s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
			}
		end,
	},
}

lvim.builtin.nvimtree.active = false -- NOTE: use neo-tree
lvim.builtin.treesitter.rainbow.enable = true

-- Color scheme
vim.o.background = "dark" -- or "light" for light mode
-- require("user.colorscheme.onenord")
require("user.colorscheme.catppuccin")
-- require("user.colorscheme.edge")
-- vim.cmd([[colorscheme gruvbox]])
-- lvim.colorscheme = "gruvbox"

require("user.wsl_clipboard")
require("user.mini")

lvim.builtin.autopairs.enable_check_bracket_line = true

-- vim options
-- vim.opt.shiftwidth = 2
-- vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- General
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	timeout = 1000,
}

-- Keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"

lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree toggle<cr>", "Neotree" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" }

-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["Q"] = { "<cmd>qa<cr>", "Close all" }

lvim.keys.normal_mode["<M-l>"] = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<M-h>"] = ":BufferLineCyclePrev<cr>"

lvim.builtin.which_key.mappings["s"]["b"] = { "<cmd>Telescope buffers<cr>", "Search buffer" }
lvim.builtin.which_key.mappings["s"]["B"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" }

lvim.builtin.telescope.defaults.mappings.i["<C-c>"] = require("telescope.actions").delete_buffer
lvim.builtin.telescope.defaults.mappings.n["<C-c>"] = require("telescope.actions").delete_buffer

lvim.builtin.which_key.mappings["l"]["f"] = {
	function()
		require("lvim.lsp.utils").format({ timeout_ms = 3000 })
	end,
	"Format",
}

-- Style
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.dap.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.indent.enable = false
lvim.builtin.treesitter.indent.disable = true
lvim.builtin.treesitter.highlight.enable = false
lvim.builtin.treesitter.highlight.disable = true

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>
--
lvim.lsp.installer.setup.automatic_installation = true

-- Markdown support
lvim.lsp.automatic_configuration.skipped_filetypes = vim.tbl_filter(function(server)
	return server ~= "markdown"
end, lvim.lsp.automatic_configuration.skipped_filetypes)
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
	"grammarly",
	"ltex",
	"prosemd_lsp",
	"remark_ls",
	"zk",
})

-- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
	{ command = "blue", filetypes = { "python" } },
	{ command = "isort", filetypes = { "python" } },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "ruff", filetypes = { "python" } },
	{ command = "markdownlint", filetypes = { "markdown" } },
})

-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
