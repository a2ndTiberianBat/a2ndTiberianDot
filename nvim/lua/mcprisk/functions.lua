-- makes a protected require call to the provided requirement
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
