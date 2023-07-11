if vim.fn.has("wsl") then
  local function use_win32yank()
    -- clipboard設定
    -- weztermでは必要なさそうなので無効のままにしておく
    vim.g.clipboard = {
      name = "win32yank-wsl",
      copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf"
      },
      paste = {
        ["+"] = "win32yank.exe -o --crlf",
        ["*"] = "win32yank.exe -o --crlf"
      },
      cache_enable = 0,
    }
  end

  -- use_win32yank()
end
