---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
    ["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }
  },

  v = {
    ["."] = { ":norm.<CR>", desc = "Make visual mode . work as normal mode's ."}
  },
}

-- more keybinds!

return M
