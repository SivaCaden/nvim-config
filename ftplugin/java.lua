-- Runs only for Java buffers
local ok, jdtls = pcall(require, "jdtls")
if not ok then return end

-- Find a sensible project root
local root = require("jdtls.setup").find_root({
  "pom.xml", "build.gradle", "build.gradle.kts", "settings.gradle", "settings.gradle.kts", ".git", "src"
})
if not root or root == "" then return end

-- One workspace folder per project
local ws = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. vim.fn.fnamemodify(root, ":p:h:t")

-- Use Mason's jdtls launcher to avoid PATH issues
local cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls", "--data", ws }

-- Only start on a saved file (avoid null-URI weirdness)
if vim.api.nvim_buf_get_name(0) ~= "" then
  jdtls.start_or_attach({
    cmd = cmd,
    root_dir = root,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
      java = {
        configuration = {
          runtimes = {
            { name = "JavaSE-21", path = os.getenv("JAVA_HOME"), default = true },
          },
        },
      },
    },
  })
end

