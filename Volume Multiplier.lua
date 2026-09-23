local function notify(contents, button, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Volume Multiplier",
        Text = contents or "uhh idk random notification",
        Button1 = button or nil,
        Duration = duration or 5
    })
end

if _G.VolumeMultiplier_IsLoading then
    notify("Already loading!")
	return
end

if _G.VolumeMultiplier_IsLoaded then
    notify("Already loaded!")
	return
end

_G.VolumeMultiplier_IsLoading = true

notify("Loading...")

local coreGui = game:GetService("CoreGui")
local inputService = game:GetService("UserInputService")

local function copy(asset, parent, name)
	local clonedAsset = asset:Clone()
	clonedAsset.Parent = parent or asset.Parent
	clonedAsset.Name = name or asset.Name
	return clonedAsset
end

local function create(class, parent, name)
	local newAsset = Instance.new(class, parent or game:GetService("Workspace"))
	newAsset.Name = name or class
	return newAsset
end

local gui = create("ScreenGui", coreGui, "Volume Multiplier")
gui.IgnoreGuiInset = false
gui.ResetOnSpawn = false

local screenBounds = create("Frame", gui, "Screen Bounds")
screenBounds.Size = UDim2.fromScale(1, 1)
screenBounds.BackgroundTransparency = 1
screenBounds.Position = UDim2.fromScale(0, 0)

local body = create("Frame", gui, "Body")
body.Visible = false
body.Size = UDim2.fromScale(0.4, 0.6)
body.Position = UDim2.fromScale(0.3, 0.2)
body.BackgroundColor3 = Color3.fromRGB(100, 0, 0)

local ratio = create("UIAspectRatioConstraint", body)
ratio.AspectRatio = 1.5

local bodyBorder = create("UIStroke", body)
bodyBorder.Color = Color3.new(1, 0, 0)
bodyBorder.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
bodyBorder.BorderStrokePosition = Enum.BorderStrokePosition.Inner
bodyBorder.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
bodyBorder.Thickness = 0.01

local bodyCorners = create("UICorner", body)
bodyCorners.CornerRadius = UDim.new(0.05, 0)

local bodyDrag = create("UIDragDetector", body)
bodyDrag.ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale
bodyDrag.BoundingUI = screenBounds

local title = create("TextLabel", body, "Title")
title.BackgroundTransparency = 1
title.Size = UDim2.fromScale(1, 0.15)
title.Font = Enum.Font.Oswald
title.Text = "Volume Multiplier"
title.TextColor3 = Color3.new(1, 0, 0)
title.TextScaled = true

local desc = create("TextLabel", body, "Description")
desc.BackgroundTransparency = 1
desc.Position = UDim2.fromScale(0, 0.15)
desc.Size = UDim2.fromScale(1, 0.25)
desc.Font = Enum.Font.Oswald
desc.RichText = true
desc.Text = "Multiply the volume of in-game sounds.<br />Use at your own hearing's risk..."
desc.TextColor3 = Color3.fromRGB(255, 150, 150)
desc.TextScaled = true

local barContainer = create("Frame", body, "Preset Bar")
barContainer.BackgroundTransparency = 1
barContainer.Position = UDim2.fromScale(0.025, 0.425)
barContainer.Size = UDim2.fromScale(0.7, 0.15)

local button10p = create("ImageButton", barContainer, "10%")
button10p.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
button10p.BorderSizePixel = 0
button10p.Size = UDim2.fromScale(1, 1)
button10p.Image = ""
button10p.LayoutOrder = 1

local button10pRatio = create("UIAspectRatioConstraint", button10p)
button10pRatio.AspectRatio = 1

local button10pStroke = create("UIStroke", button10p)
button10pStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
button10pStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
button10pStroke.Color = Color3.new(1, 0, 0)
button10pStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
button10pStroke.Thickness = 0.05

local button10pCorners = create("UICorner", button10p)
button10pCorners.CornerRadius = UDim.new(0, 0)
button10pCorners.BottomLeftRadius = UDim.new(0.5, 0)
button10pCorners.TopLeftRadius = UDim.new(0.5, 0)

local button25p = copy(button10p, barContainer, "25%")
button25p.UICorner:Destroy()
button25p.LayoutOrder = 2

local button50p = copy(button25p, barContainer, "50%")
button50p.LayoutOrder = 3

local button1x = copy(button50p, barContainer, "1x")
button1x.LayoutOrder = 4

local button2x = copy(button1x, barContainer, "2x")
button2x.LayoutOrder = 5

local button5x = copy(button2x, barContainer, "5x")
button5x.LayoutOrder = 6

local button10x = copy(button5x, barContainer, "10x")
button10x.LayoutOrder = 7

local button10xCorners = create("UICorner", button10x)
button10xCorners.CornerRadius = UDim.new(0, 0)
button10xCorners.TopRightRadius = UDim.new(0.5, 0)
button10xCorners.BottomRightRadius = UDim.new(0.5, 0)

