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
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_slash_commands = true,
            make_vars = true,
            show_result_in_chat = true,
          },
        },
      },
    },
    init = function()
      vim.cmd([[cab cc CodeCompanion]])
    end,
  },
  {
    "ravitemer/mcphub.nvim",
    build = "npm install -g mcp-hub@latest",
    cmd = "MCPHub",
    config = true,
  },
  {
    "NickvanDyke/opencode.nvim",
    keys = {
      {
        "<leader>oa",
        function()
          require("opencode").ask()
        end,
        desc = "Ask opencode",
        mode = "n",
      },
      {
        "<leader>oa",
        function()
          require("opencode").ask("@selection: ")
        end,
        desc = "Ask opencode about selection",
        mode = "v",
      },
      {
        "<leader>op",
        function()
          require("opencode").select_prompt()
        end,
        desc = "Select prompt",
        mode = { "n", "v" },
      },
      {
        "<leader>on",
        function()
          require("opencode").command("session_new")
        end,
        desc = "New session",
      },
      {
        "<leader>oy",
        function()
          require("opencode").command("messages_copy")
        end,
        desc = "Copy last message",
      },
      {
        "<S-C-u>",
        function()
          require("opencode").command("messages_half_page_up")
        end,
        desc = "Scroll messages up",
      },
      {
        "<S-C-d>",
        function()
          require("opencode").command("messages_half_page_down")
        end,
        desc = "Scroll messages down",
      },
    },
  },
}
