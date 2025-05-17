return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/busted/library",
          "${3rd}/luv/library",
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
