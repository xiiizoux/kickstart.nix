require("user")

-- 设置clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- 通过conda设置python环境
vim.g.python_host_prog = '/opt/anaconda3/envs/nvim/bin/python'
vim.g.python3_host_prog = '/opt/anaconda3/envs/nvim/bin/python'

-- 查询所有快捷键
nnoremap("<leader>sk", function()
	require("telescope.builtin").keymaps(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]earch [K]eymaps" })
