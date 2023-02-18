return {
  "hrsh7th/nvim-cmp",
  event = { "CmdlineEnter", "InsertEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "kristijanhusak/vim-dadbod-completion",
    "onsails/lspkind-nvim",
    {
      "petertriho/cmp-git",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      opt = {
        github = {
          pull_requests = {
            state = "all",
          },
        },
      },
    },
    "saadparwaiz1/cmp_luasnip",
  },
  opts = function()
    local cmp = require("cmp")

    return {
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = require("lspkind").cmp_format({
          mode = "symbol",
          menu = {
            buffer = "(Buffer)",
            git = "(Git)",
            ["vim-dadbod-completion"] = "(DB)",
            nvim_lsp = "(LSP)",
            nvim_lua = "(Lua)",
            luasnip = "(Snippet)",
          },
          symbol_map = {
            Constant = "",
            Constructor = "",
            Field = "",
            Function = "",
            Keyword = "",
            Module = "",
            Reference = "",
            Snippet = "",
            Struct = "",
            TypeParameter = "",
            Variable = "",
          },
        }),
      },
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = "CursorLine:Visual,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "CursorLine:Visual,Search:None",
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<c-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<c-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<c-y>"] = cmp.mapping.confirm({ select = true }),
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
      }),
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
    }
  end,
  config = function(_, opts)
    local cmp = require("cmp")
    local cmp_defaults = require("cmp.config.default")()

    cmp.setup(opts)

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
      window = cmp_defaults.window,
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      window = cmp_defaults.window,
    })

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "git" },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.filetype({ "sql", "mysql", "psql" }, {
      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
      }, {
        { name = "buffer" },
      }),
    })
  end,
}
