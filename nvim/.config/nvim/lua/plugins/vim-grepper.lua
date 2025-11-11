return {
  {
    "mhinz/vim-grepper",
    cmd = { "Grepper" },
    keys = {
      {
        "g/",
        "<plug>(GrepperOperator)",
        mode = { "x", "n" },
        desc = "Grep",
      },
    },
    config = function()
      vim.g.grepper = { open = 0, tools = { "git", "rg" } }
      vim.api.nvim_create_autocmd("User", {
        pattern = "Grepper",
        command = "copen",
      })
      vim.api.nvim_create_user_command("Grep", function(command)
        vim.cmd("Grepper -noprompt -query " .. command.args)
      end, { desc = "Grep", nargs = "*" })
    end,
  },
}
