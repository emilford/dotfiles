return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = true,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "zbirenbaum/copilot.lua",
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
      "CodeCompanionCmd",
    },
    opts = {
      -- display.action_palette.provider
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "cmd:op read op://personal/Anthropic/credential --no-newline",
            },
          })
        end,
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              api_key = "cmd:op read op://personal/OpenAI/credential --no-newline",
            },
          })
        end,
      },
      display = {
        actions_palette = {
          provider = "default",
        },
      },
    },
  },
}
--
-- vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
--
-- -- Expand 'cc' into 'CodeCompanion' in the command line
-- vim.cmd([[cab cc CodeCompanion]])
--
-- require("codecompanion").setup({
--   strategies = {
--     chat = {
--       slash_commands = {
--         ["buffer"] = {
--           keymaps = {
--             modes = {
--               i = "<C-b>",
--               n = { "<C-b>", "gb" },
--             },
--           },
--         },
--       },
--     },
--   },
-- })
