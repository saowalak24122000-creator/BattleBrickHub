-- Hub UI + Functions
if getgenv().BBH_MainLoaded then return end
getgenv().BBH_MainLoaded = true

-- Anti AFK
local Players = game:GetService("Players")
local vu = game:GetService("VirtualUser")
Players.LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

local Rep = game:GetService("ReplicatedStorage")
local spawnRemote = Rep:WaitForChild("Events"):WaitForChild("RemoteFunction"):WaitForChild("PlayerSpawn")
local replayRemote = Rep:WaitForChild("Events"):WaitForChild("RemoteEvent"):WaitForChild("Replay")

_G.AutoSpawn = false
_G.AutoReplay = false

-- UI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.ResetOnSpawn = false

local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0,60,0,60)
ToggleBtn.Position = UDim2.new(0,10,0,0.4)
ToggleBtn.Text = "☰"
ToggleBtn.TextScaled = true
ToggleBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
ToggleBtn.TextColor3 = Color3.fromRGB(0,255,200)
ToggleBtn.Parent = ScreenGui

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0,250,0,200)
Frame.Position = UDim2.new(0,80,0,0.35)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.Visible = false
Frame.Active = true
Frame.Draggable = true

local function makeBtn(text, y, func)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(1,-20,0,35)
    btn.Position = UDim2.new(0,10,0,y)
    btn.Text = text
    btn.TextScaled = true
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Parent = Frame
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0,6)
    btn.MouseButton1Click:Connect(func)
end

makeBtn("Auto Spawn: OFF",10,function(btn)
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

makeBtn("Auto Replay: OFF",55,function(btn)
    _G.AutoReplay = not _G.AutoReplay
    btn.Text = _G.AutoReplay and "Auto Replay: ON ✅" or "Auto Replay: OFF ❌"
    if _G.AutoReplay then
        task.spawn(function()
            while _G.AutoReplay do
                pcall(function()
                    replayRemote:FireServer()
                end)
                task.wait(2)
            end
        end)
    end
end)

local lbl = Instance.new("TextLabel", Frame)
lbl.Size = UDim2.new(1,0,0,30)
lbl.Position = UDim2.new(0,10,0,140)
lbl.BackgroundTransparency = 1
lbl.Text = "Anti-AFK ✅"
lbl.TextScaled = true
lbl.TextColor3 = Color3.fromRGB(0,255,150)
lbl.Parent = Frame

ToggleBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)
