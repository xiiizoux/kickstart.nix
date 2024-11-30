return {
	{
		"gelguy/wilder.nvim",
		keys = { ":", "/", "?" },
		dependencies = {
			"catppuccin/nvim",
		},
		build = function()
			vim.fn["UpdateRemotePlugins"]()
		end,
		config = function()
			local wilder = require("wilder")
			local catppuccin = require("catppuccin.palettes")
			local macchiato = catppuccin.get_palette("macchiato")

			-- 高亮组配置（如仍有问题可注释掉）
			local text_highlight = wilder.make_hl("WilderText", {
				{ a = 1 }, { a = 1 }, { foreground = macchiato.text },
			})
			local mauve_highlight = wilder.make_hl("WilderMauve", {
				{ a = 1 }, { a = 1 }, { foreground = macchiato.mauve },
			})

			-- 启用 Wilder
			wilder.setup({ modes = { ":", "/", "?" } })

			-- 管道设置（明确指定 Python fuzzy filter）
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

			-- 渲染器设置
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
