-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Draggable = true
Frame.Position = UDim2.new(0.0118343197, 0, 0.0807309002, 0)
Frame.Size = UDim2.new(0, 488, 0, 233)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 0.605150223, 0)
TextButton.Size = UDim2.new(0, 488, 0, 90)
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
TextLabel.Position = UDim2.new(0.00204918021, 0, -0.00858369097, 0)
TextLabel.Size = UDim2.new(0, 464, 0, 143)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Inf Health Gui Made By Squtrim"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

-- Scripts:

local function InfHeal() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Click:Connect(function (hit , player)
		-- Wait for the player and humanoid to load
		local player = game.Players.LocalPlayer
		repeat task.wait() until player.Character
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	
		-- Function to enable true immortality
		local function enableImmortality()
			if not humanoid then return end
	
			-- Set health to max
			humanoid.MaxHealth = math.huge
			humanoid.Health = math.huge
	
			-- Block damage changes from the server
			local oldHealth = humanoid.Health
			humanoid:GetPropertyChangedSignal("Health"):Connect(function()
				if humanoid.Health < oldHealth then
					humanoid.Health = oldHealth -- Revert health instantly
				else
					oldHealth = humanoid.Health -- Allow natural healing
				end
			end)
	
			
		end
	
		-- Apply immortality when character spawns
		player.CharacterAdded:Connect(function(char)
			character = char
			humanoid = char:FindFirstChildWhichIsA("Humanoid")
			enableImmortality()
		end)
	
		-- Initial immortality activation
		enableImmortality()
		
	
	end)
end
coroutine.wrap(InfHeal)()
