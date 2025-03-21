return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = {
      "MasonToolsClean",
      "MasonToolsInstall",
      "MasonToolsInstallSync",
      "MasonToolsUpdate",
      "MasonToolsUpdateSync",
    },
  },
}
