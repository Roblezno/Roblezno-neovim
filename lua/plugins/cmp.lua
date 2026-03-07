return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- Conecta el LSP (Pyright) con el menú
        "L3MON4D3/LuaSnip",     -- Motor de snippets (plantillas de código)
        "hrsh7th/cmp-buffer",   -- <-- Necesario para el autocompletado de '/' y '?'
        "hrsh7th/cmp-path",     -- <-- Necesario para las rutas en ':'
        "hrsh7th/cmp-cmdline",  -- <-- Necesario para los comandos en ':'
    },

    config = function()
        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                -- REQUIRED - Must specify snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(), -- Forzar que se abra el menú
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter para aceptar
                ['<Tab>'] = cmp.mapping.select_next_item(), -- Bajar en la lista
                ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- Subir en la lista
            }),

            -- Fuente de donde cmp saca las sugerencias
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            })

        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end
}
