local Players = game:GetService("Players")

for _, Player in ipairs(Players:GetPlayers()) do
    local Character = Player.Character

    if Character then
        local Highlight = Instance.new("Highlight")
        Highlight.Parent = Character
        Highlight.Adornee = Character
        Highlight.FillTransparency = 1
        Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        Highlight.OutlineTransparency = 0
        Highlight.DepthMode = "Occluded"
    end
end
