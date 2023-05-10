if My.UsePlugin("nvim-treesitter") then
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "ruby", "rust", "scala", "vim", "lua", "javascript", "typescript" },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }

  -- treesitterのハイライト要素表示
  local function show_ts_highlight_info(opt)
    local result = vim.treesitter.get_node_at_cursor(0)

    vim.api.nvim_echo({ { result } }, true, {})
  end
  vim.api.nvim_create_user_command("ShowTSHL", show_ts_highlight_info, {})
end
