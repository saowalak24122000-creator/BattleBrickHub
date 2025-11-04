-- UI + Functions Hub for BattleBrick (Delta Mobile)

-- Anti AFK
for _,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

-- UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BattleBrickHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 120)
Frame.Position = UDim2.new(0.35, 0, 0.05, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "BattleBrick Hub"
Title.TextColor3 = Color3.fromRGB(0,255,255)
Title.TextScaled = true
Title.Parent = Frame

local btnAutoReplay = Instance.new("TextButton")
btnAutoReplay.Size = UDim2.new(1, 0, 0, 45)
btnAutoReplay.Position = UDim2.new(0, 0, 0, 35)
btnAutoReplay.Text = "Auto Replay: OFF"
btnAutoReplay.TextScaled = true
btnAutoReplay.BackgroundColor3 = Color3.fromRGB(60,60,60)
btnAutoReplay.Parent = Frame

local uc = Instance.new("UICorner", btnAutoReplay)
uc.CornerRadius = UDim.new(0, 8)

_G.AutoReplay = false

btnAutoReplay.MouseButton1Click:Connect(function()
    _G.AutoReplay = not _G.AutoReplay
    btnAutoReplay.Text = _G.AutoReplay and "Auto Replay: ON ✅" or "Auto Replay: OFF ❌"
    btnAutoReplay.BackgroundColor3 = _G.AutoReplay and Color3.fromRGB(0,200,0) or Color3.fromRGB(60,60,60)

    while _G.AutoReplay do
        task.wait(2)
        pcall(function()
            game:GetService("ReplicatedStorage").Events.RemoteEvent.Replay:FireServer()
        end)
    end
end)
