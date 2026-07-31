local coreGui = game:GetService("CoreGui")
local starterGui = game:GetService("StarterGui")
function notify(title, content)
	starterGui:SetCore("SendNotification", {
		["Title"] = title,
		["Text"] = content
	})
end
notify("Loading fake lag panel...", "This shouldn't take long...")
if coreGui:FindFirstChild("Fake Lag") then
	coreGui["Fake Lag"]:Destroy()
end
function createInstance(class, parent, name, position, size, color, text, textColor, textFont, backgroundColor, rotation, thickness, radius, strokeMode, strokeSizingMode, strokePosition)
	local newInstance = Instance.new(class, parent)
	if name then
		newInstance.Name = name
	end
	if position then
		newInstance.Position = position
	end
	if size then
		newInstance.Size = size
	end
	if color then
		newInstance.Color = color
	end
	if text then
		newInstance.Text = text
	end
	if textColor then
		newInstance.TextColor3 = textColor
	end
	if textFont then
		newInstance.Font = textFont
	end
	if backgroundColor then
		newInstance.BackgroundColor3 = backgroundColor
	end
	if rotation then
		newInstance.Rotation = rotation
	end
	if thickness then
		newInstance.Thickness = thickness
	end
	if radius then
		newInstance.CornerRadius = radius
	end
	if strokeMode then
		newInstance.ApplyStrokeMode = strokeMode
	end
	if strokeSizingMode then
		newInstance.StrokeSizingMode = strokeSizingMode
	end
	if strokePosition then
		newInstance.BorderStrokePosition = strokePosition
	end
	return newInstance
