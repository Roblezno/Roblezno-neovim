return{
{
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- Convertimos la terminal flotante en el comportamiento por defecto
      direction = "float", 
      
      -- Configuración visual de la ventana flotante
      float_opts = {
        border = "curved", -- Opciones: 'single', 'double', 'shadow', 'curved'
        winblend = 3,      -- Nivel de transparencia (0 es opaco, 100 es invisible)
        title_pos = "center"
      },
      
      -- Atajo rápido global para abrir/cerrar (opcional pero muy recomendado)
      open_mapping = [[<C-\>]], 
    })
  end
}
}
