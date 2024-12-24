vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.number = true
vim.o.relativenumber = true

vim.api.nvim_create_user_command("LiveServer", function()
  local cmd = "live-server ."
  vim.fn.jobstart(cmd, { detach = true })
  print("Live Server started at http://127.0.0.1:8080")
end, {})
vim.api.nvim_set_keymap("n", "<leader>ls", ":LiveServer<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.html",
  callback = function()
    vim.cmd("LiveServer")
  end,
})

vim.api.nvim_create_user_command("LiveServer", function()
  vim.cmd("split term://live-server .")
end, {})
--vim.opt.clipboard = "unnamedplus"

