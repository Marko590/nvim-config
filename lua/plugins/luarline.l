return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = {
					normal = {
						c = { fg = "#b4befe" },
					},
					inactive = {
						c = { fg = "#b4befe" },
					},
				},
				section_separators = "",
				component_separators = { left = "──", right = "──" },
				padding = 0,
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"branch",
						icon = { "", color = { fg = "#b4befe" } },
						color = { fg = "#cdd6f4" },
						padding = 1,
					},
					{
						"diff",
						padding = 1,
					},
					{
						"diagnostics",
						padding = 1,
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
					},
					"%=",
					{
						"filetype",
						colored = false,
						icon_only = true,
						padding = { left = 1, right = 0 },
						separator = "∙",
					},
					{
						"filename",
						file_status = true,
						newfile_status = false,
						path = 1,
						padding = 1,
						symbols = {
							modified = "●",
						},
						color = { fg = "#cdd6f4" },
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						"progress",
						padding = 1,
						color = { fg = "#cdd6f4" },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		},
		init = function()
			vim.opt.showmode = false
			vim.opt.fillchars = {
				stl = "─",
				stlnc = "─",
			}
		end,
	},
}
