--// BattleBrick Hub Main System
if getgenv().BBH_MainLoaded then return end
getgenv().BBH_MainLoaded = true

local Rep = game:GetService("ReplicatedStorage")
local spawnRemote = Rep.Events.RemoteFunction.PlayerSpawn
local replayRemote = Rep.Events.RemoteEvent.Replay

_G.AutoSpawn = false
_G.AutoReplay = false

local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,110)
frame.Position = UDim2.new(0.7,0,0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Active = true
frame.Draggable = true

local function newBtn(text, y, func)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1,-10,0,30)
    b.Position = UDim2.new(0,5,0,y)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(50,50,50)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.MouseButton1Click:Connect(func)
end

newBtn("Auto Spawn OFF", 5, function(btn)
    _G.AutoSpawn = not _G.AutoSpawn
    btn.Text = _G.AutoSpawn and "Auto Spawn ON ✅" or "Auto Spawn OFF ❌"

    if _G.AutoSpawn then
        task.spawn(function()
            while _G.AutoSpawn do
                for i = 1,6 do
                    pcall(function()
                        spawnRemote:InvokeServer("Slot"..i)
                    end)
                    task.wait(0.2)
                end
            end
        end)
    end
end)

newBtn("Auto Replay OFF", 40, function(btn)
    _G.AutoReplay = not _G.AutoReplay
    btn.Text = _G.AutoReplay and "Auto Replay ON ✅" or "Auto Replay OFF ❌"

    if _G.AutoReplay then
        task.spawn(function()
            while _G.AutoReplay do
                pcall(function()
                    replayRemote:FireServer()
                end)
                task.wait(1)
            end
        end)
    end
end)
