require("user")

-- 加载 packer 插件管理器
vim.cmd [[packadd packer.nvim]]

-- 加载插件配置文件
require('packers.packer')

-- 加载 floaterm 配置
require('packers.floaterm')
