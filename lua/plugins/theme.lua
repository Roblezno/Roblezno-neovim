return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true, -- Activa el fondo transparente
    styles = {
      -- Opcional: También hace transparentes los paneles laterales y ventanas flotantes
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(hl, c)
            -- c.bg_highlight equivale a #292e42 automáticamente
            hl.RenderMarkdownCode = { bg = "#1f2335" } 
            
            -- Opcional: Si también quieres que el código en línea (`texto`) tenga ese fondo
            hl.RenderMarkdownCodeInline = { bg = "#1f2335" }
        end,
  },
  config = function(_, opts)
      -- Inicializamos el tema con las opciones definidas arriba
      require("tokyonight").setup(opts)
      -- Aplicamos el tema
      vim.cmd('colorscheme tokyonight-night')
  end
}
