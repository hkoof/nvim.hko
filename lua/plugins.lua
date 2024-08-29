-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--  -- -- Some general options as recommended by Lazy.nvim
--  -- --
--  -- Make sure to setup `mapleader` and `maplocalleader` before
--  -- loading lazy.nvim so that mappings are correct.
--  -- This is also a good place to setup other settings (vim.opt)
--  vim.g.mapleader = " "
--  vim.g.maplocalleader = "\\"
--
--  -- Setup lazy.nvim
--  require("lazy").setup({
--    spec = {
--      -- add your plugins here
--    },
--    -- Configure any other settings here. See the documentation for more details.
--    -- colorscheme that will be used when installing plugins.
--    install = { colorscheme = { "habamax" } },
--    -- automatically check for plugin updates
--    checker = { enabled = true },
--  })

require("lazy").setup({
    "romainl/Apprentice",
    "EdenEast/nightfox.nvim",
    "sainnhe/edge",
    "sainnhe/everforest",
    {
        "rebelot/kanagawa.nvim",

        config = function()
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" },
                sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
                auto_install = true,

                highlight = {
                    enable = true,
                },

                indent = {
                    enable = true
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        -- set these to `false` to disable one of the mappings
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    },
                },
            })
        end,
    },

    {  -- "powerpoint alternative"
        "sotte/presenting.nvim",
        opts = {
            -- fill in your options here
            -- see :help Presenting.config
        },
        cmd = { "Presenting" },
    },
})





-- key maps --

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


