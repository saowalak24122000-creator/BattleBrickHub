--// BattleBrick Hub Loader
if getgenv().BBH_Loaded then return end
getgenv().BBH_Loaded = true

local CorrectKey = "1"

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,300,0,160)
frame.Position = UDim2.new(0.5,-150,0.42,-80)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,35)
title.Text = "BattleBrick Hub | Key"
title.TextColor3 = Color3.fromRGB(0,255,200)
title.BackgroundTransparency = 1
title.TextScaled = true

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(1,-20,0,40)
box.Position = UDim2.new(0,10,0,40)
box.PlaceholderText = "Enter Key..."
box.BackgroundColor3 = Color3.fromRGB(45,45,45)
box.TextColor3 = Color3.fromRGB(255,255,255)
box.TextScaled = true
Instance.new("UICorner", box).CornerRadius = UDim.new(0,6)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(1,-20,0,45)
btn.Position = UDim2.new(0,10,0,90)
btn.Text = "Unlock Hub"
btn.BackgroundColor3 = Color3.fromRGB(0,160,255)
btn.TextColor3 = Color3.fromRGB(255,255,255)
btn.TextScaled = true
Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)

local msg = Instance.new("TextLabel", frame)
msg.Size = UDim2.new(1,0,0,25)
msg.Position = UDim2.new(0,0,0,138)
msg.TextColor3 = Color3.fromRGB(255,255,255)
msg.TextScaled = true
msg.BackgroundTransparency = 1

btn.MouseButton1Click:Connect(function()
    if box.Text == CorrectKey then
        msg.Text = "✅ Welcome!"
        task.wait(0.8)
        gui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/saowalak24122000-creator/BattleBrickHub/main/main.lua"))()
    else
        msg.Text = "❌ Wrong Key"
    end
end)
