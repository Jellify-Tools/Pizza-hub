local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "CustomGUI"

-- Hauptframe
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

-- Titelbar
local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.BorderSizePixel = 0

local titleText = Instance.new("TextLabel", titleBar)
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.Text = "Custom GUI"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.BackgroundTransparency = 1
titleText.Font = Enum.Font.SourceSansBold
titleText.TextSize = 18

-- Schließen-Button
local closeButton = Instance.new("TextButton", titleBar)
closeButton.Size = UDim2.new(0, 30, 1, 0)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18

-- Button-Container
local buttonContainer = Instance.new("Frame", mainFrame)
buttonContainer.Size = UDim2.new(1, -20, 1, -50)
buttonContainer.Position = UDim2.new(0, 10, 0, 40)
buttonContainer.BackgroundTransparency = 1

-- Funktion zum Hinzufügen von Buttons
local function addButton(buttonName, callback)
    local button = Instance.new("TextButton", buttonContainer)
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, 0, #buttonContainer:GetChildren() * 35)
    button.Text = buttonName
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.SourceSans
    button.TextSize = 16
    button.MouseButton1Click:Connect(callback)
end

-- Schließen-Button-Funktion
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    openButton.Visible = true
end)

-- Öffnen-Button
local openButton = Instance.new("TextButton", gui)
openButton.Size = UDim2.new(0, 50, 0, 30)
openButton.Position = UDim2.new(0, 10, 0, 10)
openButton.Text = "Open"
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
openButton.BorderSizePixel = 0
openButton.Font = Enum.Font.SourceSansBold
openButton.TextSize = 14
openButton.Active = true
openButton.Draggable = true
openButton.Visible = false

openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    openButton.Visible = false
end)

-- Beispiel-Button hinzufügen
addButton("Fly Script", function()
    loadstring([[
        -- Hier kommt dein Fly-Skript
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local camera = workspace.CurrentCamera

        local flySpeed = 50
        local flying = false

        local function fly()
            while flying do
                local cameraDirection = camera.CFrame.LookVector
                humanoidRootPart.Velocity = cameraDirection * flySpeed
                wait()
            end
        end

        local function toggleFly()
            flying = not flying
            if flying then
                fly()
            else
                humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            end
        end

        game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.F then
                toggleFly()
            end
        end)
    ]])()
end)

-- Du kannst weitere Buttons hinzufügen, z.B.:
-- addButton("Button 2", function() print("Button 2 clicked") end)
