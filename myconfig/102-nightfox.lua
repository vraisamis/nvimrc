if My.UsePlugin('nightfox.nvim') then
  -- nightfoxのcolorschemeが、lightlineのtabline.tabselを設定していないので適当に設定する
  function My.overrideNightfoxPalette(name)
    local palette = require('nightfox.palette').load(name)
    local bg = palette.bg0
    local fg = palette.fg3

    local p = vim.g["lightline#colorscheme#duskfox#palette"]
    p.tabline.tabsel = { { bg, fg }, { fg, bg } }

    return vim.fn['lightline#colorscheme#fill'](p)
  end

  local w = {}
  local colornames = require('nightfox.palette').foxes
  for _, v in ipairs(colornames) do
    table.insert(w, string.format([[autocmd VimEnter,Colorscheme %s let g:lightline#colorscheme#%s#palette = luaeval("My.overrideNightfoxPalette('%s')")]], v, v, v))
  end

  My.vim_cmd_lines({
    [[augroup NightFoxColorOverride]],
      [[autocmd!]],
      -- autocmd ...
      table.concat(w, "\n"),
    [[augroup END]],
  })
  -- TODO: colorschemeを変えたときにlightlineも切り替わってほしくない？
  vim.fn.UseColorScheme('nightfox', true)
  -- vim.cmd([[
  --   g:lightline#colorscheme#nordfox#palette = luaeval("My.overrideNightfoxPalette('nightfox')")
  -- ]])
end
