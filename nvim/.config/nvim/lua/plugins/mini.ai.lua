return {
  {
    "nvim-mini/mini.ai",
    keys = {
      { "a", mode = { "x", "o" } },
      { "i", mode = { "x", "o" } },
      { "g" },
    },
    dependencies = {
      "nvim-mini/mini.extra",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = function()
      local ai = require("mini.ai")
      local extra = require("mini.extra")

      require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")

      return {
        n_lines = 500,
        custom_textobjects = {
          b = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
          x = ai.gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }),
          A = ai.gen_spec.function_call(),

          e = extra.gen_ai_spec.buffer(),
          i = extra.gen_ai_spec.indent(),
          L = extra.gen_ai_spec.line(),
        },
      }
    end,
  },
}
