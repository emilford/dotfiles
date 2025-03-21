return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      format = { enable = true },
      validate = { enable = true },
    },
  },
  init_options = {
    provideFormatter = true,
  },
  on_new_config = function(config)
    config.settings.json.schemas = config.settings.json.schemas or {}
    vim.list_extend(config.settings.json.schemas, require("schemastore").json.schemas())
  end,
}
