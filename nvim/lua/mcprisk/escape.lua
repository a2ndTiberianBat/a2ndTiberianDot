local present, escape = pcall(require, "better_escape")
if not present then
    DefaultError("better_escape", "escape.lua")
    return
end

escape.setup {
    mapping = { "jk", "kj", "jj" },
}
