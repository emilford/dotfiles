return {
  "epwalsh/obsidian.nvim",
  version = "*",
  cond = function()
    return vim.fn.isdirectory(".obsidian") ~= 0
  end,
  dependencies = {
    "echasnovski/mini.pick",
    "hrsh7th/nvim-cmp",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>nn",
      function()
        local client = require("obsidian").get_client()
        local title = vim.fn.input("Enter title (optional): ")
        local note = client:create_note({ title = title, tags = { "wip" } })
        client:open_note(note)
      end,
      desc = "Create note",
    },
    { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "Search notes" },
    { "<leader>nt", "<cmd>ObsidianTags<cr>", desc = "Search Tags" },
    { "<leader>nl", "<cmd>ObsidianLinks<cr>", desc = "Show links" },

    {
      "<leader>ne",
      function()
        local title = vim.fn.input("Enter title (optional): ")
        vim.cmd({ cmd = "ObsidianExtractNote", args = { title } })
      end,
      desc = "Extract text to a new note",
      mode = { "x" },
    },
    {
      "<leader>nl",
      function()
        local title = vim.fn.input("Enter title (optional): ")
        vim.cmd({ cmd = "ObsidianLinkNew", args = { title } })
      end,
      desc = "Link text to a new note",
      mode = { "x" },
    },
  },
  opts = {
    completion = {
      nvim_cmp = true,
      min_chars = 1,
    },
    note_id_func = function()
      return os.date("%Y%m%d%H%M%S")
    end,
    note_frontmatter_func = function(note)
      local out = { tags = note.tags }

      if note.metadata ~= nil then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,
    picker = {
      name = "mini.pick",
    },
    workspaces = {
      {
        name = "notes",
        path = "~/Documents/Notes",
      },
    },
  },
}
