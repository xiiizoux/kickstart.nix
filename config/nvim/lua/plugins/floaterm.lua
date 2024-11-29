-- 配置 vim-floaterm
vim.g.floaterm_keymap_toggle = '<F12>'
vim.g.floaterm_keymap_new = '<F11>'
vim.g.floaterm_height = 0.8
vim.g.floaterm_width = 0.8
vim.g.floaterm_title = 'Terminal'

-- 结合FloatermToggle 实现有则toggle 无则新建
function toggleFT(name, cmd)
    if vim.fn['floaterm#terminal#get_bufnr'](name) ~= -1 then
        vim.api.nvim_command(string.format('exec "FloatermToggle %s"', name))
    else
        vim.api.nvim_command(string.format('FloatermNew --name=%s %s', name, cmd))
    end
end
