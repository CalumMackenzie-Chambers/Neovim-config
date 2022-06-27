vim.cmd[[colorscheme nord]]

local nord_options = {
	nord_contrast = true,
	nord_borders = true,
	nord_disable_background = true,
	nord_enable_sidebar_background = true,
}

for k, v in pairs(nord_options) do
	vim.g[k] = v
end

require('nord').set()