local listLayout = create("UIListLayout", barContainer)
listLayout.FillDirection = Enum.FillDirection.Horizontal
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.VerticalAlignment = Enum.VerticalAlignment.Center

local presetDisplay = create("TextLabel", body, "Preset Display")
presetDisplay.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
presetDisplay.Position = UDim2.fromScale(0.75, 0.425)
presetDisplay.Size = UDim2.fromScale(0.225, 0.15)
presetDisplay.Font = Enum.Font.Oswald
presetDisplay.Text = "1x"
presetDisplay.TextColor3 = Color3.new(1, 0, 0)
presetDisplay.TextScaled = true

local presetDisplayCorners = create("UICorner", presetDisplay)
presetDisplayCorners.CornerRadius = UDim.new(0.25, 0)

local customMultiplierCheckbox = create("ImageButton", body, "Checkbox")
customMultiplierCheckbox.BackgroundTransparency = 1
customMultiplierCheckbox.BackgroundColor3 = Color3.new(1, 1, 1)
customMultiplierCheckbox.Position = UDim2.fromScale(0.075, 0.61)
customMultiplierCheckbox.Size = UDim2.fromScale(0.1, 0.15)
customMultiplierCheckbox.Image = ""

local customMultiplierCheckboxRatio = create("UIAspectRatioConstraint", customMultiplierCheckbox)
customMultiplierCheckboxRatio.AspectRatio = 1

local customMultiplierCheckboxCorners = create("UICorner", customMultiplierCheckbox)
customMultiplierCheckboxCorners.CornerRadius = UDim.new(0.3, 0)

local customMultiplierCheckboxStroke = create("UIStroke", customMultiplierCheckbox)
customMultiplierCheckboxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
customMultiplierCheckboxStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
customMultiplierCheckboxStroke.Color = Color3.new(1, 0, 0)
customMultiplierCheckboxStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
customMultiplierCheckboxStroke.Thickness = 0.075

local customMultiplierLabel = create("TextLabel", body, "Custom Multiplier Label")
customMultiplierLabel.BackgroundTransparency = 1
customMultiplierLabel.Position = UDim2.fromScale(0.175, 0.61)
customMultiplierLabel.Size = UDim2.fromScale(0.5, 0.15)
customMultiplierLabel.Font = Enum.Font.Oswald
customMultiplierLabel.Text = "Custom Multiplier:"
customMultiplierLabel.TextColor3 = Color3.new(1, 0, 0)
customMultiplierLabel.TextScaled = true
customMultiplierLabel.TextXAlignment = Enum.TextXAlignment.Right

local customMultiplierInput = create("TextBox", body, "Custom Multiplier Input")
customMultiplierInput.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
customMultiplierInput.Position = UDim2.fromScale(0.7, 0.61)
customMultiplierInput.Size = UDim2.fromScale(0.225, 0.15)
customMultiplierInput.Font = Enum.Font.Oswald
customMultiplierInput.PlaceholderColor3 = Color3.fromRGB(150, 0, 0)
customMultiplierInput.PlaceholderText = "1"
customMultiplierInput.Text = ""
customMultiplierInput.TextColor3 = Color3.new(1, 0, 0)
customMultiplierInput.TextScaled = true

local customMultiplierInputCorners = copy(presetDisplayCorners, customMultiplierInput)

local applyButton = create("TextButton", body, "Apply Button")
applyButton.BackgroundTransparency = 1
applyButton.Position = UDim2.fromScale(0.075, 0.8)
applyButton.Size = UDim2.fromScale(0.4, 0.15)
applyButton.Font = Enum.Font.Oswald
applyButton.Text = "Apply"
applyButton.TextColor3 = Color3.new(1, 0, 0)
applyButton.TextScaled = true

local applyButtonCorner = create("UICorner", applyButton)
applyButtonCorner.CornerRadius = UDim.new(0.25, 0)

local applyButtonStroke = create("UIStroke", applyButton)
applyButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
applyButtonStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
applyButtonStroke.Color = Color3.new(1, 0, 0)
applyButtonStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
applyButtonStroke.Thickness = 0.075

local resetButton = copy(applyButton, body, "Reset Button")
resetButton.Position = UDim2.fromScale(0.525, 0.8)
resetButton.Text = "Reset"

local mobileToggle = create("TextButton", gui, "Mobile Toggle")
mobileToggle.Text = ""
mobileToggle.Visible = false
mobileToggle.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
mobileToggle.Position = UDim2.fromScale(0, 0)
mobileToggle.Size = UDim2.fromScale(0.3, 0.1)

local mobileToggleRatio = create("UIAspectRatioConstraint", mobileToggle)
mobileToggleRatio.AspectRatio = 4

local mobileToggleCorners = create("UICorner", mobileToggle)
mobileToggleCorners.CornerRadius = UDim.new(0.25, 0)

local mobileToggleDrag = copy(bodyDrag, mobileToggle)

local mobileToggleStroke = create("UIStroke", mobileToggle)
mobileToggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
mobileToggleStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
mobileToggleStroke.Color = Color3.new(1, 0, 0)
mobileToggleStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
mobileToggleStroke.Thickness = 0.05

