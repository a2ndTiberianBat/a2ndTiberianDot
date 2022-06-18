vim.cmd[[
    augroup DisableAutoComment
        autocmd!
        autocmd BufWinEnter * :set formatoptions-=cro
    augroup end
]]
