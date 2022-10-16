UsePlugin 'nvim-treesitter'
UsePlugin 'nvim-ts-rainbow'

lua <<EOF
require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
EOF
