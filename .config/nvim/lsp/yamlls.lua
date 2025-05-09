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
      schemas = require("schemastore").yaml.schemas(),
      validate = true,
    },
    redhat = { telemetry = { enabled = false } },
  },
  init_options = {
    provideFormatter = true,
  },
}
