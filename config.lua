--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
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
}

require("user.wsl_clipboard")

-- Color scheme
vim.o.background = "dark" -- or "light" for light mode
-- require("user.colorscheme.onenord")
require("user.colorscheme.catppuccin")
-- require("user.colorscheme.edge")
-- vim.cmd([[colorscheme gruvbox]])
-- lvim.colorscheme = "gruvbox"

-- vim options
-- vim.opt.shiftwidth = 2
-- vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	-- pattern = "*.lua",
	timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<leader>w"] = ":w<cr>"
lvim.keys.normal_mode["<leader>Q"] = ":qa<cr>"

lvim.keys.normal_mode["<M-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<M-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.dap.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

local enabled_lsp_servers = {
	"ruff_lsp",
	"marksman",
}
for _, name in pairs(enabled_lsp_servers) do
	require("lvim.lsp.manager").setup(name, {})
end

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- vim.lsp.set_log_level("DEBUG")

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
--

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua" },
	{ command = "blue" },
	{ command = "isort" },
	{ command = "markdownlint" },
	-- {
	--   command = "prettier",
	--   extra_args = { "--print-width", "100" },
	--   filetypes = { "typescript", "typescriptreact" },
	-- },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	-- { command = "mypy", filetypes = { "python" } },
	-- { command = "flake8", filetypes = { "python" } },
	-- {
	--   command = "shellcheck",
	--   args = { "--severity", "warning" },
	-- },
})

-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
