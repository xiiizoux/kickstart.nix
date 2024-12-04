-- ~/.config/nvim/lua/packer.lua

-- 确保 packer 插件存在
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 延迟加载 packer 插件，避免循环依赖
local packer = require('packer')

-- 使用 packer 插件管理其他插件
packer.startup(function(use)
  -- packer.nvim 自身
  use 'wbthomason/packer.nvim'

  -- 动态加载 `packers` 下的模块
  local modules = { 'packers.floaterm' }
  for _, mod in ipairs(modules) do
    local ok, module = pcall(require, mod)
    if ok then
      module(use)
    else
      vim.notify('Error loading module: ' .. mod .. '\n' .. module, vim.log.levels.ERROR)
    end
  end

  -- 自动同步插件
  if packer_bootstrap then
    packer.sync()
  end
end)
