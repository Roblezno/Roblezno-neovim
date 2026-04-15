return {
    {
      "jpalardy/vim-slime",
      init = function()
        -- Le decimos a slime que use las terminales que queremos
        -- Para terminal de neovim:
        -- vim.g.slime_target = "neovim"
       
        -- NOTE: Para terminales de tmux:
        vim.g.slime_target = "tmux"

        -- Desactivamos los mapeos por defecto para que no choquen con los nuestros
        vim.g.slime_no_mappings = true 
        -- (Opcional) No preguntar por la terminal destino cada vez si solo hay una
        -- Para terminales de neovim usamos jobid
        --vim.g.slime_default_config = { jobid = 1 }
        -- NOTE: Para terminales de tmux usamos socket_name y target_pane (opciones default)
        vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
      end,
    }
}
