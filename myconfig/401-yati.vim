UsePlugin 'nvim-treesitter'
UsePlugin 'yati'

lua <<EOF
require("nvim-treesitter.configs").setup {
  yati = { enable = true },
}
EOF
