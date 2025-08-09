-- Instances:

local EspGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextButton_2 = Instance.new("TextButton")

--Properties:

EspGui.Name = "EspGui"
EspGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
EspGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = EspGui
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Draggable = true
Frame.Position = UDim2.new(0.0340236686, 0, 0.459468454, 0)
Frame.Size = UDim2.new(0, 379, 0, 123)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 0.662060738, 0)
TextButton.Size = UDim2.new(0, 378, 0, 41)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Start"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Draggable = true
TextLabel.Size = UDim2.new(0, 342, 0, 79)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Esp Gui Made By Squtrim"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.900226772, 0, -0.00413252646, 0)
TextButton_2.Size = UDim2.new(0, 36, 0, 41)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "X"
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 14.000
TextButton_2.TextWrapped = true

-- Scripts:

local function DraggbleGui() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	frame = script.Parent
	frame.Draggable = true
	frame.Active = true
	frame.Selectable = true
end
coroutine.wrap(DraggbleGui)()
local function EspScript() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Click:Connect(function ()
		-- Toggle highlight and name tag on all players
		local Players = game:GetService("Players")
		local localPlayer = Players.LocalPlayer
	
		-- Function to apply highlight and name tag
		local function highlightCharacter(player)
			if player == localPlayer then return end -- Skip yourself (optional)
	
			player.CharacterAdded:Connect(function(character)
				local head = character:WaitForChild("Head", 10)
				if not head then return end
	
				-- Clean up old visuals if any
				if character:FindFirstChild("PlayerHighlight") then
					character.PlayerHighlight:Destroy()
				end
				if character:FindFirstChild("NameTagGui") then
					character.NameTagGui:Destroy()
				end
	
				-- Create highlight
				local highlight = Instance.new("Highlight")
				highlight.Name = "PlayerHighlight"
				highlight.FillColor = Color3.fromRGB(255, 255, 0)
				highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
				highlight.FillTransparency = 0.5
				highlight.OutlineTransparency = 0
				highlight.Adornee = character
				highlight.Parent = character
	
				-- Create name tag
				local billboard = Instance.new("BillboardGui")
				billboard.Name = "NameTagGui"
				billboard.Adornee = head
				billboard.Size = UDim2.new(0, 200, 0, 50)
				billboard.StudsOffset = Vector3.new(0, 3, 0)
				billboard.AlwaysOnTop = true
				billboard.Parent = character
	
				local nameLabel = Instance.new("TextLabel")
				nameLabel.Size = UDim2.new(1, 0, 1, 0)
				nameLabel.BackgroundTransparency = 1
				nameLabel.Text = player.DisplayName
				nameLabel.TextColor3 = Color3.new(1, 1, 1)
				nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
				nameLabel.TextStrokeTransparency = 0
				nameLabel.TextScaled = true
				nameLabel.Font = Enum.Font.LuckiestGuy
				nameLabel.Parent = billboard
			end)
	
			-- Apply visuals immediately if the character already exists
			if player.Character then
				task.defer(function()
					local character = player.Character
					local head = character:FindFirstChild("Head")
					if not head then return end
	
					if character:FindFirstChild("PlayerHighlight") then
						character.PlayerHighlight:Destroy()
					end
					if character:FindFirstChild("NameTagGui") then
						character.NameTagGui:Destroy()
					end
	
					local highlight = Instance.new("Highlight")
					highlight.Name = "PlayerHighlight"
					highlight.FillColor = Color3.fromRGB(255, 255, 0)
					highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
					highlight.FillTransparency = 0.5
					highlight.OutlineTransparency = 0
					highlight.Adornee = character
					highlight.Parent = character
	
					local billboard = Instance.new("BillboardGui")
					billboard.Name = "NameTagGui"
					billboard.Adornee = head
					billboard.Size = UDim2.new(0, 200, 0, 50)
					billboard.StudsOffset = Vector3.new(0, 3, 0)
					billboard.AlwaysOnTop = true
					billboard.Parent = character
	
					local nameLabel = Instance.new("TextLabel")
					nameLabel.Size = UDim2.new(1, 0, 1, 0)
					nameLabel.BackgroundTransparency = 1
					nameLabel.Text = player.DisplayName
					nameLabel.TextColor3 = Color3.new(0, 0, 0)
					nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
					nameLabel.TextStrokeTransparency = 0
					nameLabel.TextScaled = true
					nameLabel.Font = Enum.Font.LuckiestGuy
					nameLabel.Parent = billboard
				end)
			end
		end
	
		-- Apply visuals to all current players
		for _, player in ipairs(Players:GetPlayers()) do
			highlightCharacter(player)
		end
	
		-- Apply to new players
		Players.PlayerAdded:Connect(highlightCharacter)
	end)
	
end
coroutine.wrap(EspScript)()
local function close() -- TextButton_2.LocalScript 
	local script = Instance.new('LocalScript', TextButton_2)

	script.Parent.MouseButton1Click:Connect(function ()
		script.Parent.Parent.Visible = false
	end)
end
coroutine.wrap(close)()
