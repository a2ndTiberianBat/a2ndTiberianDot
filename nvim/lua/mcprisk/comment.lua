local comment_present, comment = pcall(require, "Comment")
if not comment_present then
    DefaultError("Comment", "comment.lua")
    return
end

local context_present, _ = pcall(require, "ts_context_commentstring")
if not context_present then
    DefaultError("ts_context_commentstring", "comment.lua")
    return
end

comment.setup {
    pre_hook = function(ctx)
        local U = require "Comment.utils"

        local location = nil
        if ctx.ctype == U.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring {
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
            location = location,
        }
    end,
}
