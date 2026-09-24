require("config.options")
require("config.lazy")

vim.cmd.colorscheme("terafox")

-- ngit-tree recommends disabling netrw entirelu
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
