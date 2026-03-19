return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ft = { 'markdown', 'quarto' }, -- Cargar solo en estos archivos
        opts = {
            file_types = { 'markdown', 'quarto' },
            code = {
                sign = false,
                width = 'block', -- Para que ocupe todo el ancho 
                right_pad = 1,
            },
        },
        -- Configuración de los colores de bloques
        config = function (_, opts)
            require('render-markdown').setup(opts)
            vim.api.nvim_set_hl(0, 'RenderMarkdownCode', {bg = '#092436'})
            vim.api.nvim_set_hl(0, 'RenderMarkdownInline', {bg = '#1F2426'})
        end
    }
}
