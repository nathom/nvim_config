local function auto(event, extensions, command)
    local glob = {}
    if event == "FileType" then
        if type(extensions) == "table" then
            glob = extensions
        elseif type(extensions) == "string" then
            glob = { extensions }
        end
    else
        if type(extensions) == "table" then
            for _, ext in ipairs(extensions) do
                table.insert(glob, "*." .. ext)
            end
        elseif type(extensions) == "string" then
            table.insert(glob, "*." .. extensions)
        end
    end

    local command = { "au", event, table.concat(glob, ","), command }

    vim.cmd(table.concat(command, " "))
end

auto("FileType", "asm", [[set commentstring=//%s | setf arm]])
