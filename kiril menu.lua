util.require_natives("natives-1627063482")
util.require_natives("lua_imGUI V2-1")

-- github version check and update
local response = false
local localVer = 1.2.1
local currentVer
async_http.init("raw.githubusercontent.com", "/NOTLAZERY/kiril-menu/main/version.txt", function(output)
    currentVer = tonumber(output)
    response = true
    if localVer ~= currentVer then
        util.toast("new version available, update this shit allready!.")
        menu.action(menu.my_root(), "Update", {}, "", function()
            async_http.init('raw.githubusercontent.com','/NOTLAZERY/kiril-menu/main/kiril%20menu.lua',function(a)
                local err = select(2,load(a))
                if err then
                    util.toast("aww man, something went wrong. ")
                return end
                local f = io.open(filesystem.scripts_dir()..SCRIPT_RELPATH, "wb")
                f:write(a)
                f:close()
                util.toast("holy shit it worked. Restarting Script... :)")
                util.restart_script()
            end)
            async_http.dispatch()
        end)
    end
end, function() response = true end) 
async_http.dispatch()
repeat 
    util.yield()
until response

--does this shit even work?i dont know
--push my ass