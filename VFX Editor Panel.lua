local coreGui = game:GetService("CoreGui")
local starterGui = game:GetService("StarterGui")
function alertClient(title, content)
    starterGui:SetCore("SendNotification", {
        ["Title"] = title,
        ["Text"] = content
    })
end
if coreGui:FindFirstChild("VFX Editor V1") then
    alertClient("Reloading script", "Replacing old instances with new ones...")
    coreGui["VFX Editor V1"]:Destroy()
else
    alertClient("Loading script", "Creating instances and scripts, this should not take long...")
end
local UI = Instance.new("ScreenGui")
UI.Name = "VFX Editor V1"
UI.ResetOnSpawn = false
UI.IgnoreGuiInset = true
UI.Parent = coreGui
local body = Instance.new("Frame")
body.Size = UDim2.fromScale(0.65, 0.6)
body.Position = UDim2.fromScale(0.175, 0.2)
body.Name = "Body"
body.Visible = false
body.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
body.Parent = UI
local bodyCorner = Instance.new("UICorner")
bodyCorner.CornerRadius = UDim.new(0.1, 0)
bodyCorner.Parent = body
local listLayout = Instance.new("UIListLayout")
listLayout.FillDirection = Enum.FillDirection.Horizontal
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.VerticalAlignment = Enum.VerticalAlignment.Center
listLayout.Parent = body
local bodyStroke = Instance.new("UIStroke")
bodyStroke.Color = Color3.fromRGB(255, 255, 255)
bodyStroke.Thickness = 0.03
bodyStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
bodyStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
bodyStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
bodyStroke.Parent = body
local bStrokeG = Instance.new("UIGradient")
bStrokeG.Parent = bodyStroke
bStrokeG.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
})
local frameB = Instance.new("Frame")
frameB.Size = UDim2.fromScale(0.3, 0.94)
frameB.BackgroundTransparency = 1
frameB.LayoutOrder = 0
frameB.Parent = body
frameB.Name = "Brightness"
local bList = Instance.new("UIListLayout")
bList.SortOrder = Enum.SortOrder.LayoutOrder
bList.HorizontalAlignment = Enum.HorizontalAlignment.Center
bList.VerticalAlignment = Enum.VerticalAlignment.Center
bList.Parent = frameB
local bIncrease = Instance.new("TextButton")
bIncrease.Font = Enum.Font.Kalam
bIncrease.BackgroundTransparency = 1
bIncrease.TextScaled = true
bIncrease.TextColor3 = Color3.fromRGB(255, 255, 255)
bIncrease.Size = UDim2.fromScale(0.75, 0.2)
bIncrease.LayoutOrder = 0
bIncrease.Text = "+"
bIncrease.Name = "Increase"
bIncrease.BackgroundTransparency = 1
bIncrease.Parent = frameB
local bDecrease = bIncrease:Clone()
bDecrease.Name = "Decrease"
bDecrease.Text = "-"
bDecrease.LayoutOrder = 2
bDecrease.Parent = frameB
local bDisplay = Instance.new("TextLabel")
bDisplay.LayoutOrder = 1
bDisplay.Text = "1"
bDisplay.Size = UDim2.fromScale(0.75, 0.25)
bDisplay.Font = Enum.Font.Kalam
bDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
bDisplay.TextScaled = true
bDisplay.BackgroundTransparency = 1
bDisplay.Parent = frameB
local bLabel = bDisplay:Clone()
bLabel.Text = "Brightness"
bLabel.Name = "Title"
bLabel.LayoutOrder = -1
bLabel.Size = UDim2.fromScale(0.75, 0.16)
bLabel.Parent = frameB
local bDCorner = Instance.new("UICorner")
bDCorner.CornerRadius = UDim.new(0.2, 0)
bDCorner.Parent = bDisplay
local bDStroke = bodyStroke:Clone()
bDStroke.Thickness = 0.1
bDStroke.Parent = bDisplay
local bDGradient = bStrokeG:Clone()
bDGradient.Parent = bDStroke
local frameS = frameB:Clone()
frameS.LayoutOrder = 1
frameS.Name = "Saturation"
frameS.Title.Text = "Saturation"
frameS.Parent = body
local frameC = frameB:Clone()
frameC.LayoutOrder = 2
frameC.Name = "Contrast"
frameC.Title.Text = "Contrast"
frameC.Parent = body
local toggler = Instance.new("ImageButton")
toggler.Image = ""
toggler.Size = UDim2.fromScale(0.06, 0.12)
toggler.Position = UDim2.fromScale(0.94, 0.05)
toggler.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toggler.Parent = UI
local tCorner = bodyCorner:Clone()
tCorner.CornerRadius = UDim.new(0.5, 0)
tCorner.Parent = toggler
local tStroke = bDStroke:Clone()
tStroke.Thickness = 0.1
tStroke.Parent = toggler
local tSGradient = bDGradient:Clone()
tSGradient.Parent = tStroke
local gradients = {
    body.UIStroke.UIGradient,
    toggler.UIStroke.UIGradient,
    frameB.TextLabel.UIStroke.UIGradient,
    frameS.TextLabel.UIStroke.UIGradient,
    frameC.TextLabel.UIStroke.UIGradient
}
local buttons = {
    ["bIncrease"] = frameB.Increase,
    ["bDecrease"] = frameB.Decrease,
    ["sIncrease"] = frameS.Increase,
    ["sDecrease"] = frameS.Decrease,
    ["cIncrease"] = frameC.Increase,
    ["cDecrease"] = frameC.Decrease
}
local levels = {
    ["b"] = 10,
    ["s"] = 10,
    ["c"] = 10
}
local lightVFX = Instance.new("ColorCorrectionEffect")
lightVFX.Parent = game:GetService("Lighting")
buttons.bIncrease.MouseButton1Click:Connect(function()
    levels.b = levels.b + 1
end)
buttons.bDecrease.MouseButton1Click:Connect(function()
    levels.b = levels.b - 1
end)
buttons.sIncrease.MouseButton1Click:Connect(function()
    levels.s = levels.s + 1
end)
buttons.sDecrease.MouseButton1Click:Connect(function()
    levels.s = levels.s - 1
end)
buttons.cIncrease.MouseButton1Click:Connect(function()
    levels.c = levels.c + 1
end)
buttons.cDecrease.MouseButton1Click:Connect(function()
    levels.c = levels.c - 1
end)
toggler.MouseButton1Click:Connect(function()
    body.Visible = not body.Visible
end)
local dir = "rtg"
local r = 255
local g = 0
local b = 0
alertClient("Script loaded", "Successfully loaded all required instances and functions")
while task.wait() do
    frameB.TextLabel.Text = tostring(levels.b / 10)
    frameS.TextLabel.Text = tostring(levels.s / 10)
    frameC.TextLabel.Text = tostring(levels.c / 10)
    lightVFX.Brightness = tonumber(frameB.TextLabel.Text) - 1
    lightVFX.Saturation = tonumber(frameS.TextLabel.Text) - 1
    lightVFX.Contrast = tonumber(frameC.TextLabel.Text) - 1
    if dir == "rtg" then
        if g < 255 then
            g = g + 2.5
        elseif r > 0 then
            r = r - 2.5
        else
            dir = "gtb"
        end
    elseif dir == "gtb" then
        if b < 255 then
            b = b + 2.5
        elseif g > 0 then
            g = g - 2.5
        else
            dir = "btr"
        end
    elseif dir == "btr" then
        if r < 255 then
            r = r + 2.5
        elseif b > 0 then
            b = b - 2.5
        else
            dir = "rtg"
        end
    end
    for _, grad in pairs(gradients) do
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(r, g, b)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
        })
        grad.Rotation = grad.Rotation + 1
    end
end
