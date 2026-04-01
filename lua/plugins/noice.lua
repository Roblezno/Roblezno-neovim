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
      -- Sobrescribe el renderizado por defecto de Neovim
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },

    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false, -- <--- Activa los bordes en la documentación flotante
    },
  }
}
}

