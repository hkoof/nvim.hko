return {
    { "romainl/Apprentice",
         lazy = false,
    },


    { "EdenEast/nightfox.nvim", 
         lazy = false,
         opts = {
             groups = {
                 terafox = {
                     -- :hi LineNr
                     LineNr = { style = "italic", bg = "#203035" },
                     StatusLine = { bg = "#ffffff" },

                     -- Other examples:
                     -- :hi StatusLine
                     -- :hi StatusLineNC  (inactive)
                 },
             },
         },
    },

    {
        'jesseleite/nvim-noirbuddy',
        dependencies = {
            { 'tjdevries/colorbuddy.nvim' }
        },
        lazy = false,
        priority = 1000,
        opts = {
            -- All of your `setup(opts)` will go here
        },
    },

    {
        "aktersnurra/no-clown-fiesta.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            theme = "dark",
            transparent = false, -- Enable this to disable the bg color
            styles = {
                type = { bold = true },
                lsp = { underline = false },
                match_paren = { underline = true },
            },
        }
    },
}
