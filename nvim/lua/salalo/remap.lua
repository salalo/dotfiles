vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- move block in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in place when merging line into one
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor at the middle when jumping
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy straight to buffer to paste elsewehre
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- replace the word I'm at in all occurrences
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- mix format
-- vim.keymap.set("n", "<leader>F", "<cmd>!mix format<CR>")
vim.keymap.set("n", "<leader>F", function()
  local file = vim.fn.expand("%")
  local result = vim.fn.system("mix format " .. vim.fn.shellescape(file))
  if vim.v.shell_error ~= 0 then
    vim.notify("mix format failed: " .. result, vim.log.levels.ERROR)
  else
    vim.notify("mix format succeeded", vim.log.levels.INFO)
    vim.cmd("e!") -- Reload the current file to reflect changes
  end
end)
