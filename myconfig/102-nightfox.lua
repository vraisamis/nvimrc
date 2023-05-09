if My.UsePlugin('nightfox.nvim') then
  -- TODO 統合
  function My.updateCocMenuSel(name)
    local palette = require('nightfox.palette').load(name)
    local bg = palette.bg0
    local fg = palette.fg3

    vim.api.nvim_set_hl(0, 'CocMenuSel', {
      bg = palette.bg2,
    })

    -- TODO: lightline依存を切る
  end
  -- nightfoxのcolorschemeが、lightlineのtabline.tabselを設定していないので適当に設定する
  function My.overrideNightfoxPalette(name)
    local palette = require('nightfox.palette').load(name)
    local bg = palette.bg0
    local fg = palette.fg3

    local p = vim.g["lightline#colorscheme#" .. name .. "#palette"]
    p.tabline.tabsel = { { bg, fg }, { fg, bg } }

    -- TODO: lightline依存を切る
    return vim.fn['lightline#colorscheme#fill'](p)
  end

  local w = {}
  local colornames = require('nightfox.palette').foxes
  for _, v in ipairs(colornames) do
    table.insert(w, string.format([[autocmd VimEnter,Colorscheme %s let g:lightline#colorscheme#%s#palette = luaeval("My.overrideNightfoxPalette('%s')")]], v, v, v))
    table.insert(w, string.format([[autocmd VimEnter,Colorscheme %s lua My.updateCocMenuSel('%s')]], v, v))
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
