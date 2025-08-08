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
Frame.Position = UDim2.new(0.035009861, 0, 0.719601333, 0)
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
TextLabel.Size = UDim2.new(0, 486, 0, 143)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Lag Gui Made By Squtrim"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

-- Scripts:

local function Lag() -- TextButton.LocalScript 
	while true do
		wait()
		local Part = Instance.new("Part")
		Part.Parent = workspace
		Part:Clone()
	end	
end
coroutine.wrap(Lag)()

-- credits aabbaaii13/14 for Fps Counter
if not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("TopbarStandard") then
local screengui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local frame3 = Instance.new("Frame", screengui)
local frame2 = Instance.new("Frame", frame3)
local frame = Instance.new("Frame", frame2)
local uilistlayout = Instance.new("UIListLayout", frame2)
local textlabel = Instance.new("TextLabel", frame)
local uicorner = Instance.new("UICorner", frame)
screengui.ResetOnSpawn = false
screengui.ScreenInsets = "TopbarSafeInsets"

frame3.Size = UDim2.new(1, 0, 1, -2)
frame3.Position = UDim2.new(0, 0, 0, 0)
frame3.BackgroundTransparency = 1

frame2.Size = UDim2.new(1, -24, 1, 0)
frame2.Position = UDim2.new(0, 12, 0, 0)
frame2.BackgroundTransparency = 1

uilistlayout.Padding = UDim.new(0, 12)
uilistlayout.FillDirection = Enum.FillDirection.Horizontal
uilistlayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
uilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
uilistlayout.VerticalAlignment = Enum.VerticalAlignment.Bottom

frame.Size = UDim2.new(0, 44, 0, 44)
frame.Position = UDim2.new(0.85, 0, 0, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.3

textlabel.Size = UDim2.new(1, 0, 1, 0)
textlabel.BackgroundTransparency = 1
textlabel.TextColor3 = Color3.new(1, 1, 1)
textlabel.Text = "FPS: 0"
textlabel.TextSize = 12
textlabel.Font = Enum.Font.GothamBold

uicorner.CornerRadius = UDim.new(1, 0)

local n = 0
local o = 0

game:GetService("RunService").RenderStepped:Connect(function(q)
    n += 1
    o += q
    if o >= 1 then
        local r = n / o
        textlabel.Text = string.format("FPS: %.0f", r)
        n = 0
        o = 0
    end
end)
end



local screengui = game:GetService("Players").LocalPlayer.PlayerGui.TopbarStandard.Holders.Left
local frame = Instance.new("Frame", screengui)
local textlabel = Instance.new("TextLabel", frame)
local uicorner = Instance.new("UICorner", frame)

frame.Name = "Widget"
frame.Size = UDim2.new(0, 44, 0, 44)
frame.Position = UDim2.new(0.85, 0, 0, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.3

textlabel.Size = UDim2.new(1, 0, 1, 0)
textlabel.BackgroundTransparency = 1
textlabel.TextColor3 = Color3.new(1, 1, 1)
textlabel.Text = "FPS: 0"
textlabel.TextSize = 12
textlabel.Font = Enum.Font.GothamBold

uicorner.CornerRadius = UDim.new(1, 0)

local n = 0
local o = 0

game:GetService("RunService").RenderStepped:Connect(function(q)
    n += 1
    o += q
    if o >= 1 then
        local r = n / o
        textlabel.Text = string.format("FPS: %.0f", r)
        n = 0
        o = 0
    end
end)
