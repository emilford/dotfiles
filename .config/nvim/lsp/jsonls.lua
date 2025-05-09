return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      format = { enable = true },
      validate = { enable = true },
    },
    schemas = require("schemastore").json.schemas(),
  },
  init_options = {
    provideFormatter = true,
  },
}
