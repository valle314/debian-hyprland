function Default_color_scheme()
    local catp = require("catppuccin")

        catp.setup({
            color_overrides = {
                all = {
                    -- https://github.com/dapc11/catppuccin/blob/main/lua/catppuccin/palettes/frappe.lua
                    text = "#f4e1b5",
                    base = "#f5c148",
                    mantle = "#f5c148",
                    crust = "#f5c148",
                    surface2 = "#757575", --comments
                    mauve = "#f5c148", --tag 
                    flamingo = "#f5c148", --brackets {} and highlighted things in telescope (space ff)
                    lavender = "#f4cbb7", --colors "text", "base" and css things
                    green = "#A6D189", --colors of strings
                    rosewater = "#dc8a78",
                    -- blue = "#71e5fc" --color of word "setup" for example
                    blue = "#c9c986" --color of word "setup" for example
                },
            },
            transparent_background = true,
            show_end_of_buffer = false,
            term_colors = false,
            no_italic = true, -- Force no italic
            no_bold = true, -- Force no bold
            integrations = {
                cmp = true,
                nvimtree = true,
                telescope = true,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })

    vim.cmd.colorscheme "catppuccin"
end

function Latex_color_scheme()
    local catp = require("catppuccin")

        catp.setup({
            color_overrides = {
                all = {
                    text = "#f4e1b5",
                    base = "#f5c148",
                    mantle = "#f5c148",
                    crust = "#f5c148",
                    pink = "#A6D189", -- "variables" inside of $
                    surface2 = "#757575",
                    mauve = "#b5c8f4", -- \begin \varphi, ...
                    yellow = "#b5c8f4", -- \begin \varphi, ...
                    flamingo = "#f5c148",
                    lavender = "#f4cbb7",
                    green = "#A6D189",
                    rosewater = "#dc8a78",
                    blue = "#c9c986"
                },
            },
            transparent_background = true,
            show_end_of_buffer = false,
            term_colors = false,
            no_italic = true, -- Force no italic
            no_bold = true, -- Force no bold
            integrations = {
                cmp = true,
                nvimtree = true,
                telescope = true,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })

    vim.cmd.colorscheme "catppuccin"
end
