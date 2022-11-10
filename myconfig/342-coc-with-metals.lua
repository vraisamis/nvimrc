local get_metals_state = function()
  local services = vim.fn.CocAction("services")

  local cond = function(_, v, _)
    return v.id == "languageserver.metals"
  end
  local metals_info = My.find_all(services, cond)

  if #metals_info > 0 then
    -- luaの配列番号は1から……
    return metals_info[1].state
  end
  return nil
end

local add_coc_command = function(name, command, description)
  vim.fn["coc#add_command"](name, command, description)
end

local define_metals_commands = function()
  -- SEE: https://github.com/scalameta/metals-languageclient/blob/d76b8b9e466b7aef978bd16470e0126722220276/src/interfaces/ServerCommands.ts
  local commands = {
    "ammonite-start",
    "ammonite-stop",
    "analyze-stacktrace",
    "bsp-switch",
    "build-connect",
    "build-disconnect",
    "build-import",
    "build-restart",
    "compile-cancel",
    "compile-cascade",
    "compile-clean",
    "copy-worksheet-output",
    "debug-adapter-start",
    "doctor-run",
    "file-decode",
    "list-build-targets",
    "generate-bsp-config",
    "goto",
    "goto-position",
    "goto-super-method",
    "new-scala-file",
    "new-java-file",
    "new-scala-project",
    "reset-choice",
    "scala-cli-start",
    "scala-cli-stop",
    "sources-scan",
    "super-method-hierarchy",
  }

  for _, v in pairs(commands) do
    local name = "metals." .. v
    local action = ":call CocActionAsync('runCommand', '" .. v .. "')"
    add_coc_command(name, action)
  end
end

local define_metals_commands_if_metals_started = function()
  local metals_state = get_metals_state()
  if metals_state == 'starting' or metals_state == 'running' then
    define_metals_commands()
  end
end

if My.UsePlugin("coc.nvim") then
  local metals_executable_name = "metals-vim"

  if My.has_executable(metals_executable_name) then
    -- configに追加する
    local languageserver_config = My.coc_config.languageserver
    languageserver_config.metals = {
      ["command"] = metals_executable_name,
      ["rootPatterns"] = { "build.sbt" },
      ["filetypes"] = { "scala", "sbt" },
      ["trace.server"] = "verbose", -- デバッグするときに有効にする
    }
    My.PutCocConfig("languageserver", languageserver_config)

    -- TODO: metals起動時にコマンドを登録する
    -- SEE: https://github.com/neoclide/coc.nvim/discussions/3901
    local group = vim.api.nvim_create_augroup('coc-nvim-metals-config', { clear = true })
    vim.api.nvim_create_autocmd({ 'User' }, {
      group = group,
      pattern = 'CocNvimInit',
      -- 理屈としてはこうしたいんだけど、CocNvimInitのときにはmetalsはinit状態なので無理
      -- callback = define_metals_commands_if_metals_started
      callback = define_metals_commands
    })
  end
end
