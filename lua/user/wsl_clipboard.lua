local function set_win32yank_clipboard(_, retval, _)
	if retval == 0 then
		vim.g.clipboard = {
			name = "win32yank-wsl",
			copy = {
				["+"] = "win32yank.exe -i --crlf",
				["*"] = "win32yank.exe -i --crlf",
			},
			paste = {
				["+"] = "win32yank.exe -o --lf",
				["*"] = "win32yank.exe -o --lf",
			},
			cache_enable = 0,
		}
		-- print("set win32yank clipboard")
	end
end

if vim.fn.has("wsl") then
	vim.fn.jobstart("command -v win32yank.exe > /dev/null", { on_exit = set_win32yank_clipboard })
end
