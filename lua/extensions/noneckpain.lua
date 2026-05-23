local M = {}

M.target_width = 120
M.left_win = nil
M.right_win = nil

function M.is_active()
  return (M.left_win and vim.api.nvim_win_is_valid(M.left_win))
      or (M.right_win and vim.api.nvim_win_is_valid(M.right_win))
end

function M.toggle()
  if M.is_active() then
    M.disable()
  else
    M.enable()
  end
end

function M.enable()
  if M.is_active() then return end

  local padding = M.calc_padding()
  if padding < 1 then
    vim.notify("Terminal too narrow for centering", vim.log.levels.WARN)
    return
  end

  local main_win = vim.api.nvim_get_current_win()
  local scratch_buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_set_current_win(main_win)
  vim.cmd("leftabove vsplit")
  M.left_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(M.left_win, scratch_buf)
  vim.cmd("vertical resize " .. padding)

  vim.api.nvim_set_current_win(main_win)
  vim.cmd("rightbelow vsplit")
  M.right_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(M.right_win, scratch_buf)
  vim.cmd("vertical resize " .. padding)

  vim.api.nvim_set_current_win(main_win)

  M.style_window(M.left_win)
  M.style_window(M.right_win)
  M.setup_autocmds()
end

function M.disable()
  M.cleanup_autocmds()
  M.close_windows()
end

function M.calc_padding()
  return math.max(0, math.floor((vim.o.columns - M.target_width) / 2))
end

function M.style_window(win)
  vim.wo[win].winfixwidth = true
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].signcolumn = "no"
  vim.wo[win].statuscolumn = " "
  vim.wo[win].foldcolumn = "0"
  vim.wo[win].spell = false
  vim.wo[win].wrap = false
  vim.wo[win].list = false
  vim.wo[win].cursorline = false
  vim.wo[win].cursorcolumn = false
  vim.wo[win].colorcolumn = ""
  vim.wo[win].winhighlight = "Normal:NormalFloat"
end

function M.setup_autocmds()
  local group = vim.api.nvim_create_augroup("NoNeckPain", { clear = true })

  vim.api.nvim_create_autocmd("VimResized", {
    group = group,
    callback = M.resize,
  })

  vim.api.nvim_create_autocmd("WinClosed", {
    group = group,
    callback = function(args)
      local closed = tonumber(args.match)
      if (M.left_win and closed == M.left_win) or (M.right_win and closed == M.right_win) then
        M.cleanup()
      end
    end,
  })
end

function M.cleanup_autocmds()
  pcall(vim.api.nvim_del_augroup_by_name, "NoNeckPain")
end

function M.close_windows()
  for _, win in ipairs({ M.left_win, M.right_win }) do
    if win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end
  M.left_win = nil
  M.right_win = nil
end

function M.resize()
  if not M.is_active() then
    M.cleanup()
    return
  end

  local padding = math.max(1, M.calc_padding())

  for _, win in ipairs({ M.left_win, M.right_win }) do
    if win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_set_current_win(win)
      vim.cmd("vertical resize " .. padding)
    end
  end
end

function M.cleanup()
  M.cleanup_autocmds()
  M.close_windows()
end

return M
