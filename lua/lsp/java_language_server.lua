-- lua/lsp/java_language_server.lua
local lspconfig = require("lspconfig")
local util = lspconfig.util

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/java-language-server"

lspconfig.java_language_server.setup({
  cmd = { mason_bin },  -- <— use Mason's binary, not PATH
  filetypes = { "java" },
  root_dir = function(fname)
    return util.root_pattern("pom.xml", "build.gradle", "settings.gradle", ".git")(fname)
      or util.root_pattern("src")(fname)
      or vim.loop.cwd()
  end,
  -- start only on real, saved files (prevents null-URI crash)
  on_new_config = function(cfg, _)
    local name = vim.api.nvim_buf_get_name(0)
    if not name or name == "" then cfg.cmd = nil end
  end,
})

