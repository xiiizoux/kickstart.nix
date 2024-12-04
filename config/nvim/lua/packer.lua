-- ~/.config/nvim/lua/packer.lua

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

-- 加载模块并初始化插件
return require('packer').startup(function(use)
  -- packer.nvim 自身
  use 'wbthomason/packer.nvim'

  -- 动态加载插件模块
  local modules = { 'plugins.vim-floaterm' }
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
    require('packer').sync()
  end
end)
