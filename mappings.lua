---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
    ["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }
  },
}

-- more keybinds!

return M
