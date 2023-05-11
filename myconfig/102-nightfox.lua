if My.UsePlugin('nightfox.nvim') then
  local colornames = require('nightfox.palette').foxes
  local group = vim.api.nvim_create_augroup('NightFoxColorOverride', { clear = true })

  if My.UsePlugin('coc.nvim') then
    local function updateCocMenuSel(name)
      local palette = require('nightfox.palette').load(name)
      local bg = palette.bg0
      local fg = palette.fg3

      vim.api.nvim_set_hl(0, 'CocMenuSel', {
        bg = palette.bg2,
      })
    end
    for name in pairs(colornames) do
      vim.api.nvim_create_autocmd({ 'VimEnter', 'Colorscheme' }, {
        pattern = tostring(name),
        callback = function()
          updateCocMenuSel(name)
        end
      })
    end
  end

  if My.UsePlugin('lightline.vim') then
    -- nightfoxのcolorschemeが、lightlineのtabline.tabselを設定していないので適当に設定する
    local function overrideNightfoxPalette(name)
      local palette = require('nightfox.palette').load(name)
      local bg = palette.bg0
      local fg = palette.fg3

      -- 現在のパレットを取得して上書き
      local p = vim.g["lightline#colorscheme#" .. name .. "#palette"]
      p.tabline.tabsel = { { bg, fg }, { fg, bg } }
      local new_pallete = vim.fn['lightline#colorscheme#fill'](p)

      local key = string.format('g:lightline#colorscheme#%s#palette', name)
      vim.g[key] = new_pallete
    end

    for name in pairs(colornames) do
      vim.api.nvim_create_autocmd({ 'VimEnter', 'Colorscheme' }, {
        pattern = tostring(name),
        callback = function()
          overrideNightfoxPalette(name)
        end
      })
    end
  end
  vim.fn.UseColorScheme('nightfox', true)
end
