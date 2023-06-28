-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins.colorscheme')
require('plugins.lualine')
require('plugins.tree')
require('plugins.telescope')
require('plugins.lspzero')
require('plugins.cmp')
require('plugins.treesitter')
require('plugins.null-ls')
require("options")
require("plugins-setup")
