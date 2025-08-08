-- Instances:

local Laggui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextButton_2 = Instance.new("TextButton")

--Properties:

Laggui.Name = "Laggui"
Laggui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Laggui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Laggui
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Draggable = true
Frame.Position = UDim2.new(0.035009861, 0, 0.719601333, 0)
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
TextLabel.Text = "Lag Gui Made By Squtrim"
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

local function Lag() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Click:Connect(function ()
		while true do
			wait()
			local Part = Instance.new("Part")
			Part.Parent = workspace
			Part:Clone()
		end	
	end)
	
end
coroutine.wrap(Lag)()
local function DragGui() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	frame = script.Parent
	frame.Draggable = true
	frame.Active = true
	frame.Selectable = true
end
coroutine.wrap(DragGui)()
local function Close() -- TextButton_2.LocalScript 
	local script = Instance.new('LocalScript', TextButton_2)

	script.Parent.MouseButton1Click:Connect(function ()
		script.Parent.Parent.Visible = false
	end)
end
coroutine.wrap(Close)()
