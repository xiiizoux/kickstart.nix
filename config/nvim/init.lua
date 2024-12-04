require("user")

-- 确保 packer.nvim 插件正确加载
vim.cmd [[packadd packer.nvim]]

-- 加载插件管理文件
require('packer')

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
