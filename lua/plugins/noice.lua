return {
{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- Opcional, pero muy recomendado para notificaciones bonitas
  },
  opts = {
    lsp = {
        hover = { enabled = true },
        signature = {
            enabled = true,
            auto_open = {enabled = true}
        },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true, -- <--- Activa los bordes en la documentación flotante
    },

    views = {
        hover = {
          border = {
            style = "single", 
            padding = { 0, 2 }, -- Esto añade el margen izquierdo y derecho
          },
          win_options = {
            winblend = 0, 
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },

  }
}
}

