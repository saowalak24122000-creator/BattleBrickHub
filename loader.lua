local Key = "1"
if _G.Key ~= Key then
    game.Players.LocalPlayer:Kick("❌ Wrong Key! Get Key in Discord ✅")
    return
end

local url = "https://raw.githubusercontent.com/CGGPMS/BattleBrickHub/main/hub.lua"
local ok, res = pcall(function()
    return game:HttpGet(url)
end)

if ok then
    loadstring(res)()
else
    game.Players.LocalPlayer:Kick("⚠️ Failed to load hub.lua")
end
