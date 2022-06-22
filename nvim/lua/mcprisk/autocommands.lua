vim.cmd[[
    augroup DisableAutoComment
        autocmd!
        autocmd BufWinEnter * :set formatoptions-=cro
    augroup end

    augroup UpdatePluginsOnWrite
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
        end
    end
})
