-- Instances:

local Fly = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextButton_2 = Instance.new("TextButton")

--Properties:

Fly.Name = "Fly"
Fly.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Fly.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Fly
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Draggable = true
Frame.Position = UDim2.new(0.149408281, 0, 0.385714293, 0)
Frame.Size = UDim2.new(0, 379, 0, 123)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 0.666666687, 0)
TextButton.Size = UDim2.new(0, 378, 0, 41)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Double Jump to Fly"
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
TextLabel.Position = UDim2.new(-0.000589254953, 0, -0.000453545799, 0)
TextLabel.Size = UDim2.new(0, 342, 0, 79)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Fly Gui Made By Squtrim"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.902374804, 0, -0.008130081, 0)
TextButton_2.Size = UDim2.new(0, 36, 0, 41)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "X"
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 14.000
TextButton_2.TextWrapped = true

-- Module Scripts:

local fake_module_scripts = {}

do -- TextButton.fly
	local script = Instance.new('ModuleScript', TextButton)
	script.Name = "fly"
	local function module_script()
		--[[
			By: Jersito4
			Date April 8th 2022
			
			Description:
				This script allows players to fly by double jumping, when you press jump when already flying you will stop flying.
				This script will work on any device and any character
			
			Instructions:
				Place this script in the StarterCharacterScripts folder.
				you can rename this script to anything you like.
				You can change the settings for the flying below.
				
				--Animations
				Under this script in the file explorer are 2 animations (Fly Forward and Fly idle, the ones with the blue square).
				Right click on these animations and select "Save To Roblox" then save them to your account or to your group depending on where you uploaded your game. (It must be uploaded to the same place or it wont work)
				When you finish uploading it gives you a link, copy that link and paste it in the setting below.
				
				If you want to make your own custom animations you have to turn the flying forward animation back 90 degrees because the model is turned 90 degrees forward when flying.
		]]
		
		local module = {
			
			--Main Settings
			Speed = 100, --Default 100
			
			WhiteList = {}, --Only allow some people to fly, if you leave this empty everyone will be able to fly.  -- Example: {17258879, 178439272, 57328573} The numbers are the player's User Id
			
			--Animations
			FlyForward = "rbxassetid://5097980031", --Animation Id Here! Example: "rbxassetid://5097981477"
			FlyIdle = "rbxassetid://5097981477" --Animation Id Here!
		}
		
		return module
	end
	fake_module_scripts[script] = module_script
end


-- Scripts:

local function nonsense() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)
	local req = require
	local require = function(obj)
		local fake = fake_module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end

	script.Parent.MouseButton1Click:Connect(function ()
		local module = script.Parent.fly
		print("Made By Squtrim!!!")
		local LS = script.Parent.Flying
		LS.Parent = module
		
	end)
	
end
coroutine.wrap(nonsense)()
local function FlyScript() -- TextButton.Flying 
	local script = Instance.new('LocalScript', TextButton)
	local req = require
	local require = function(obj)
		local fake = fake_module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end

	local player = game.Players.LocalPlayer
	local settings = require(script.Parent.fly)
	
	if #settings.WhiteList > 0 then --There is a whitelist
		local canFly = false
		for _,id in pairs(settings.WhiteList) do
			if id == player.UserId then
				canFly = true
				break
			end
		end
		if canFly == false then
			return
		end
	end
	
	local char = player.Character or player.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")
	
	local cam = workspace.CurrentCamera
	local uis = game:GetService("UserInputService")
	
	local anim = Instance.new("Animation", script)
	anim.AnimationId = settings.FlyIdle
	local idleAnim = char:WaitForChild("Humanoid"):LoadAnimation(anim)
	
	local anim = Instance.new("Animation", script)
	anim.AnimationId = settings.FlyForward
	local forwardAnim = char:WaitForChild("Humanoid"):LoadAnimation(anim)
	
	local flightForce
	
	
	--//Toggle Flying
	local flying = false
	local function ToggleFlying()
		if not flying and hum.FloorMaterial == Enum.Material.Air then --Is double jumping - Start flying
			flying = true
	
			char.Animate.Disabled = true
			idleAnim:Play()
	
			if flightForce ~= nil then flightForce:Destroy() end
			flightForce = Instance.new("BodyVelocity", char.PrimaryPart)
			flightForce.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			flightForce.Velocity = hum.MoveDirection*settings.Speed
	
			while flying do
				hum:ChangeState("Swimming") --This lets us see the move direction in 3 dimensions
				hum:SetStateEnabled('GettingUp',false) --Prevents the character movement from glitching while flying
	
				flightForce.Velocity = hum.MoveDirection*settings.Speed
	
				if hum.MoveDirection ~= Vector3.new() then --Player is moving
					if not forwardAnim.IsPlaying then
						idleAnim:Stop()
						forwardAnim:Play()
					end
				else -- Player not moving
					if forwardAnim.IsPlaying then
						forwardAnim:Stop()
						idleAnim:Play()
					end
				end
				wait()
			end
			
			--Stopped flying
			flightForce:Destroy()
			hum:SetStateEnabled('GettingUp',true)
			char.Animate.Disabled = false
			idleAnim:Stop()
			forwardAnim:Stop()
		elseif flying then --Stop flying
			flying = false
		end
	end
	
	--//Input
	--PC/Xbox
	uis.InputBegan:Connect(function(key, processed)
		if key.KeyCode == Enum.KeyCode.Space or key.KeyCode == Enum.KeyCode.ButtonA then
			ToggleFlying()
		end
	end)
	
	--Mobile
	local jumpButton
	if uis.TouchEnabled then
		pcall(function()
			jumpButton = player:WaitForChild("PlayerGui"):WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")
		end)
	end
	if jumpButton ~= nil then
		jumpButton.MouseButton1Down:Connect(ToggleFlying)
	end
end
coroutine.wrap(FlyScript)()
local function close() -- TextButton_2.LocalScript 
	local script = Instance.new('LocalScript', TextButton_2)
	local req = require
	local require = function(obj)
		local fake = fake_module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end

	script.Parent.MouseButton1Click:Connect(function ()
		script.Parent.Parent.Visible = false
	end)
end
coroutine.wrap(close)()
local function DraggbleGui() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)
	local req = require
	local require = function(obj)
		local fake = fake_module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end

	frame = script.Parent
	frame.Draggable = true
	frame.Active = true
	frame.Selectable = true
end
coroutine.wrap(DraggbleGui)()
