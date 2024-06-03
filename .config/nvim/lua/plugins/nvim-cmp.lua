return {
  "hrsh7th/nvim-cmp",
  event = { "CmdlineEnter", "InsertEnter" },
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "kristijanhusak/vim-dadbod-completion",
    "petertriho/cmp-git",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = function()
    local cmp = require("cmp")

    return {
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          item = require("tailwind-tools.cmp").lspkind_format(entry, item)
          item.kind = require("config").icons.kinds[item.kind] .. " "
          item.menu = ({
            buffer = "(Buffer)",
            git = "(Git)",
            ["vim-dadbod-completion"] = "(DB)",
            nvim_lsp = "(LSP)",
            luasnip = "(Snippet)",
          })[entry.source.name]
          return item
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = "CursorLine:Visual,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "CursorLine:Visual,Search:None",
        }),
      },
      mapping = {
        ["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<c-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }, { "i", "c" }),
        ["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<c-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<c-y>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
        ["<cr>"] = cmp.mapping.confirm({ select = false }, { "c" }),
      },
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

    -- https://github.com/hrsh7th/cmp-cmdline/issues/33#issuecomment-1793891721
    local function handle_tab_complete(direction)
      return function()
        if vim.api.nvim_get_mode().mode == "c" and cmp.get_selected_entry() == nil then
          local text = vim.fn.getcmdline()
          ---@diagnostic disable-next-line: param-type-mismatch
          local expanded = vim.fn.expandcmd(text)
          if expanded ~= text then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, true, true) .. expanded, "n", false)
            cmp.complete()
          elseif cmp.visible() then
            direction()
          else
            cmp.complete()
          end
        else
          if cmp.visible() then
            direction()
          else
            cmp.complete()
          end
        end
      end
    end

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = { c = handle_tab_complete(cmp.select_next_item) },
        ["<S-Tab>"] = { c = handle_tab_complete(cmp.select_prev_item) },
      }),
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
        { name = "luasnip" },
        { name = "nvim_lsp" },
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
