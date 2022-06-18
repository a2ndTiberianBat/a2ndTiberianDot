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
