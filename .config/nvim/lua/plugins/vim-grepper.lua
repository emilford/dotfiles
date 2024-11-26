return {
  "mhinz/vim-grepper",
  cmd = { "Grepper" },
  keys = {
    { "g/", "<plug>(GrepperOperator)", mode = { "x", "n" }, desc = "Grep" },
  },
  init = function()
    vim.g.grepper = {
      open = 0,
      tools = { "git", "rg" },
      prompt_text = "Grep pattern: ",
    }

    vim.api.nvim_create_autocmd("User", {
      pattern = "Grepper",
      command = "copen",
    })

    vim.api.nvim_create_user_command("Grep", function(args)
      vim.cmd("Grepper -noprompt -query " .. args.args)
    end, { desc = "Grep", nargs = "*" })
  end,
}
