if My.UsePlugin('firenvim') then
  if vim.fn.exists('g:started_by_firenvim') == 1 then
    vim.api.nvim_set_option('guifont', 'migu NF:h12')
    vim.cmd([[autocmd BufEnter * exec "set lines=".max([&lines, 10])]])
  end

  local get = function(name, default)
    if vim.fn.exists('g:' .. name) == 1 then
      return vim.api.nvim_get_var(name)
    else
      return default
    end
  end
  local extend = function(dst, src)
    for k, v in pairs(src) do
      dst[k] = v
    end
    return dst
  end

  local fc = extend(get('firenvim_config', {}), {
    localSettings = {
      [".*"] = {
        -- コマンドラインはneovimのまま
        cmdline = 'neovim',
        -- 自動ではneovimモードにしない。ショートカットでする。
        takeover = 'never'
      }
    }
  })
  vim.api.nvim_set_var('firenvim_config', fc)

  -- Kaggle
  My.vim_cmd_lines({
    [[augroup FireNvimKaggle]],
      [[autocmd BufEnter www.kaggle.com_*.txt set filetype=markdown]],
      [[autocmd BufEnter kkb-production.jupyter-proxy.kaggle.net_*.txt set filetype=python lines=max(&lines, 20)]],
    [[augroup END]],
  })

  -- フォントとウィンドウサイズを同時設定するとウィンドウサイズ設定が
  -- うまく効かないことがあるので、ウィンドウサイズ設定をコマンド化する
  vim.api.nvim_create_user_command(
    'KaggleWindow',
    function(opts)
      -- Nothing
    end,
    { nargs = 0, bang = true, bar = true }
  )
end
