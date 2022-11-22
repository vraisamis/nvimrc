if My.UsePlugin("coc.nvim") and My.UsePlugin("vim-easymotion") then
  -- easymotion中はdiagnoseを無効にする（構文エラーが無駄に出る）
  -- SEE: https://github.com/neoclide/coc.nvim/wiki/F.A.Q#unexpected-diagnostics-when-using-easymotion
  local group = vim.api.nvim_create_augroup("coc-easymotion", { clear = false })
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "EasyMotionPromptBegin",
    command = "let b:coc_diagnostic_disable = 1"
  })
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "EasyMotionPromptEnd",
    command = "let b:coc_diagnostic_disable = 0"
  })
end
