util.require_natives("natives-1627063482")
util.require_natives("lua_imGUI V2-1")

-- github version check and update
local response = false
local localVer = "1.3"
local currentVer
async_http.init("raw.githubusercontent.com", "/NOTLAZERY/kiril-menu/master/version.txt", function(output)
    currentVer = tonumber(output)
    response = true
    if localVer ~= currentVer then
        util.toast("new version available, update this shit allready!.")
        menu.action(menu.my_root(), "Update", {}, "", function()
            async_http.init('raw.githubusercontent.com','/NOTLAZERY/kiril-menu/master/kiril%20menu.lua',function(a)
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


--self options lua script
local menu.list(menu.my_root("self", {}, ''))

--online options lua scipt
local menu.list(menu.my_root("online", {}, ''))
--options under the online options lua script
--world options lua script
local menu.list(menu.my_root("world", {}, ''))
local menu.list(menu.my_root("world", "vehicles", {}, ''))
--function for vehicle options
local function avoid Traffic()
    local menu.list(menu.my_root("world", "vehicles", "avoid Traffic", {}, ''))
end
menu.toggle(menu.my_root("world", "vehicles", "avoid Traffic", {}, ''), "avoid Traffic", {}, "", avoid Traffic)
    while function(avoid Traffic) do
        ped.near(global.player(), 1000, function(ped)
            if ped.is_in_any_vehicle(ped) then
                ped.delete(ped)
            utils.yeald()
        ped.vehicle(near(global.player()))
           if ped.vehicle(ped) then
               ped.delete(ped)
            utils.yeald()
           end
        end
    utils.toast("avoid Traffic is now on")
    end
end


    










--script version check
local menu.version(menu.my_root(), "Version: "..localVer, {}, "")
--does this shit even work?i dont know
--push my ass