require("user")

-- 通过conda设置python环境
vim.g.python_host_prog = '/opt/anaconda3/envs/nvim/bin/python'
vim.g.python3_host_prog = '/opt/anaconda3/envs/nvim/bin/python'

-- 设置远程剪切板功能
vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
}