local mobileToggleLabel = create("TextLabel", mobileToggle, "Label")
mobileToggleLabel.BackgroundTransparency = 1
mobileToggleLabel.Position = UDim2.fromScale(0, 0.15)
mobileToggleLabel.Size = UDim2.fromScale(1, 0.7)
mobileToggleLabel.Font = Enum.Font.Oswald
mobileToggleLabel.Text = "Toggle UI"
mobileToggleLabel.TextColor3 = Color3.new(1, 0, 0)
mobileToggleLabel.TextScaled = true

-- Over 200 lines just to make the UI...
-- Though, compared to other scripts, this is light...

local values = {
	customActive = false,
	customMultiplier = 1,
	presetMultiplier = 1
}

inputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.UserInputType == Enum.UserInputType.Touch then
			mobileToggle.Visible = true
		else
			mobileToggle.Visible = false
		end
		if input.KeyCode == Enum.KeyCode.V and inputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
			body.Visible = not body.Visible
		end
	end
end)

mobileToggle.TouchTap:Connect(function()
	body.Visible = not body.Visible
end)

local function setMultiplier(source, newMultiplier)
	if source.Parent == barContainer then
		values.presetMultiplier = newMultiplier
		print("Set the preset multiplier to " .. tostring(newMultiplier))
		for _, button in barContainer:GetChildren() do
			if button:IsA("ImageButton") then
				if button.LayoutOrder > source.LayoutOrder then
					button.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
				else
					button.BackgroundColor3 = Color3.new(255, 100, 100)
				end
			end
		end
	elseif source == customMultiplierInput then
		values.customMultiplier = newMultiplier
		print("Set the custom multiplier to " .. tostring(newMultiplier))
	elseif source == resetButton then
		values.customMultiplier = newMultiplier
		values.presetMultiplier = newMultiplier
		values.customActive = false
		for _, button in barContainer:GetChildren() do
			if button:IsA("ImageButton") then
				if button.LayoutOrder > button1x.LayoutOrder then
					button.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
				else
					button.BackgroundColor3 = Color3.new(255, 100, 100)
				end
			end
		end
		presetDisplay.Text = "1x"
		print("Reset the volume multiplier.")
	end
end

setMultiplier(button1x, 1)

customMultiplierCheckbox.MouseButton1Click:Connect(function()
	values.customActive = not values.customActive
	if values.customActive then
		customMultiplierCheckbox.BackgroundTransparency = 0
	else
		customMultiplierCheckbox.BackgroundTransparency = 1
	end
end)

resetButton.MouseButton1Click:Connect(function()
	setMultiplier(resetButton, 1)
	customMultiplierCheckbox.BackgroundTransparency = 1
end)

applyButton.MouseButton1Click:Connect(function()
	if values.customActive then
		if customMultiplierInput.Text == "" then
			setMultiplier(customMultiplierInput, 1)
		else
			setMultiplier(customMultiplierInput, tonumber(customMultiplierInput.Text))
		end
	end
end)

button10p.MouseButton1Click:Connect(function()
	setMultiplier(button10p, 0.1)
	presetDisplay.Text = "0.1x"
end)

button25p.MouseButton1Click:Connect(function()
	setMultiplier(button25p, 0.25)
	presetDisplay.Text = "0.25x"
end)

button50p.MouseButton1Click:Connect(function()
	setMultiplier(button50p, 0.5)
	presetDisplay.Text = "0.5x"
end)

button1x.MouseButton1Click:Connect(function()
	setMultiplier(button1x, 1)
	presetDisplay.Text = "1x"
end)

button2x.MouseButton1Click:Connect(function()
	setMultiplier(button2x, 2)
	presetDisplay.Text = "2x"
end)

button5x.MouseButton1Click:Connect(function()
	setMultiplier(button5x, 5)
	presetDisplay.Text = "5x"
end)

button10x.MouseButton1Click:Connect(function()
	setMultiplier(button10x, 10)
	presetDisplay.Text = "10x"
end)

_G.VolumeMultiplier_IsLoading = false
_G.VolumeMultiplier_IsLoaded = true

notify("Loaded! Press Alt + V to toggle the menu (or the UI button on mobile)", "Okay", 60)

while task.wait(0.25) do
	for _, item in game:GetDescendants() do
		if item:IsA("Sound") then
			if item:FindFirstChild("OriginalVolume") == nil then
				local newIntValue = create("IntValue", item, "OriginalVolume")
				newIntValue.Value = item.Volume
			else
				if item.OriginalVolume.Value == 0 then
					item.OriginalVolume.Value = 1
				end
				if values.customActive then
					item.Volume = item.OriginalVolume.Value * values.customMultiplier
				else
					item.Volume = item.OriginalVolume.Value * values.presetMultiplier
				end
			end
		elseif item:IsA("IntValue") then
			if item.Name == "OriginalVolume" then
				if item.Value == 0 then
					item.Value = 0.05
				end
			end
		end
	end
end
