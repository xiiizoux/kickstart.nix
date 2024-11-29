-- 加载 packer 插件管理器
vim.cmd [[packadd packer.nvim]]

-- 使用 packer 管理插件
return require('packer').startup(function(use)
    -- Packer 自身
    use 'wbthomason/packer.nvim'

    -- floaterm 插件
    use 'voldikss/vim-floaterm'

    -- 在此处添加其他插件
end)