end
local bodyBorderGradient = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))
})
local bodyMainGradient = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 0))
})
local optionButtonGradient = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 0))
})
local font = Enum.Font.IndieFlower
local UI = createInstance("ScreenGui", coreGui, "Fake Lag")
UI.IgnoreGuiInset = true
UI.ResetOnSpawn = false
local body = createInstance("Frame", UI, "Main", UDim2.fromScale(0.3, 0.25), UDim2.fromScale(0.35, 0.5), nil, nil, nil, nil, Color3.new(1, 1, 1))
body.Visible = false
local bodyCorners = createInstance("UICorner", body, "Corners", nil, nil, nil, nil, nil, nil, nil, nil, nil, UDim.new(0.1, 0))
local bodyStroke = createInstance("UIStroke", body, "Border", nil, nil, Color3.new(1, 1, 1), nil, nil, nil, nil, nil, 0.025, nil, Enum.ApplyStrokeMode.Border, Enum.StrokeSizingMode.ScaledSize, Enum.BorderStrokePosition.Inner)
local bodyGradient = createInstance("UIGradient", body, "Background", nil, nil, bodyMainGradient, nil, nil, nil, nil, 90)
local bodyStrokeGradient = createInstance("UIGradient", bodyStroke, "Border Gradient", nil, nil, bodyBorderGradient, nil, nil, nil, nil, 90)
local title = createInstance("TextLabel", body, "Title", UDim2.fromScale(0, 0.025), UDim2.fromScale(1, 0.2), nil, "Fake Lag", Color3.new(1, 0, 0), font)
title.BackgroundTransparency = 1
title.TextScaled = true
local desc = createInstance("TextLabel", body, "Description", UDim2.fromScale(0.025, 0.225), UDim2.fromScale(0.95, 0.35), nil, "Make it appear as if you're lagging<br />when you're really not.", Color3.new(1, 0, 0), font)
desc.BackgroundTransparency = 1
desc.RichText = true
desc.TextScaled = true
local option1 = createInstance("TextButton", body, "Low FPS", UDim2.fromScale(0.05, 0.6), UDim2.fromScale(0.4, 0.325), nil, "", nil, nil, Color3.new(1, 1, 1))
local option2 = createInstance("TextButton", body, "Disconnect", UDim2.fromScale(0.55, 0.6), UDim2.fromScale(0.4, 0.325), nil, "", nil, nil, Color3.new(1, 1, 1))
local option1Label = createInstance("TextLabel", option1, "Label", UDim2.fromScale(0.08, 0.22), UDim2.fromScale(0.84, 0.56), nil, "Low FPS", Color3.new(1, 1, 1), font)
option1Label.BackgroundTransparency = 1
option1Label.TextScaled = true
local option2Label = createInstance("TextLabel", option2, "Disconnect", UDim2.fromScale(0.08, 0.08), UDim2.fromScale(0.84, 0.84), nil, "Disconnect", Color3.new(1, 1, 1), font)
option2Label.BackgroundTransparency = 1
option2Label.TextScaled = true
local option1Background = createInstance("UIGradient", option1, "Background", nil, nil, optionButtonGradient, nil, nil, nil, nil, 90)
local option2Background = createInstance("UIGradient", option2, "Background", nil, nil, optionButtonGradient, nil, nil, nil, nil, 90)
local option1Corners = createInstance("UICorner", option1, "Corners", nil, nil, nil, nil, nil, nil, nil, nil, nil, UDim.new(0.2, 0))
local option2Corners = createInstance("UICorner", option2, "Corners", nil, nil, nil, nil, nil, nil, nil, nil, nil, UDim.new(0.2, 0))
local option1Stroke = createInstance("UIStroke", option1, "Border", nil, nil, Color3.new(1, 1, 1), nil, nil, nil, nil, nil, 0.08, nil, Enum.ApplyStrokeMode.Border, Enum.StrokeSizingMode.ScaledSize, Enum.BorderStrokePosition.Inner)
local option2Stroke = createInstance("UIStroke", option2, "Border", nil, nil, Color3.new(1, 1, 1), nil, nil, nil, nil, nil, 0.08, nil, Enum.ApplyStrokeMode.Border, Enum.StrokeSizingMode.ScaledSize, Enum.BorderStrokePosition.Inner)
local option1Gradient = createInstance("UIGradient", option1Stroke, "Border Gradient", nil, nil, optionButtonGradient, nil, nil, nil, nil, -90)
local option2Gradient = createInstance("UIGradient", option2Stroke, "Border Gradient", nil, nil, optionButtonGradient, nil, nil, nil, nil, -90)
local toggle = createInstance("ImageButton", UI, "Toggle", UDim2.fromScale(0.94, 0.44), UDim2.fromScale(0.06, 0.12), nil, nil, nil, nil, Color3.new(1, 1, 1))
local toggleStroke = bodyStroke:Clone()
toggleStroke.Parent = toggle
toggleStroke.Thickness = 0.08
local toggleStrokeGradient = bodyStrokeGradient:Clone()
toggleStrokeGradient.Parent = toggleStroke
local toggleBackground = bodyGradient:Clone()
toggleBackground.Parent = toggle
local toggleCorner = createInstance("UICorner", toggle, "Corners", nil, nil, nil, nil, nil, nil, nil, nil, nil, UDim.new(0.5, 0))
toggle.MouseButton1Click:Connect(function()
	body.Visible = not body.Visible
end)
local lagTypes = {
	["lowFPS"] = false,
	["disconnect"] = false
}
local selectedOneGradient = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 0))
})
option1.MouseButton1Click:Connect(function()
	if lagTypes.disconnect then
		lagTypes.disconnect = false
	end
	if lagTypes.lowFPS then
		lagTypes.lowFPS = false
	else
		lagTypes.lowFPS = true
	end
	print("Low FPS toggled to " .. tostring(lagTypes.lowFPS))
end)
option2.MouseButton1Click:Connect(function()
	if lagTypes.lowFPS then
		lagTypes.lowFPS = false
	end
	if lagTypes.disconnect then
		lagTypes.disconnect = false
	else
		lagTypes.disconnect = true
	end
	print("Disconnect toggled to " .. tostring(lagTypes.disconnect))
end)
local hasNotified = false
while task.wait() do
	if lagTypes.lowFPS then
		option1Background.Color = selectedOneGradient
		option1Gradient.Color = selectedOneGradient
	else
		option1Background.Color = optionButtonGradient
		option1Gradient.Color = optionButtonGradient
	end
	if lagTypes.disconnect then
		option2Background.Color = selectedOneGradient
		option2Gradient.Color = selectedOneGradient
	else
		option2Background.Color = optionButtonGradient
		option2Gradient.Color = optionButtonGradient
	end
	local player = game:GetService("Players").LocalPlayer
	if workspace:FindFirstChild(player.Name) and player.Character then
		local rootPart = player.Character:WaitForChild("HumanoidRootPart")
		if rootPart then
			if lagTypes.lowFPS and not lagTypes.disconnect then
				rootPart.Anchored = true
				task.wait(0.75)
				rootPart.Anchored = false
				task.wait(0.1)
			elseif lagTypes.disconnect and not lagTypes.lowFPS then
				rootPart.Anchored = true
			else
				rootPart.Anchored = false
			end
		end
	end
	if not hasNotified then
		hasNotified = true
		notify("Fake lag panel loaded!", "Have fun trolling :3")
	end
end
