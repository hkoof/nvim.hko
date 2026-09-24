require("config.options")
require("config.lazy")

vim.cmd.colorscheme("terafox")

-- Override window separator color to make it more visible (it's thin)
vim.api.nvim_set_hl(0, "WinSeparator", {
  fg = "#AAAAAA",
})

-- ngit-tree recommends disabling netrw entirelu
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
