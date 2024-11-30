return {
	{
		"gelguy/wilder.nvim",
		keys = { ":", "/", "?" }, -- 按键绑定
		dependencies = { "catppuccin/nvim" }, -- 依赖插件
		build = function()
			vim.fn["UpdateRemotePlugins"]()
		end, -- 更新 RemotePlugins
		config = function()
			local wilder = require("wilder")
			local catppuccin = require("catppuccin.palettes")
			local macchiato = catppuccin.get_palette("macchiato")

			-- 设置高亮（可选，若仍报错可以注释掉）
			local text_highlight = wilder.make_hl("WilderText", {
				{ a = 1 }, { a = 1 }, { foreground = macchiato.text },
			})
			local mauve_highlight = wilder.make_hl("WilderMauve", {
				{ a = 1 }, { a = 1 }, { foreground = macchiato.mauve },
			})

			-- 启用 wilder.nvim
			wilder.setup({ modes = { ":", "/", "?" } })

			-- 设置模糊过滤器和命令管道
			wilder.set_option("pipeline", {
				wilder.branch(
					wilder.cmdline_pipeline({
						fuzzy = 1,
						fuzzy_filter = wilder.python_fuzzy_filter(),
					}),
					wilder.vim_search_pipeline({
						fuzzy = 1,
					})
				),
			})

			-- 渲染器配置
			wilder.set_option("renderer", wilder.popupmenu_renderer(
				wilder.popupmenu_border_theme({
					highlighter = wilder.basic_highlighter(),
					highlights = {
						default = text_highlight,
						border = mauve_highlight,
						accent = mauve_highlight,
					},
					pumblend = 5,
					min_width = "100%",
					min_height = "25%",
					max_height = "25%",
					border = "rounded",
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
				})
			))
		end,
	},
}
