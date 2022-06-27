local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("calum.lsp.lsp-installer")
require("calum.lsp.handlers").setup()
