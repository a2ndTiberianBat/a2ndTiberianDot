-- preq makes a protected require call to the provided requirement
-- and returns the result on success, otherwise notifies the user
-- with an error message and returns nil.
function preq(requirement, file)
    local present, object = pcall(require, requirement)
    if not present then
        vim.notify(
            "Error: " .. requirement .. " not found!\n" ..
            "Required by " .. file .. " - Skipping Operation."
        )
        return nil
    end
    return object
end
-- toggle will alternate between the two provided values
-- for a given setting.
function toggle(setting, a, b)
    if(vim.api.nvim_eval('&' .. setting) == a) then
        vim.cmd("set " .. setting .. "=" .. b)
    else
        vim.cmd("set " .. setting .. "=" .. a)
    end
end
