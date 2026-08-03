-- ESP script template version 1
-- 100% free with no key, and it always will be
-- Made with Visual Studio Code and Roblox Studio

local function create(className, parent, instanceName)
	if className then
		local newInstance = Instance.new(className)
		if parent then
			newInstance.Parent = parent
		end
		if instanceName then
			newInstance.Name = instanceName
		end
		return newInstance
	end
end

local function getChildren(parent, specificName, specificClass)
	local children = {}
	for _, child in pairs(parent:GetChildren()) do
		local insertPosition = #children + 1
		if specificName and specificClass then
			if child.Name == specificName and child.ClassName == specificClass then
				table.insert(children, insertPosition, child)
			end
		elseif specificName then
			if child.Name == specificName then
				table.insert(children, insertPosition, child)
			end
		elseif specificClass then
			if child.ClassName == specificClass then
				table.insert(children, insertPosition, child)
			end
		else
			table.insert(children, insertPosition, child)
		end
	end
	return children
end

local function getDescendants(ancestor, specificName, specificClass)
	local descendants = {}
	for _, descendant in pairs(ancestor:GetDescendants()) do
		local insertPosition = #descendants + 1
		if specificName and specificClass then
			if descendant.Name == specificName and descendant.ClassName == specificClass then
				table.insert(descendants, insertPosition, descendant)
			end
		elseif specificName then
			if descendant.Name == specificName then
				table.insert(descendants, insertPosition, descendant)
			end
		elseif specificClass then
			if descendant.ClassName == specificClass then
				table.insert(descendants, insertPosition, descendant)
			end
		else
			table.insert(descendants, insertPosition, descendant)
		end
	end
	return descendants
end

local coreGui = game:GetService("CoreGui")

for _, asset in pairs(getChildren(coreGui, "ESP Folder", "Folder")) do
	asset:Destroy()
end

local directory = create("Folder", coreGui, "ESP Folder")

local function espObject(object, color, showHighlight, showText, textToDisplay)
    
    -- This removes any ESP folder that is already linked to the object to avoid unneccessary stacking 
	for _, target in pairs(getChildren(directory, object.Name, "Folder")) do
		if target:FindFirstChild("ESP Highlight") then
			if target["ESP Highlight"].Adornee == object then
				target:Destroy()
			end
		end
	end

    -- The actual ESP creation part
	if object then
		local folder = create("Folder", directory, object.Name)
		local highlight = create("Highlight", folder, "ESP Highlight")
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.FillColor = color or Color3.new(0, 1, 0)
		highlight.OutlineColor = color or Color3.new(0, 1, 0)
		highlight.Adornee = object
		if showHighlight then
			highlight.Enabled = true
		else
			highlight.Enabled = false
		end
		if showText then
			local gui = create("BillboardGui", folder, "ESP Gui")
			gui.Size = UDim2.fromOffset(125, 35)
			gui.Adornee = object
			gui.AlwaysOnTop = true
			local textMain = create("TextLabel", gui, "Main Text")
			textMain.TextScaled = true
			textMain.Text = textToDisplay or object.Name
			textMain.BackgroundTransparency = 1
			textMain.Size = UDim2.fromScale(1, 1)
			textMain.TextColor3 = color or Color3.new(0, 1, 0)
			local textStroke = create("UIStroke", textMain, "Text Outline")
			textStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			textStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
			textStroke.Thickness = 0.05
			textStroke.Color = Color3.new(0, 0, 0)
		end
	end
end

-- By this point, the script (should have) done the following:
-- ► Created an "ESP Folder" directory inside game/CoreGui
-- ► Defined all required functions to create ESP elements
-- ► Have predefined functions: create, getChildren, getDescendants and espObject

-- If one or more of those functions are not working, or the entire script itself is broken, check the Roblox console
-- You can do this by pressing F9 (PC) or by typing /console into the Roblox chat
-- Look for any yellow or red text seemingly related to the script, such as something like "LocalScript:38::Failed to index nil with Name"

-- The getChildren and getDescendants functions are essentially better versions of Instance:GetChildren() and Instance:GetDescendants()
-- The difference being they can be more precise, returning only instances matching the given parameters, rather than every instance in the library

-- An example of getChildren:
-- local allChildren = getChildren(directory, nil, "Folder")

-- Say there were 5 folders inside the directory Instance.
-- As the specificName parameter is nil (does not exist / undefined) and the specificClass is "Folder", the function returns a table of every child Instance that is a folder
-- So the returned table would look something like this:
-- allChildren = {
--    Instance_1,
--    Instance_2,
--    Instance_3,
--    Instance_4,
--    Instance_5
--}

-- To get one of the instances in the table, you simply type the table name, followed by the position of where the desired Instance is in the table
-- So if I wanted Instance_3, I would type allChildren[3]
-- This gets the third Instance in the table
-- Most programming languages start table positions at 0, but Luau starts at 1

-- It's the same with getDescendants, but that get all instances that can be found inside the ancestor, including nested ones (an instance inside another instance)
-- getDescendants can cause performance drops due to it essentially being a deep search, so it advised you do not loop it too much
-- If you need a looping search, I recommend using getChildren, setting the parent parameter to the specific Instance you want to search inside

-- An example of espObject:
-- local object = game.Workspace.Part
-- local espColor = Color3.fromRGB(255, 255, 255)
-- espObject(object, espColor, true, true, "Just a part")

-- This adds a highlight and text to the main directory folder and links them to the object Instance, both of which take on the given color parameter (in this case, white)
-- If no color parameter is provided, the highlight and the text colors will default to green.
-- The given color parameters must be in Color3 format for the function to work
-- To load colors from RGB, Hex or HSV, use Color3.fromRGB(red, green, blue), Color3.fromHex(hexColorCode) or Color3.fromHSV(hue, saturation, volume)
-- Color3.new is basically rgb but on a scale of 0 to 1 for each, 0 being the lowest and 1 being the highest
-- So to get red you'd use Color3.new(1, 0, 0), green you'd use Color3.new(0, 1, 0) and blue you'd use Color3.new(0, 0, 1)
-- To get colors in between, you use decimals
-- Like if I wanted to get dark blue I'd use Color3.new(0, 0, 0.5) or if I wanted pastel pink I'd use Color3.new(1, 0.7, 1)

-- Every line with -- before them are comments, they do not change how the script works (so you do not have to delete these comments if you do not want to)

-- That is all I have to say regarding this script. Have fun making your own ESP scripts using this template.
-- Credit is appreciated, but I'm not going to force it
-- This is just text on a screen, after all

-- Created with care by XT44_Scripts (@XT4472 on Roblox) and AFriendlyExploiter (@AFriendlyExploiter_1 on Discord) ♥
