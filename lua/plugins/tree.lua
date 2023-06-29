-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  update_focused_file = {
    enable = true,
  },
  filters = {
    dotfiles = true,
  },
})

local function open_nvim_tree()
  require("nvim-tree.api").tree.open({
    path = nil,
    current_window = false,
    find_file = false,
    update_root = false,
  })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<C-f>", ":NvimTreeFocus<CR>", { silent = true })
