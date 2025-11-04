-- Simple BattleBrick Hub UI
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

-- Anti AFK
Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wally"))()
local Window = Library:CreateWindow("BattleBrick Hub")

-- Main Tab
local Main = Window:CreateLabel("Auto Features")

Main = Window:CreateButton("Auto Replay", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Restart"):FireServer()
end)

Window:CreateLabel("Status: Ready ✅")
