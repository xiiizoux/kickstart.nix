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

-- 插件配置
return require('packer').startup(function(use)
  -- packer.nvim 本身
  use 'wbthomason/packer.nvim'

  -- 示例插件
  use 'voldikss/vim-floaterm'
  -- use 'neovim/nvim-lspconfig'

  -- 自动同步插件
  if packer_bootstrap then
    require('packer').sync()
  end
end)
