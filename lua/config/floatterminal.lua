local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

-- Function to open a floating terminal
function _G.open_floating_terminal()
  -- Terminal buffer
  local buf = vim.api.nvim_create_buf(false, true) -- Create a new unlisted buffer

  -- Floating window configuration
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded", -- Border style: 'single', 'double', 'shadow', 'curved', etc.
  }

  -- Create floating window
  local win = vim.api.nvim_open_win(buf, true, opts)

  return buf, win
end
local buf, win = open_floating_terminal()
print(buf, win)
-- Keymap to open the floating terminal
vim.api.nvim_set_keymap("n", "<leader>ft", ":lua open_floating_terminal()<CR>", { noremap = true, silent = true })
vim.api.nvim_create_user_command("Floaterminal", function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = open_floating_terminal()
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end, {})
