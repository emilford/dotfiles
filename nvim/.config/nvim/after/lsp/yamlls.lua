return {
  filetypes = vim.list_extend(require("lspconfig")["yamlls"].config_def.default_config.filetypes, { "yaml.ghaction" }),
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      schemaStore = {
        enable = false,
        url = "",
      },
      validate = true,
    },
  },
  on_new_config = function(config)
    config.settings.yaml.schemas = config.settings.yaml.schemas or {}
    vim.list_extend(config.settings.yaml.schemas, require("schemastore").yaml.schemas())
  end,
}
