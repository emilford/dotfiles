return {
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values", "yaml.ghaction" },
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
