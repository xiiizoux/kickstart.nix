return {
    "voldikss/vim-floaterm",
    lazy = false,  -- 设置为 false 以确保插件立即加载
    config = function()
        -- 基础配置
        vim.g.floaterm_width = 0.8     -- 设置终端窗口宽度为屏幕的 80%
        vim.g.floaterm_height = 0.8    -- 设置终端窗口高度为屏幕的 80%
        vim.g.floaterm_position = 'center'  -- 设置终端窗口在屏幕中央打开
        
        -- 快捷键设置
        vim.keymap.set('n', '<leader>t', ':FloatermToggle<CR>', { noremap = true, silent = true })
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true, silent = true })
    end,
}
