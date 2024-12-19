return {
  {
    "robitx/gp.nvim",
    keys = {
      { "<c-g><c-n>", "<cmd>GpChatNew<cr>", mode = { "n", "i" }, desc = "New Chat" },
      { "<c-g><c-s>", "<cmd>GpChatNew split<cr>", mode = { "n", "i" }, desc = "New Chat (split)" },
      { "<c-g><c-v>", "<cmd>GpChatNew vsplit<cr>", mode = { "n", "i" }, desc = "New Chat (vsplit)" },
      { "<c-g>a", "<cmd>GpAgent<cr>", mode = { "n", "i", "v", "x" }, desc = "Select Agent" },
      { "<c-g>f", "<cmd>GpChatFinder<cr>", mode = { "n", "i" }, desc = "Find Chat" },
      { "<c-g>s", "<cmd>GpStop<cr>", mode = { "n", "i", "v", "x" }, desc = "Stop Chat" },
    },
    opts = function()
      return {
        chat_template = require("gp.defaults").short_chat_template,
        chat_assistant_prefix = { ">", "[{{agent}}]" },
        chat_confirm_delete = false,
        chat_user_prefix = ">",
        style_chat_finder_border = "rounded",
        style_popup_border = "rounded",
        providers = {
          anthropic = {
            disable = false,
            secret = {
              "op",
              "read",
              "op://personal/Anthropic/credential",
              "--no-newline",
            },
          },
          openai = {
            secret = {
              "op",
              "read",
              "op://personal/OpenAI/credential",
              "--no-newline",
            },
          },
        },
        image = {
          secret = {
            "op",
            "read",
            "op://personal/OpenAI/credential",
            "--no-newline",
          },
          store_dir = os.getenv("HOME") .. "/Desktop",
        },
      }
    end,
  },
}
