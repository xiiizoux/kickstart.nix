-- 使用 packer 管理插件
return require('packer').startup(function(use)
    -- Packer 自身
    use 'wbthomason/packer.nvim'

    -- vim-floaterm 插件
    use 'voldikss/vim-floaterm'

    -- 在这里添加其他插件
end)
