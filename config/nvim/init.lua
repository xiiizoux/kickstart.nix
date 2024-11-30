require("user")

-- 设置clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- 通过conda设置python环境
vim.g.python_host_prog = '/home/zou/anaconda3/envs/nvim/bin/python'
vim.g.python3_host_prog = '/home/zou/anaconda3/envs/nvim/bin/python'
