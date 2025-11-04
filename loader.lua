--// BattleBrick Hub Loader + Key System
if getgenv().BBH_Loaded then return end
getgenv().BBH_Loaded = true

local CorrectKey = "1" -- Key ตอนนี้

local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,260,0,130)
frame.Position = UDim2.new(0.35,0,0.4,0)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(1,-20,0,35)
box.Position = UDim2.new(0,10,0,10)
box.PlaceholderText = "Enter Key..."
box.BackgroundColor3 = Color3.fromRGB(45,45,45)
box.TextColor3 = Color3.fromRGB(255,255,255)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(1,-20,0,35)
btn.Position = UDim2.new(0,10,0,50)
btn.Text = "Submit Key"
btn.BackgroundColor3 = Color3.fromRGB(0,140,255)
btn.TextColor3 = Color3.fromRGB(255,255,255)

local msg = Instance.new("TextLabel", frame)
msg.Size = UDim2.new(1,0,0,20)
msg.Position = UDim2.new(0,0,0,95)
msg.BackgroundTransparency = 1
msg.TextColor3 = Color3.fromRGB(255,255,255)

btn.MouseButton1Click:Connect(function()
    if box.Text == CorrectKey then
        msg.Text = "✅ 
      Correct Key!"
        task.wait(1)
        gui:Destroy()

        loadstring(game:HttpGet("https://raw.githubusercontent.com/CGGPMS/BattleBrickHub/main/main.lua"))()
    else
        msg.Text = "❌ Wrong Key! Get Key in Discord"
    end
end)
