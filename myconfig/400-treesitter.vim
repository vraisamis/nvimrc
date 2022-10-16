UsePlugin 'nvim-treesitter'

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "ruby", "rust", "scala", "vim", "lua", "javascript", "typescript"},
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
