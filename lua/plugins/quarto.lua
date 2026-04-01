return {
    {
      "quarto-dev/quarto-nvim",
      dependencies = {
        "jmbuhr/otter.nvim",
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require("quarto").setup({
          lspFeatures = {
            -- Añade aquí los lenguajes que uses habitualmente en tus bloques de código
            languages = { "r", "python", "julia", "bash", "html" },
            chunks = "all", -- Activar lsp para todos los bloques
            diagnostics = {
              enabled = true,
              triggers = { "BufWritePost" },
            },
            completion = {
              enabled = true,
            },
          },
          codeRunner = {
            -- Lo dejaremos en false por ahora para no romper nada, 
            -- luego puedes configurarlo si usas vim-slime o molten
            enabled = true,
            default_method = "slime",
            ft_runners = {},
            never_run = {"yaml"}
          },
        })
        local runner = require("quarto.runner")
        vim.keymap.set("n", "<leader>rc", runner.run_cell,  { desc = "Quarto: Ejecutar celda actual", silent = true })
        vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "Quarto: Ejecutar celda y anteriores", silent = true })
        vim.keymap.set("n", "<leader>rA", runner.run_all,   { desc = "Quarto: Ejecutar todas las celdas", silent = true })
        vim.keymap.set({"n", "x"}, "<leader>rl", runner.run_line,  { desc = "Ejecutar línea actual", silent = true })
        -- Este atajo invoca el menú de configuración nativo de Slime
        vim.keymap.set("n", "<leader>rs", "<Plug>SlimeConfig", { desc = "Seleccionar terminal destino (Slime)" })
        -- Ejecutar bloques de código seleccionados en modo VISUAL
        vim.keymap.set("x", "<leader>rv", "<Plug>SlimeRegionSend", { desc = "Ejecutar selección visual", silent = true })
      end
    }
}
