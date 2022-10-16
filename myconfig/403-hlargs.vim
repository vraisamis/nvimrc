UsePlugin 'nvim-treesitter'
UsePlugin 'hlargs.nvim'

lua <<EOF
require("hlargs").setup {
  paint_arg_declarations = true,
  paint_arg_usages = true,
  hl_priority = 10000,
  excluded_argnames = {
    declarations = {},
    usages = {
      rust = { 'self' },
      python = { 'self', 'cls' },
      lua = { 'self' }
    }
  },
}

require("hlargs").enable()
EOF

highlight! link Hlargs TSParameter
autocmd ColorScheme * highlight! link Hlargs TSParameter
