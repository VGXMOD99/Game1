local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local Toggle = Instance.new("ImageButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Start with red (off)
Toggle.Position = UDim2.new(0, 120, 0, 30)
Toggle.Size = UDim2.new(0, 50, 0, 50)  -- Smaller size for a compact circular button
Toggle.Image = "rbxassetid://18594014746"  -- Your asset ID
Toggle.ScaleType = Enum.ScaleType.Fit

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0.5, 0)  -- Make the button circular
Corner.Parent = Toggle

local isOn = false  -- Initial state is off

-- Function to handle the "On" state
local function onButtonClicked()
-- Add your code for what should happen when the button is in the "On" state
if gethui():FindFirstChild("Orion") then
gethui().Orion.Enabled = not gethui().Orion.Enabled
end
end

-- Function to handle the "Off" state
local function offButtonClicked()
-- Add your code for what should happen when the button is in the "Off" state
if gethui():FindFirstChild("Orion") then
gethui().Orion.Enabled = not gethui().Orion.Enabled
end
end

Toggle.MouseButton1Click:Connect(function()
isOn = not isOn  -- Toggle state
if isOn then
Toggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Green (on)
onButtonClicked()  -- Call the function for "On" state
else
Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red (off)
offButtonClicked()  -- Call the function for "Off" state
end
end)

-- Destroy script when UI is destroyed
ScreenGui.Destroying:Connect(function()
script:Destroy()
end)

--Lib here----------------------
wait(0.1)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/VGXMOD99/Library-Ui/main/Orion%20Lib%20Transparent%20.lua')))()
--Notification
OrionLib:MakeNotification({
	Name = "Vgxmod Hub",
	Content = "Made by Kiyoshi",
	Image = "rbxassetid://18594014746",
	Time = 5
})

local Window = OrionLib:MakeWindow({Name = "Vgxmod", HidePremium = false, IntroText = "Vgxmod", SaveConfig = true, ConfigFolder = "Vgxmod"})

--Home Tab-----------------------------------------------

local HomeTab = Window:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://18594014746",
	PremiumOnly = false
})

local PlayerSection = HomeTab:AddSection({
	Name = "Owner: Kiyoshi"
})

local PlayerSection = HomeTab:AddSection({
	Name = "Team: Vgxmod"
})

local PlayerSection = HomeTab:AddSection({
	Name = "Discord: https://discord.com/invite/n9gtmefsjc"
})

HomeTab:AddButton({
	Name = "Copy Link Discord",
	Callback = function()
	OrionLib:MakeNotification({
	Name = "Discord Link Copied",
	Content = "Join Now",
	Image = "rbxassetid://18594014746",
	Time = 5
})

wait(0.1)
        setclipboard("https://discord.com/invite/n9gtmefsjc")
  	end    
})

local SettingsSection = HomeTab:AddSection({
	Name = "Settings"
})

SettingsSection:AddButton({
	Name = "Destroy UI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})

HomeTab:AddColorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print(Value)
	end	  
})

--Settings End-----------------------------------------------
--Do not replace-----------------------------------------------

---((((((((()))))))))))--

local Tab0 = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab0:AddSection({
	Name = "Coin"
})

Tab0:AddButton({
	Name = "Instant Coins",
	Callback = function()
      		-- Client-side script (LocalScript)
local humanoid = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
local creditsModel = game.Workspace:WaitForChild("GameObjects")

-- Store the humanoid's original position
local originalPosition = humanoid.RootPart.CFrame

-- Teleport to each credit
local parts = creditsModel:GetDescendants()
for _, part in ipairs(parts) do
    if part:IsA("BasePart") then
        humanoid.RootPart.CFrame = part.CFrame
        wait() -- Adjust the wait duration if needed
    end
end

-- Teleport back to the original position
humanoid.RootPart.CFrame = originalPosition
  	end    
})

Tab0:AddButton({
	Name = "Tp Lobby",
	Callback = function()
      		local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local teleportPosition = Vector3.new(330, 158, -33)

local function teleportToPosition(position)
    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position)
end

teleportToPosition(teleportPosition)
  	end    
})

Tab0:AddButton({
	Name = "Tp All Player",
	Callback = function()
      		local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to teleport to a player
local function teleportToPlayer(player)
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position)
        end
    end
end

-- Teleport to each player in the game
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        teleportToPlayer(player)
        wait(0.01) -- Adjust this delay as needed to control the teleport speed
    end
end
  	end    
})

Tab0:AddButton({
	Name = "Esp",
	Callback = function()
      		local gui = Instance.new("BillboardGui");
gui.Name = "";
gui.AlwaysOnTop = true;
gui.LightInfluence = 0;
gui.Size = UDim2.new(1.75, 0, 1.75, 0);
local frame = Instance.new("Frame", gui);
frame.BackgroundColor3 = Color3.fromRGB(170, 0, 0);
frame.Size = UDim2.new(1, 0, 1, 0);
frame.BorderSizePixel = 4;
frame.BorderColor3 = Color3.fromRGB(0, 0, 0);
local gi = gui:Clone();
local body = frame:Clone();
body.Parent = gi;
body.BackgroundColor3 = Color3.fromRGB(0, 170, 170);
 
for _, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= game:GetService("Players").LocalPlayer.Name and v.Character and v.Character:FindFirstChild("Head") then
        gui:Clone().Parent = v.Character.Head;
    end
end
  	end    
})

---((((((((()))))))))))--

local Tab0 = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab0:AddSection({
	Name = "Player Mode"
})

Tab0:AddSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 100,
    Default = 16,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Set Walk Speed",
    Callback = function(Speed)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Speed
        end
    end    
})
 
Tab0:AddSlider({
    Name = "Jump Power",
    Min = 50,
    Max = 200,
    Default = 50,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Set Jump Power",
    Flag = "Slider1", 
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)     
    end    
})

local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

-- Integrate the noclip function into the toggle
Tab0:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(Value)
		if Value then
			noclip()
		else
			clip()
		end
	end    
})

---((((((((()))))))))))--

local Tab0 = Window:MakeTab({
	Name = "Other",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
--Section--
local Section = Tab0:AddSection({
	Name = "Gui Section"
})
--Button--
Tab0:AddButton({
	Name = "Fly Gui",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/Liz6YJUN"))()
  	end    
})

Tab0:AddButton({
	Name = "TpTool",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/QNPYBsyv"))()
  	end    
})

---((((((((()))))))))))--














--Tab end
---------------------------------------------
OrionLib:Init() --UI Lib End
