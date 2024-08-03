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
	Icon = "rbxassetid://4483345998",
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

local Tab1 = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab1:AddSection({
	Name = "Player Mod"
})
--walk speed//////
Tab1:AddSlider({
    Name = "Walk Speed",
    Min = 0,
    Max = 100,
    Default = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Set Value",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
        
        -- Optional: Print the current walk speed
        print(Value .. " Set Value")
    end
})
------/////Anti Slipped ---

Tab1:AddToggle({
    Name = "Anti Slipped",
    Default = false,
    Callback = function(enabled)
        print(enabled)

        local function setAntiSlippery()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()

            while enabled do
                -- Update friction for all parts
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5) -- Higher friction values
                    end
                end
                wait(0.1) -- Adjust the wait time as needed to balance performance and responsiveness
            end
        end

        if enabled then
            spawn(setAntiSlippery)
        else
            -- Reset friction to default values
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CustomPhysicalProperties = PhysicalProperties.new(0.5, 0.3, 0.5) -- Default friction values
                end
            end
        end
    end
})

------remove hitbox////////-----
Tab1:AddButton({
	Name = "Remove Hitbox",
	Callback = function()
	OrionLib:MakeNotification({
	Name = "Notification",
	Content = "Click Remove Hitbox2 if doesn't work",
	Image = "rbxassetid://18594014746",
	Time = 10
})

wait(0.1)
      		local LocalPlayer = game.Players.LocalPlayer
	local Character = LocalPlayer.Character

	for destructionIteration = 1, 100 do wait()
		pcall(function()
			Character:WaitForChild("CollisionPart"):Destroy()
			print("No More Hitbox")
		end)
	end

	LocalPlayer.CharacterAdded:Connect(function(Character)
		for destructionIteration = 1, 100 do wait()
			pcall(function()
				Character:WaitForChild("CollisionPart"):Destroy()
				print("No More Hitbox")
			end)
		end
	end)
  	end    
})

Tab1:AddButton({
	Name = "Remove Hitbox v2",
	Callback = function()
	OrionLib:MakeNotification({
	Name = "Notification",
	Content = "Execute Every Round",
	Image = "rbxassetid://18594014746",
	Time = 10
})

wait(0.1)
      		local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local function removeCollisionPart(character)
    for destructionIteration = 1, 100 do
        wait()
        pcall(function()
            character:WaitForChild("CollisionPart"):Destroy()
            print("No More Hitbox")
        end)
    end
end

removeCollisionPart(Character)

LocalPlayer.CharacterAdded:Connect(function(character)
    removeCollisionPart(character)
end)
  	end    
})

Tab1:AddButton({
	Name = "Remove MeteorShower",
	Callback = function()
	OrionLib:MakeNotification({
	Name = "Notification",
	Content = "idk if this work or not",
	Image = "rbxassetid://18594014746",
	Time = 10
})

wait(0.1)
      		-- Assuming you have a main script that handles events in your game

local function removeMeteorShower()
    -- Check if the meteor shower function or event exists and remove it
    if game:FindFirstChild("MeteorShower") then
        game.MeteorShower:Destroy()
    end

    -- If it's part of another script, find and remove it from that script
    for _, script in ipairs(game:GetDescendants()) do
        if script:IsA("Script") or script:IsA("LocalScript") then
            local source = script.Source
            if string.find(source, "MeteorShower") then
                local newSource = string.gsub(source, "MeteorShower", "")
                script.Source = newSource
            end
        end
    end
end

-- Call the function to remove the meteor shower event
removeMeteorShower()
  	end    
})

----------------///////////------
local Section = Tab1:AddSection({
	Name = "Auto Mod"
})

local autofarmEnabled = false

