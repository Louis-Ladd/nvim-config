local M = {}


-- add servers to be used for auto formatting here
M.formatting_servers = {
  rust_analyzer = {},
  lua_ls = {},
  clangd = {},
}

-- add Tree-sitter to auto-install
M.ensure_installed = { "c", "css", "c_sharp" }

return M
