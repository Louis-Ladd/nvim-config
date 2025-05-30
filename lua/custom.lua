local M = {}


-- add servers to be used for auto formatting here
M.formatting_servers = {
  rust_analyzer = {},
  lua_ls = {},
  clangd = {},
	ruff = {}
}

-- add Tree-sitter to auto-install
M.ensure_installed = { "c", "css", "html", "javascript", "c_sharp", "python" }

return M
