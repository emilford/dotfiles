vim.api.nvim_create_augroup("CustomAutoCommands", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "CustomAutoCommands",
  pattern = "gitcommit",
  command = "startinsert",
  desc = "Starts insert mode",
})

vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  group = "CustomAutoCommands",
  callback = function()
    vim.wo.cursorline = true
  end,
  desc = "Enable cursorline when leaving insert mode or entering window",
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  group = "CustomAutoCommands",
  callback = function()
    vim.wo.cursorline = false
  end,
  desc = "Disable cursorline when in insert mode or leaving window",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "CustomAutoCommands",
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
  desc = "Create missing directory when writing buffer",
})

vim.api.nvim_create_autocmd("VimResized", {
  group = "CustomAutoCommands",
  command = "wincmd =",
  desc = "Keep opens windows an equal size",
})

vim.api.nvim_create_autocmd("CursorMoved", {
  group = "CustomAutoCommands",
  command = "norm zz",
  desc = "Keep cursor centered in window",
})

vim.api.nvim_create_autocmd("FileType", {
  group = "CustomAutoCommands",
  pattern = { "help", "lspinfo" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  desc = "Press q to close the window",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = "CustomAutoCommands",
  callback = function()
    vim.hl.on_yank()
  end,
  desc = "Highlight the yanked text",
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = "CustomAutoCommands",
  callback = function(args)
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, { desc = "vim.lsp.buf.definition()", buffer = true })

    vim.keymap.set("n", "gt", function()
      vim.lsp.buf.type_definition()
    end, { desc = "vim.lsp.buf.type_definition()", buffer = true })

    vim.api.nvim_create_user_command("LspLog", function()
      vim.cmd(string.format("tabnew %s", vim.lsp.get_log_path()))
    end, { desc = "Open the LSP client log" })

    vim.api.nvim_create_user_command("LspRestart", function()
      vim.cmd("LspStop")
      vim.cmd("edit")
    end, { desc = "Restart running LSP clients" })

    vim.api.nvim_create_user_command("LspStop", function()
      vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() }))
    end, { desc = "Stop running LSP clients" })

    vim.lsp.document_color.enable(true, args.buf, { style = require("config.icons").misc.square .. " " })
  end,
})
