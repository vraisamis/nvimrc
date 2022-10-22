local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end
My.deepcopy = deepcopy

local function vim_cmd_lines(tbl)
  local commands = table.concat(tbl, "\n")
  vim.cmd(commands)
end
My.vim_cmd_lines = vim_cmd_lines

-- find all elements matched conditioin(key, value, table) in table.
local function find_all(table, condition)
  local results = {}
  for k, v in pairs(table) do
    if condition(k, v, table) then
      results[k] = v
    end
  end
  return results
end
My.find_all = find_all
