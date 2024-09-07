return {
  "mhinz/vim-grepper",
  cmd = { "Grepper" },
  keys = {
    { "<c-g>", "<plug>(GrepperOperator)", mode = { "x", "n" }, desc = "Grep" },
  },
  init = function()
    vim.g.grepper = {
      tools = { "git", "rg" },
      prompt_text = "Grep pattern: ",
    }

    vim.api.nvim_create_user_command("Grep", function(args)
      vim.cmd("Grepper -noprompt -query " .. args.args)
    end, { desc = "Grep", nargs = "*" })
  end,
}
