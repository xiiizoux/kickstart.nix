require("user")

-- 设置剪切板
vim.api.nvim_set_option("clipboard", "unnamedplus")
-- 从系统剪贴板复制/粘贴
vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')
-- 在不更改寄存器的情况下删除
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')

-- 通过conda设置python环境
if vim.loop.os_uname().sysname == "Darwin" then
  -- macOS 环境
  vim.g.python_host_prog = '/opt/anaconda3/envs/nvim/bin/python'
  vim.g.python3_host_prog = '/opt/anaconda3/envs/nvim/bin/python'
else
  -- Ubuntu 环境
  vim.g.python_host_prog = '/home/zou/anaconda3/envs/nvim/bin/python'
  vim.g.python3_host_prog = '/home/zou/anaconda3/envs/nvim/bin/python'
end
