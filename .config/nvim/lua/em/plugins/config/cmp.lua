local M = {}

function M.config()
  local cmp = require("cmp")

  cmp.setup({
    formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol_text",
        preset = "codicons",
        menu = {
          buffer = "[buffer]",
          cmp_git = "[repo]",
          ["vim-dadbod-completion"] = "[DB]",
          nvim_lsp = "[lsp]",
          nvim_lua = "[lua]",
          ultisnips = "[ultisnips]",
        },
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
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "ultisnips" },
    }, {
      { name = "buffer" },
    }),
  })

  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "cmp_git" },
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

  require("cmp_git").setup()
end

return M
