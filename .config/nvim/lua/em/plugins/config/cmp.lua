local M = {}

function M.config()
  local cmp = require("cmp")
  local cmp_defaults = require("cmp.config.default")()


  cmp.setup({
    formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol_text",
        preset = "codicons",
        menu = {
          buffer = "[buffer]",
          git = "[git]",
          ["vim-dadbod-completion"] = "[DB]",
          nvim_lsp = "[lsp]",
          nvim_lua = "[lua]",
          ultisnips = "[ultisnips]",
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
    window = cmp_defaults.window,
  })

  cmp.setup.cmdline("?", {
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

  require("cmp_git").setup()
end

return M
