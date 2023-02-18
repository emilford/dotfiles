return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  opts = {
    ui = {
      border = "rounded",
    },
    ensure_installed = {
      "actionlint",
      "erb-lint",
      "gitlint",
      "prettierd",
      "stylua",
      "vale",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)

    local registry = require("mason-registry")
    for _, tool in ipairs(opts.ensure_installed) do
      local p = registry.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end,
}
