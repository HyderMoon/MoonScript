-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local ScrollingFrame = Instance.new("ScrollingFrame")
local FramePlayer = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Fly = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
Fly.MouseButton1Down:connect(function()
	FLYING = false
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1
function sFLY(vfly)
	repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChild('Humanoid')
	repeat wait() until IYMouse
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local T = getRoot(Players.LocalPlayer.Character)
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat wait()
				if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
	flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end

function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end
local NoClip = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Player = Instance.new("TextLabel")
local InfJump = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local WaterWalk = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local LavaWalk = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local MoonScript = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")
local FrameTeleport = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local Teleport = Instance.new("TextLabel")
local TeleportLocations = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ScrollingFrame.Parent = ScreenGui
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
ScrollingFrame.BorderColor3 = Color3.fromRGB(63, 63, 63)
ScrollingFrame.BorderSizePixel = 3
ScrollingFrame.Position = UDim2.new(0.239084616, 0, 0.154898569, 0)
ScrollingFrame.Size = UDim2.new(0, 571, 0, 327)

FramePlayer.Name = "FramePlayer"
FramePlayer.Parent = ScrollingFrame
FramePlayer.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
FramePlayer.Position = UDim2.new(0.064798601, 0, 0.0640348494, 0)
FramePlayer.Size = UDim2.new(0, 497, 0, 209)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = FramePlayer

Fly.Name = "Fly"
Fly.Parent = FramePlayer
Fly.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
Fly.Position = UDim2.new(0.0230295341, 0, 0.196045801, 0)
Fly.Size = UDim2.new(0, 475, 0, 23)
Fly.Font = Enum.Font.GothamBlack
Fly.Text = "  Fly (R)"
Fly.TextColor3 = Color3.fromRGB(255, 255, 255)
Fly.TextSize = 14.000
Fly.TextXAlignment = Enum.TextXAlignment.Left

UICorner_2.Parent = Fly

NoClip.Name = "NoClip"
NoClip.Parent = FramePlayer
NoClip.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
NoClip.Position = UDim2.new(0.023, 0, 0.335000008, 0)
NoClip.Size = UDim2.new(0, 475, 0, 23)
NoClip.Font = Enum.Font.GothamBlack
NoClip.Text = "  NoClip (E)"
NoClip.TextColor3 = Color3.fromRGB(255, 255, 255)
NoClip.TextSize = 14.000
NoClip.TextXAlignment = Enum.TextXAlignment.Left

UICorner_3.Parent = NoClip

Player.Name = "Player"
Player.Parent = FramePlayer
Player.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Player.BorderColor3 = Color3.fromRGB(52, 52, 52)
Player.Position = UDim2.new(0.0237982683, 0, 0.0471543521, 0)
Player.Size = UDim2.new(0, 83, 0, 19)
Player.Font = Enum.Font.GothamBlack
Player.Text = "Player"
Player.TextColor3 = Color3.fromRGB(255, 255, 255)
Player.TextSize = 14.000
Player.TextXAlignment = Enum.TextXAlignment.Left

InfJump.Name = "InfJump"
InfJump.Parent = FramePlayer
InfJump.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
InfJump.Position = UDim2.new(0.023, 0, 0.474000007, 0)
InfJump.Size = UDim2.new(0, 475, 0, 23)
InfJump.Font = Enum.Font.GothamBlack
InfJump.Text = "  InfJump"
InfJump.TextColor3 = Color3.fromRGB(255, 255, 255)
InfJump.TextSize = 14.000
InfJump.TextXAlignment = Enum.TextXAlignment.Left

UICorner_4.Parent = InfJump

WaterWalk.Name = "WaterWalk"
WaterWalk.Parent = FramePlayer
WaterWalk.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
WaterWalk.Position = UDim2.new(0.023, 0, 0.612999976, 0)
WaterWalk.Size = UDim2.new(0, 475, 0, 23)
WaterWalk.Font = Enum.Font.GothamBlack
WaterWalk.Text = "  WaterWalk"
WaterWalk.TextColor3 = Color3.fromRGB(255, 255, 255)
WaterWalk.TextSize = 14.000
WaterWalk.TextXAlignment = Enum.TextXAlignment.Left

UICorner_5.Parent = WaterWalk

LavaWalk.Name = "LavaWalk"
LavaWalk.Parent = FramePlayer
LavaWalk.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
LavaWalk.Position = UDim2.new(0.023, 0, 0.753000021, 0)
LavaWalk.Size = UDim2.new(0, 475, 0, 23)
LavaWalk.Font = Enum.Font.GothamBlack
LavaWalk.Text = "  LavaWalk"
LavaWalk.TextColor3 = Color3.fromRGB(255, 255, 255)
LavaWalk.TextSize = 14.000
LavaWalk.TextXAlignment = Enum.TextXAlignment.Left

UICorner_6.Parent = LavaWalk

MoonScript.Name = "MoonScript"
MoonScript.Parent = ScrollingFrame
MoonScript.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MoonScript.Position = UDim2.new(0.0847264156, 0, 0.0104878545, 0)
MoonScript.Size = UDim2.new(0, 476, 0, 41)
MoonScript.Font = Enum.Font.GothamBlack
MoonScript.Text = "🌑 MoonScript 🌑"
MoonScript.TextColor3 = Color3.fromRGB(255, 255, 255)
MoonScript.TextSize = 14.000

UICorner_7.Parent = MoonScript

FrameTeleport.Name = "FrameTeleport"
FrameTeleport.Parent = ScrollingFrame
FrameTeleport.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
FrameTeleport.Position = UDim2.new(0.064798601, 0, 0.273058802, 0)
FrameTeleport.Size = UDim2.new(0, 497, 0, 209)

UICorner_8.CornerRadius = UDim.new(0, 10)
UICorner_8.Parent = FrameTeleport

Teleport.Name = "Teleport"
Teleport.Parent = FrameTeleport
Teleport.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Teleport.BorderColor3 = Color3.fromRGB(52, 52, 52)
Teleport.Position = UDim2.new(0.0237982683, 0, 0.0471543521, 0)
Teleport.Size = UDim2.new(0, 83, 0, 19)
Teleport.Font = Enum.Font.GothamBlack
Teleport.Text = "Teleport"
Teleport.TextColor3 = Color3.fromRGB(255, 255, 255)
Teleport.TextSize = 14.000
Teleport.TextXAlignment = Enum.TextXAlignment.Left

TeleportLocations.Name = "Teleport Locations"
TeleportLocations.Parent = FrameTeleport
TeleportLocations.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
TeleportLocations.Position = UDim2.new(0.023, 0, 0.195999995, 0)
TeleportLocations.Size = UDim2.new(0, 475, 0, 23)
TeleportLocations.Font = Enum.Font.GothamBlack
TeleportLocations.Text = "  Locations"
TeleportLocations.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportLocations.TextSize = 14.000
TeleportLocations.TextXAlignment = Enum.TextXAlignment.Left

UICorner_9.Parent = TeleportLocations

-- Scripts:

local function BBWH_fake_script() -- ScrollingFrame.LocalScriptMoverJanela 
	local script = Instance.new('LocalScript', ScrollingFrame)

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end
coroutine.wrap(BBWH_fake_script)()
