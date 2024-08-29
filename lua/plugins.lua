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


    {
        "jbyuki/venn.nvim",
    }
})





-- key maps --

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')



-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.api.nvim_buf_del_keymap(0, "n", "J")
        vim.api.nvim_buf_del_keymap(0, "n", "K")
        vim.api.nvim_buf_del_keymap(0, "n", "L")
        vim.api.nvim_buf_del_keymap(0, "n", "H")
        vim.api.nvim_buf_del_keymap(0, "v", "f")
        vim.b.venn_enabled = nil
    end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
