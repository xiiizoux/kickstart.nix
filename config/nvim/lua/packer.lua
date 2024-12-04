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

vim.cmd([[packadd packer.nvim]])

local packer = require('packer')

packer.startup(function(use)
  -- packer.nvim 自身
  use 'wbthomason/packer.nvim'

  -- 你需要使用的其他插件
  use 'packers.floaterm'

  if packer_bootstrap then
    packer.sync()
  end
end)
