if game.PlaceId == 9731376817 then
    while task.wait() do
        local player = game:GetService("Players").LocalPlayer
        for _, part in pairs(game:GetService("Workspace"):WaitForChild("Wild"):GetChildren()) do
            if part:FindFirstChild("ESP Highlight") == nil and part:FindFirstChild("ESP Gui") == nil then
                if string.find(part.Name, player.Name) then
                    local newHighlight = Instance.new("Highlight", part)
                    newHighlight.Name = "ESP Highlight"
                    newHighlight.Adornee = part
                    newHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    newHighlight.FillColor = Color3.new(0, 1, 1)
                    newHighlight.OutlineColor = Color3.new(0, 1, 1)
                    local gui = Instance.new("BillboardGui", part)
                    gui.Name = "ESP Gui"
                    gui.Adornee = part
                    gui.AlwaysOnTop = true
                    gui.ResetOnSpawn = false
                    gui.Size = UDim2.fromOffset(70, 35)
                    local text = Instance.new("TextLabel", gui)
                    text.Name = "TextLabel"
                    text.BackgroundTransparency = 1
                    text.RichText = true
                    text.TextColor3 = Color3.new(0, 1, 1)
                    text.TextScaled = true
                    text.Size = UDim2.fromScale(1, 1)
                end
            else
                local partName = ""
                local mainPart = nil
                for _, item in pairs(part:GetChildren()) do
                    if item:IsA("BasePart") then
                        partName = item.Name
                        mainPart = item
                        break
                    end
                end
                if mainPart and player.Character and partName ~= "" then
                    part["ESP Gui"].TextLabel.Text = partName .. "<br />[" .. string.format("%.0f", player:DistanceFromCharacter(mainPart.Position)) .. " studs]"
                end
            end
        end
        for _, part2 in pairs(game:GetService("Workspace"):WaitForChild("PlayerVisible"):GetChildren()) do
            if part2.Name ~= player.Name then
                for _, lol in pairs(part2:GetChildren()) do
                    if lol:FindFirstChild("ESP Highlight") == nil and lol:FindFirstChild("ESP Gui") == nil then
                        if string.find(lol.Name, player.Name) then
                            local newHighlight = Instance.new("Highlight", lol)
                            newHighlight.Name = "ESP Highlight"
                            newHighlight.Adornee = lol
                            newHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            newHighlight.FillColor = Color3.new(0, 1, 1)
                            newHighlight.OutlineColor = Color3.new(0, 1, 1)
                            local gui = Instance.new("BillboardGui", lol)
                            gui.Name = "ESP Gui"
                            gui.Adornee = lol
                            gui.AlwaysOnTop = true
                            gui.ResetOnSpawn = false
                            gui.Size = UDim2.fromOffset(70, 35)
                            local text = Instance.new("TextLabel", gui)
                            text.Name = "TextLabel"
                            text.BackgroundTransparency = 1
                            text.RichText = true
                            text.TextColor3 = Color3.new(0, 1, 1)
                            text.TextScaled = true
                            text.Size = UDim2.fromScale(1, 1)
                        end
                    else
                        local partName = ""
                        local mainPart = nil
                        for _, item in pairs(lol:GetChildren()) do
                            if item:IsA("BasePart") then
                                partName = item.Name
                                mainPart = item
                                break
                            end
                        end
                        if mainPart and player.Character and partName ~= "" then
                            lol["ESP Gui"].TextLabel.Text = partName .. "<br />[" .. string.format("%.0f", player:DistanceFromCharacter(mainPart.Position)) .. " studs]"
                        end
                    end
                end
            end
        end
        for _, thing in pairs(game:GetService("Workspace"):WaitForChild("PlayerVisible"):WaitForChild(player.Name):GetChildren()) do
            if thing:FindFirstChild("ESP Highlight") then
                thing["ESP Highlight"]:Destroy()
            end
            if thing:FindFirstChild("ESP Gui") then
                thing["ESP Gui"]:Destroy()
            end
        end
    end
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        ["Title"] = "Unsupported Game",
        ["Text"] = "This script only supports Collect The Body (place 9731376817)"
    })
end
