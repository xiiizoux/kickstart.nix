require("user")
vim.o.mouse = ""  -- 禁用鼠标支持
vim.o.mouse = "a"  -- 启用鼠标支持
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.g.python_host_prog = '/opt/anaconda3/envs/nvim/bin/python'
vim.g.python3_host_prog = '/opt/anaconda3/envs/nvim/bin/python'
