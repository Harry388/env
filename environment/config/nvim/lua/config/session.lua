vim.keymap.set("n", "<C-s>", function()
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
        row = 0, col = 0,
        width = vim.o.columns, height = vim.o.lines,
        style = "minimal", relative = "editor",
    })
    vim.api.nvim_create_autocmd("TermOpen", {
        buffer = buf,
        once = true,
        callback = function()
            vim.api.nvim_set_hl(0, 'TermTransparent', { bg = 'NONE', ctermbg = 'NONE' })
            vim.api.nvim_win_set_option(0, 'winhl', 'Normal:TermTransparent')
            vim.cmd("startinsert!")
        end,
    })
    vim.fn.jobstart({'session'}, {
        term = true,
        on_exit = function()
            vim.api.nvim_buf_delete(buf, {force = true})
        end,
    })
end)
