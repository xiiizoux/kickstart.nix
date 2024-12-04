-- ~/.config/nvim/lua/packers/floaterm.lua

return function(use)
  -- 使用 vim-floaterm 插件
  use 'voldikss/vim-floaterm'

  -- 设置浮动终端的快捷键（可选）
  vim.api.nvim_set_keymap('n', '<Leader>t', ':FloatermNew<CR>', { noremap = true, silent = true })
  
  -- 可选：其他配置
  -- vim.g.floaterm_width = 0.9
  -- vim.g.floaterm_height = 0.9
end