local function autofarmCoins()
    local visitedCoins = {}
    while autofarmEnabled do
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        for _, part in pairs(game.Workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Size == Vector3.new(0.5, 2.5, 2.5) and part.Name == "PP" and not visitedCoins[part] then
                visitedCoins[part] = true
                character:MoveTo(part.Position)
                wait(0) -- Add a delay to allow the coin to be picked up
                break -- Exit the loop to avoid multiple teleports at once
            end
        end
        wait(0) -- Adjust the wait time as needed
    end
end

Tab1:AddToggle({
    Name = "Autofarm Coins",
    Default = false,
    Callback = function(Value)
        autofarmEnabled = Value
        if autofarmEnabled then
            spawn(autofarmCoins)
        end
    end    
})


------- auto return--//////////
Tab1:AddButton({
	Name = "Auto return Player",
	Callback = function()
	OrionLib:MakeNotification({
	Name = "Notification",
	Content = "Execute This Every Round",
	Image = "rbxassetid://18594014746",
	Time = 10
})

wait(0.1)
      		local LocalPlayer = game.Players.LocalPlayer
    local Character = LocalPlayer.Character

    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if LocalPlayer.Backpack:FindFirstChild("Bomb") then
                print("backpack bomb")
                LocalPlayer.Backpack:FindFirstChild("Bomb").Parent = Character
            else
                print("no backpack bomb")
            end
            if LocalPlayer.Character:FindFirstChild("Bomb") then
                print("character bomb")
                local BombEvent = LocalPlayer.Character:FindFirstChild("Bomb"):FindFirstChild("RemoteEvent")
                for _,Player in next, game.Players:GetPlayers() do
                    if Player ~= LocalPlayer then
                        if Player.Character and Player.Character.Parent == workspace then
                            warn("Hitting" .. Player.Name)
                            local LastPlace = Character.HumanoidRootPart.CFrame
                            for i=1,50 do
                                Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame
                            end
                            wait(0.1)
                            BombEvent:FireServer(Player.Character, Player.Character:FindFirstChild("CollisionPart"))
                            wait()
                            Character.HumanoidRootPart.CFrame = LastPlace
                            break;
                        end 
                    end
                end
            else
                print("No character bomb")
            end
        end)
    end)
  	end    
})

Tab1:AddButton({
	Name = "Auto Pass Closest Player",
	Callback = function()
	OrionLib:MakeNotification({
	Name = "Notification",
	Content = "Execute This Every Round",
	Image = "rbxassetid://18594014746",
	Time = 10
})

wait(0.1)
      		local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character

game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        if LocalPlayer.Backpack:FindFirstChild("Bomb") then
            print("backpack bomb")
            LocalPlayer.Backpack:FindFirstChild("Bomb").Parent = Character
        else
            print("no backpack bomb")
        end

        if LocalPlayer.Character:FindFirstChild("Bomb") then
            print("character bomb")
            local BombEvent = LocalPlayer.Character:FindFirstChild("Bomb"):FindFirstChild("RemoteEvent")

            -- Find the closest player
            local closestPlayer = nil
            local closestDistance = math.huge
            for _, Player in next, game.Players:GetPlayers() do
                if Player ~= LocalPlayer and Player.Character and Player.Character.Parent == workspace then
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = Player
                    end
                end
            end

            -- Auto-pass the closest player
            if closestPlayer then
                warn("Hitting ".. closestPlayer.Name)
                local LastPlace = Character.HumanoidRootPart.CFrame
                for i = 1, 50 do
                    Character.HumanoidRootPart.CFrame = closestPlayer.Character.HumanoidRootPart.CFrame
                end
                wait(0.1)
                BombEvent:FireServer(closestPlayer.Character, closestPlayer.Character:FindFirstChild("CollisionPart"))
                wait()
                Character.HumanoidRootPart.CFrame = LastPlace
            end
        else
            print("No character bomb")
        end
    end)
end)
  	end    
})



---command-----///////
local CommandTab = Window:MakeTab({
	Name = "Cmds",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = CommandTab:AddSection({
	Name = "Cmds Mode"
})

CommandTab:AddButton({
	Name = "Infinity Yield",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
  	end    
})

--Tab end
---------------------------------------------
OrionLib:Init() --UI Lib End
