-- Auto Skip, Auto Leave, and Auto Enter Script for "Wait in Line to Get a Low Taper Fade!"
-- Improved for Solara Executor

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Function to instantly skip the line
local function skipLine()
    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:IsA("Part") and v.Name == "SkipButton" then
            if v:FindFirstChildOfClass("ClickDetector") then
                fireclickdetector(v:FindFirstChildOfClass("ClickDetector"))
            else
                UserInputService.InputBegan:Fire(Enum.UserInputType.MouseButton1, true)
            end
        end
    end
end

-- Function to auto leave the barbershop
local function leaveBarbershop()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:IsA("Part") and v.Name == "ExitDoor" then
                LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 2, 0)
            end
        end
    end
end

-- Function to auto enter the barbershop
local function enterBarbershop()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:IsA("Part") and v.Name == "EntranceDoor" then
                LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 2, 0)
            end
        end
    end
end

-- Run the functions automatically
skipLine()
task.wait(1) -- Short delay to ensure actions process
leaveBarbershop()
task.wait(1)
enterBarbershop()
