local pickers         = require("telescope.pickers");
local finders         = require("telescope.finders");
local conf            = require("telescope.config").values;
local lspconfig_utils = require("lspconfig.util");

local M = {}

local function find_rush_json_ancestor()
  local current_buffer = vim.api.nvim_get_current_buf();
  local buffer_path = vim.api.nvim_buf_get_name(current_buffer);
  local start_path = buffer_path;

  if string.len(buffer_path) == 0 then
    start_path = vim.fn.getcwd();
  end
  return lspconfig_utils.search_ancestors(start_path, function(path)
    if lspconfig_utils.path.is_file(lspconfig_utils.path.join(path, 'rush.json')) then
      return path
    end
  end)
end

local function get_projects()
  local ok, projects = pcall(function()
    local rush_json_path = find_rush_json_ancestor();
    local package_json_blob = vim.fn.readfile(lspconfig_utils.path.join(rush_json_path .. '/rush.json'), 'B')
    local e = string.gsub(package_json_blob, "/%*.-%*/", "");
    local e1 = string.gsub(e, '// .-\n', "");
    local e2 = string.gsub(e1, '//\n', "");
    local package_json = vim.json.decode(e2);
    return package_json["projects"]
  end)
  if ok then
    return projects;
  end
  if not ok then
    return {};
  end
end

local repos = function(opts)
  opts = opts or {}
  local rush_json_path = find_rush_json_ancestor();
  pickers.new(opts, {
    prompt_title = "repos",
    finder = finders.new_table {
      results = get_projects(),
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry["packageName"],
          ordinal = entry["packageName"],
          path = rush_json_path .. '/' .. entry["projectFolder"] .. "/package.json"
        }
      end
    },
    sorter = conf.generic_sorter(opts),
  }):find()
end


M.show_monorepos = repos;

return M
