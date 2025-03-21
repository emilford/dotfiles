return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.ghaction", "yaml.gitlab" },
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
    redhat = { telemetry = { enabled = false } },
  },
  init_options = {
    provideFormatter = true,
  },
  on_new_config = function(config)
    config.settings.yaml.schemas = config.settings.yaml.schemas or {}
    vim.list_extend(config.settings.yaml.schemas, require("schemastore").json.schemas())
  end,
}
