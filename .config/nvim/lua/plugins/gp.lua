return {
  "robitx/gp.nvim",
  opts = function()
    return {
      chat_template = require("gp.defaults").short_chat_template,
      chat_assistant_prefix = { ">", "[{{agent}}]" },
      chat_confirm_delete = false,
      chat_user_prefix = ">",
      style_chat_finder_border = "rounded",
      style_popup_border = "rounded",
      providers = {
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
  keys = {
    { "<c-g>n", "<cmd>GpChatNew<cr>", mode = { "n", "i" }, desc = "New Chat" },
    { "<c-g>t", "<cmd>GpChatToggle<cr>", mode = { "n", "i" }, desc = "Toggle Chat" },
    { "<c-g>f", "<cmd>GpChatFinder<cr>", mode = { "n", "i" }, desc = "Find Chat" },

    { "<c-g>n", ":<c-u>'<,'>GpChatNew<cr>", mode = { "v" }, desc = "New Chat with selection" },
    { "<c-g>t", ":<c-u>'<,'>GpChatToggle<cr>", mode = { "v" }, desc = "Toggle Chat with selection" },
    { "<c-g>p", ":<c-u>'<,'>GpChatPaste<cr>", mode = { "v" }, desc = "Paste selection to Chat" },

    { "<c-g><c-s>", "<cmd>GpChatNew split<cr>", mode = { "n", "i" }, desc = "New Chat (split)" },
    { "<c-g><c-v>", "<cmd>GpChatNew vsplit<cr>", mode = { "n", "i" }, desc = "New Chat (vsplit)" },

    { "<c-g>s", "<cmd>GpStop<cr>", mode = { "n", "i", "v", "x" }, desc = "Stop Chat" },

    { "<c-g>a", ":GpAgent ", mode = { "n", "i", "v", "x" }, desc = "Select Agent" },
  },
}
