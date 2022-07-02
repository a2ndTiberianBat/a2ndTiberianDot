_G.__luacache_config = {
    chunks = {
        enable = true,
        path = vim.fn.stdpath('cache') .. '/luacache_chunks',
    },
    modpaths = {
        enable = true,
        path = vim.fn.stdpath('cache') .. '/luacache_modpaths',
    }
}

local impatient_present, _ = pcall(require, 'impatient')
if not impatient_present then
    DefaultError('impatient', 'impatient.lua')
end
