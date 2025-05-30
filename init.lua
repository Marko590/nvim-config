vim.opt.termguicolors = true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.opt.signcolumn = "yes"
vim.wo.relativenumber = true
require("vim-options")
require("lazy").setup("plugins")
require("leap").create_default_mappings()
vim.keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
vim.keymap.set({ "n", "x", "o" }, "gf", "<Plug>(leap-from-window)")

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.g.nvim_tree_respect_buf_cwd = 1
-- Array of file names indicating root directory. Modify to your liking.
local root_names = { '.git', 'Makefile' }

-- Cache to use for speed up (at cost of possibly outdated results)
local root_cache = {}

local set_root = function()
  -- Get directory path to start search from
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then return end
  path = vim.fs.dirname(path)

  -- Try cache and resort to searching upward for root directory
  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file == nil then return end
    root = vim.fs.dirname(root_file)
    root_cache[path] = root
  end

  -- Set current directory
  vim.fn.chdir(root)
end

local root_augroup = vim.api.nvim_create_augroup('MyAutoRoot', {})
vim.api.nvim_create_autocmd('BufEnter', { group = root_augroup, callback = set_root })

