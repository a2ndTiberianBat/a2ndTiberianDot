-- DefaultError handles all errors thrown by pcalls
-- throughout this configuration.
function DefaultError(requirement, file)
    local notify_present, notify = pcall(require, "notify")
    if notify_present then
        notify(
            "Error: Plugin \"" .. requirement .. "\" not found!",
            "error",
            { title = file, }
        )
        notify(
            "Reverted to Default Configuration.",
            "warn",
            { title = file, }
        )
    else
        vim.notify(
            "Error: " .. requirement .. " not found!\n" ..
            "Required by " .. file .. " - Skipping Operation."
        )
    end
end
-- toggle will alternate between the two provided values
-- for a given setting.
function Toggle(setting, a, b)
    if(vim.api.nvim_eval('&' .. setting) == a) then
        vim.cmd("set " .. setting .. "=" .. b)
    else
        vim.cmd("set " .. setting .. "=" .. a)
    end
end
