require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "cpp", "bash", "lua", "vim", "vimdoc", "python", "query" },

  highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

  indent = { enable = true },

  rainbow ={
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
