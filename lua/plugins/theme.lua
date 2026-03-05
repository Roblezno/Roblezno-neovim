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
  },
  config = function(_, opts)
      -- Inicializamos el tema con las opciones definidas arriba
      require("tokyonight").setup(opts)
      -- Aplicamos el tema
      vim.cmd('colorscheme tokyonight-night')
  end
}
