return {
  filetypes = vim.list_extend(require("lspconfig")["yamlls"].config_def.default_config.filetypes, { "yaml.ghaction" }),
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      schemas = require("schemastore").yaml.schemas(),
      schemaStore = {
        enable = false,
        url = "",
      },
      validate = true,
    },
  },
}
