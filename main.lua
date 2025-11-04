--// BattleBrick Hub Main
if getgenv().BBH_MainLoaded then return end
getgenv().BBH_MainLoaded = true

-- Anti AFK
task.spawn(function()
    local vu = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:Connect(function()
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end)
end)

local Rep = game:GetService("ReplicatedStorage")
local spawnRemote = Rep.Events.RemoteFunction.PlayerSpawn
local replayRemote = Rep.Events.RemoteEvent.Replay

_G.AutoSpawn = false
_G.AutoReplay = false

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false

-- Toggle Button ☰
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0,60,0,60)
toggle.Position = UDim2.new(0,10,0.4,0)
toggle.Text = "☰"
toggle.TextScaled = true
toggle.BackgroundColor3 = Color3.fromRGB(30,30,30)
toggle.TextColor3 = Color3.fromRGB(0,255,200)
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

-- Main Panel
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,250,0,220)
frame.Position = UDim2.new(0,80,0.35,0)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Visible = false
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

local function button(text, y, callback)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1,-20,0,35)
    b.Position = UDim2.new(0,10,0,y)
    b.Text = text
    b.TextScaled = true
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
    b.MouseButton1Click:Connect(callback)
    return b
end

local sBtn = button("Auto Spawn: OFF", 10, function(btn)
    _G.AutoSpawn = not _G.AutoSpawn
    btn.Text = _G.AutoSpawn and "Auto Spawn: ON ✅" or "Auto Spawn: OFF ❌"
    if _G.AutoSpawn then
        task.spawn(function()
            while _G.AutoSpawn do
                for i=1,6 do
                    pcall(function()
                        spawnRemote:InvokeServer("Slot"..i)
                    end)
                    task.wait(0.2)
                end
            end
        end)
    end
end)

local rBtn = button("Auto Replay: OFF", 55, function(btn)
    _G.AutoReplay = not _G.AutoReplay
    btn.Text = _G.AutoReplay and "Auto Replay: ON ✅" or "Auto Replay: OFF ❌"
    if _G.AutoReplay then
        task.spawn(function()
            while _G.AutoReplay do
                replayRemote:FireServer()
                task.wait(2)
            end
        end)
    end
end)

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1,0,0,35)
label.Position = UDim2.new(0,0,0,165)
label.BackgroundTransparency = 1
label.Text = "Anti-AFK ✅"
label.TextColor3 = Color3.fromRGB(0,255,150)
label.TextScaled = true

toggle.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)
