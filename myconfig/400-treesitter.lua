if My.UsePlugin("nvim-treesitter") then
  -- UsePlugin 'nvim-treesitter'
  --
  -- lua <<EOF
  require 'nvim-treesitter.configs'.setup {
      ensure_installed = { "ruby", "rust", "scala", "vim", "lua", "javascript", "typescript" },
      sync_install = false,
      highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
      },
  }

  -- TSハイライト表示
  -- FIXME: まだうごかない
  local function show_ts_highlight_info(opt)
    local ts_utils = require 'nvim-treesitter.ts_utils'
    local result = {
      ts_utils.get_node_at_cursor(vim.fn.win_getid()),

    }
    vim.api.nvim_echo({
        { vim.inspect(result) }
    }, true, {})
    -- vim.api.nvim_echo({
    --   {vim.inspect(opt)}
    -- }, true, {})
  end
  vim.api.nvim_create_user_command("ShowTSHL", show_ts_highlight_info, {})
end
