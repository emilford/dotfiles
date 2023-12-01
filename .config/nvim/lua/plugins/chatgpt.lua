return {
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = {
    "ChatGPT",
    "ChatGPTRun",
    "ChatGPTActAs",
    "ChatGPTCompleteCode",
    "ChatGPTEditWithInstructions",
  },
  opts = {
    api_key_cmd = "op read op://personal/ChatGPT.nvim/credential --no-newline",
    actions_paths = { os.getenv("HOME") .. "/.config/openai/chat/actions.json" },
    openai_params = {
      model = "gpt-4",
    },
    predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/emilford/dotfiles/v4/.config/openai/chat/prompts.csv",
  },
}
