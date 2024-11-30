require("user")
vim.o.mouse = "nvi"  -- 仅在普通模式、插入模式和命令行模式下启用鼠标支持
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.g.python_host_prog = '/opt/anaconda3/envs/nvim/bin/python'
vim.g.python3_host_prog = '/opt/anaconda3/envs/nvim/bin/python'
