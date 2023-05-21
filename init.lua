local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local function open_nvim_tree(data)

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  if not no_name and not directory  and not real_file then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  else
    if real_file then
      vim.cmd.cd(vim.fs.dirname(data.file))
    end
  end

  require("nvim-tree.api").tree.open()

end

autocmd("VimEnter", {
  desc = "Open nvim-tree on startup with directory",
  group = augroup("nvim-tree_start", { clear = true }),
  callback = open_nvim_tree,
})