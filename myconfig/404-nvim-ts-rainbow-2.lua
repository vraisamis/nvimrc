if My.UsePlugin('nvim-ts-rainbow2') then
  require('nvim-treesitter.configs').setup {
    rainbow = {
      enable = true,
    },
  }
end
