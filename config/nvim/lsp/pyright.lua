return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = vim.fs.root(0, { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }),

  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict", -- or "basic"
        autoImportCompletions = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace", -- or "openFilesOnly"
        extraPaths = { "./" }, -- add project paths if needed
      },
    },
  },
}

