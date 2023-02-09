return {
  "echasnovski/mini.ai",
  opts = function()
    return {
      n_lines = 500,
      search_method = "cover_or_nearest",
      custom_textobjects = {
        b = require("mini.ai").gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }, {}),
        c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        x = require("mini.ai").gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }, {}),

        e = function(ai_type)
          -- entire buffer
          if ai_type == "i" then
            local first_non_blank = vim.fn.nextnonblank(1)
            local final_non_blank = vim.fn.prevnonblank(vim.fn.line("$"))
            local from = { line = first_non_blank, col = 1 }
            local to = { line = final_non_blank, col = math.max(vim.fn.getline(final_non_blank):len(), 1) }

            return { from = from, to = to }
          elseif ai_type == "a" then
            local from = { line = 1, col = 1 }
            local to = { line = vim.fn.line("$"), col = math.max(vim.fn.getline("$"):len(), 1) }

            return { from = from, to = to }
          end
        end,
      },
    }
  end,
  config = function(_, opts)
    require("mini.ai").setup(opts)
  end,
}
