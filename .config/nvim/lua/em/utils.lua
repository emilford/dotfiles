local M = {}

---Require a plugin config
---@param name string
---@return any
function M.config(name)
  return require(string.format("em.plugins.config.%s", name)).config
end

function M.on_attach(client, bufnr)
  local buf_create_user_command = function(name, command)
    vim.api.nvim_buf_create_user_command(bufnr, name, command, {})
  end

  local buf_set_keymap = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
  end

  -- NOTE: These were initially wrapped in a check to only add them if
  -- the language server supports the `textDocument/publishDiagnostics`
  -- specification. Even though null-ls provides diagnostics, wrapping
  -- these caused issue. Until this can be looked into further, always
  -- add these commands and keymaps.
  buf_create_user_command("LspDiagnosticNext", vim.diagnostic.goto_next)
  buf_create_user_command("LspDiagnosticPrev", vim.diagnostic.goto_prev)
  buf_create_user_command("LspDiagnosticLine", vim.diagnostic.open_float)
  buf_create_user_command("LspDiagnosticSetloclist", vim.diagnostic.setloclist)

  buf_set_keymap("n", "]d", ":LspDiagnosticNext<cr>")
  buf_set_keymap("n", "[d", ":LspDiagnosticPrev<cr>")
  buf_set_keymap("n", "<leader>d", ":LspDiagnosticLine<cr>")
  buf_set_keymap("n", "<leader>q", ":LspDiagnosticSetloclist<cr>")

  if client.supports_method("textDocument/codeAction") then
    buf_create_user_command("LspCodeAction", "Lspsaga code_action")
  end

  if client.supports_method("textDocument/definition") then
    buf_create_user_command("LspDefinition", vim.lsp.buf.definition)
    buf_set_keymap("n", "gd", ":LspDefinition<cr>")
  end

  if client.supports_method("textDocument/formatting") then
    local lsp_formatting = function(bufnr)
      vim.lsp.buf.format({
        filter = function(client)
          return client.name ~= "tsserver"
        end,
        bufnr = bufnr,
      })
    end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })

    buf_create_user_command("LspFormat", function()
      lsp_formatting(bufnr)
    end)
    buf_set_keymap("n", "<leader>F", ":LspFormat<cr>")
  end

  if client.supports_method("textDocument/hover") then
    buf_create_user_command("LspHover", vim.lsp.buf.hover)
    buf_set_keymap("n", "K", ":LspHover<cr>")
  end

  if client.supports_method("textDocument/implementation") then
    buf_create_user_command("LspImplementation", vim.lsp.buf.implementation)
  end

  if client.supports_method("textDocument/rangeFormatting") then
    buf_set_keymap("v", "<leader>F", "LspFormat")
  end

  if client.supports_method("textDocument/references") then
    buf_create_user_command("LspReferences", vim.lsp.buf.references)
  end

  if client.supports_method("textDocument/rename") then
    buf_create_user_command("LspRename", "Lspsaga rename")
  end

  if client.supports_method("textDocument/signatureHelp") then
    buf_create_user_command("LspSignatureHelp", vim.lsp.buf.signature_help)
  end

  if client.supports_method("textDocument/typeDefinition") then
    buf_create_user_command("LspTypeDefinition", vim.lsp.buf.type_definition)
    buf_set_keymap("n", "gy", ":LspTypeDefinition<cr>")
  end

  if client.name == "tsserver" then
    buf_create_user_command("LspAddMissingImports", "TypescriptAddMissingImports")
    buf_create_user_command("LspFixAll", "TypescriptFixAll")
    buf_create_user_command("LspOrganizeImports", "TypescriptOrganizeImports")
    buf_create_user_command("LspRemoveUnused", "TypescriptRemoveUnused")
    buf_create_user_command("LspRenameFile", "TypescriptRenameFile")
  end

  require("lsp_signature").on_attach({
    toggle_key = "<M-x>",
  }, bufnr)
end

return M
