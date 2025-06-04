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
      "ravitemer/codecompanion-history.nvim",
      "zbirenbaum/copilot.lua",
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
      "CodeCompanionCmd",
      "CodeCompanionHistory",
    },
    keys = {
      { "<leader>cp", "<cmd>CodeCompanionChat Add<cr>", mode = { "v" }, desc = "Paste Selection" },
      { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Show Actions" },
      { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle Chat" },
      { "<leader>ch", "<cmd>CodeCompanionHistory<cr>", mode = { "n", "v" }, desc = "Show Chat History" },
    },
    opts = {
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
        opts = {
          show_defaults = false,
        },
      },
      display = {
        actions_palette = {
          provider = "mini_pick",
        },
      },
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = "gh",
            auto_save = true,
            dir_to_save = vim.fn.getcwd() .. "/.ai/codecompanion",
            expiration_days = 0,
          },
        },
      },
    },
    init = function()
      vim.cmd([[cab cc CodeCompanion]])
    end,
  },
}
