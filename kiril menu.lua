util.require_natives("natives-1627063482")
util.require_natives("json")
util.require_natives("lua_imGUI V2-1")
util.require_natives("")

-- github version check and update
local response = false
local localVer = 1.0.3
local currentVer
async_http.innit("raw.githubusercontent.com", "NOTLAZERY/kiril-menu/main/version.txt")
    current_version = tonumber(output)
    response = true
    if local version ~= currentVer then
        util_toast("kiril menu", "new version available",)
        menu.action(menu.my_root(), "update", {}, "", function()
            async_http.init('raw.githubusercontent.com', 'NOTLAZERY/kiril-menu/main/kiril-menu.lua', function(a))
                local err = select(2, load(a))
                if err then
                    util_toast("error loading update", "if the error download the update manually",)
                return end
                local fn io.open(filesystem.scripts.dir().. SCRIPT_RELPATH, "wb")
                f:write(a)
                f:close()
                util_toast("kiril menu", "updated",)
                util.restart_script()
            end)
            async_http.dispatch()
        end
    end
end, function() response = true end)
async_http.dispatch()
repeat
    util.yield()
until response

