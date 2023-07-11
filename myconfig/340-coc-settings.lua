if My.UsePlugin("coc.nvim") then
  My.PutCocConfig = vim.fn['coc#config']

  -- あとで拡張したいのでグローバルな変数に入れておく
  My.coc_config = {
    ["list.normalMappings"] = {
      ["<C-t>"] = "action:tabe",
      ["v"] = "action:vsplit",
      ["<C-v>"] = "action:vsplit",
      ["<C-s>"] = "action:split"
    },
    ["list.insertMappings"] = {
      ["<C-t>"] = "action:tabe",
      ["<C-s>"] = "command:wincmd k",
      ["<C-v>"] = "command:wincmd h",
      ["<C-n>"] = "do:next",
      ["<C-p>"] = "do:previous",
    },
    ["coc.preferences.formatOnSaveFiletypes"] = {"scala"},
    ["suggest.completionItemKindLabels"] = {
      ["function"] = "\u{f794}", -- 
      ["snippet"] = "\u{f64d}", -- 
      ["color"] = "\u{e22b}", -- 
      ["folder"] = "\u{f115}", -- 
      ["file"] = "\u{f471}", -- 
      ["method"] = "\u{f6a7}", -- 
      ["variable"] = "\u{f71b}", -- 
      ["constant"] = "\u{f8ff}", -- 
      ["struct"] = "\u{f6a6}", -- 
      ["class"] = "\u{f0e8}", -- 
      ["interface"] = "\u{fa52}", -- 禍
      ["text"] = "\u{e612}", -- 
      ["enum"] = "\u{f435}", -- 
      ["enumMember"] = "\u{f02b}", -- 
      ["property"] = "\u{fab6}", -- 襁
      ["field"] = "\u{f93d}", -- 綠
      ["unit"] = "\u{f475}", -- 
      ["value"] = "\u{f8a3}", -- 
      ["event"] = "\u{facd}", -- 鬒
      ["keyword"] = "\u{f893}", -- 
      ["operator"] = "\u{f915}", -- 洛
      ["reference"] = "\u{f5f6}", -- 
      ["typeParameter"] = "\u{fad0}", -- 𢡄
      ["default"] = "\u{f29c}", -- 
    },
    ["suggest.floatConfig"] = {
      ["border"] = true,
    },
    ["diagnostic.virtualText"] = true,
    ["coc.preferences.extensionUpdateCheck"] = "daily",
    ["sumneko-lua.enableNvimLuaDev"] = true,
    ["Lua"] = {
      ["telemetry.enable"] = false,
      ["diagnostics.globals"] = {"My"},
      ["workspace.checkThirdParty"] = false
    },
    ["languageserver"] = {
    }
  }

  for section, value in pairs(My.coc_config) do
    My.PutCocConfig(section, value)
  end
end
