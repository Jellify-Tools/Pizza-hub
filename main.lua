-- Fly-Skript
local player = game:GetService("Players").LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local flying = false
local speed = 50

userInput.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        flying = not flying
        if flying then
            print("Fly aktiviert!")
        else
            print("Fly deaktiviert!")
        end
    end
end)

runService.RenderStepped:Connect(function()
    if flying then
        local root = player.Character.HumanoidRootPart
        root.Velocity = Vector3.new(0, 0, 0)
        root.CFrame = root.CFrame + (userInput:GetLastInputVector() * speed)
    end
end)
