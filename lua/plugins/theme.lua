return {
    "AlexvZyl/nordic.nvim",
    -- Es crucial que los temas no sean "lazy" (perezosos) y tengan alta prioridad
    -- para que se carguen antes que el resto de la interfaz.
    lazy = false,
    priority = 1000,
    config = function()
        require("nordic").load({
            -- Habilita el subrayado ondulado (undercurl)
            undercurl = true,
            
            -- Reduce la cantidad general de azul en el tema (lo hace un poco más cálido)
            reduced_blue = true,
            
            -- Configuración de transparencia
            transparent = {
                -- Fondo transparente general
                bg = true,
                -- Fondo transparente para ventanas flotantes
                float = true,
            },

            on_highlight = function(highlights, palette)
                -- Comentarios claros
                highlights.Comment = { fg = "#8B98AB", italic = true }

                -- Forzar Bordes Blancos y Fondos Transparentes
                -- Aplicamos a los grupos estándar y a los específicos de Noice
                --local float_overrides = {
                --    fg = "#FFFFFF", 
                --    bg = "NONE", 
                --}
                highlights.FloatBorder = float_overrides
                highlights.NormalFloat = { bg = "NONE" }
                
                highlights.RenderMarkdownCode = {bg = "#222630"}

            end,

            
            -- Bordes más brillantes para elementos como ventanas flotantes
            bright_border = true,
            
            -- Intercambia ciertos colores del tema
            swap_colors = false,
            
            -- Sobrescribir colores específicos (puedes añadir códigos hex aquí)
            override = {},
            
            -- Estilos de texto generales
            bold = true,
            italic = true,
            underline = true,
            
            -- Estilos para grupos de sintaxis específicos
            bold_keywords = true,
            italic_comments = true,
            
            -- Configuración de la  línea del cursor (cursorline)
            cursorline = {
                -- Fuente en negrita en la línea del cursor
                bold = false,
                -- Número de línea en negrita
                bold_number = true,
                -- Estilos disponibles: 'dark', 'light'
                theme = "dark",
                -- Mezcla el fondo del cursorline con el fondo del buffer (0.0 a 1.0)
                blend = 0.8,
            },
            
            -- Integración con el plugin Noice
            noice = {
                -- Estilos disponibles: 'classic', 'flat'
                style = "classic",
            },
            
            -- Integración con Telescope
            telescope = {
                -- Estilos disponibles: 'classic', 'flat'
                style = "flat",
            },
            
            -- Integración con Leap
            leap = {
                -- Oscurece el fondo cuando se usa Leap
                dim_backdrop = false,
            },
            
            -- Integración con nvim-treesitter-context
            ts_context = {
                -- Oscurece el fondo de la ventana de contexto
                dark_background = true,
            },
        })

        -- Aplicamos el tema de Neovim inmediatamente después de cargarlo
        vim.cmd.colorscheme("nordic")
    end,
}

