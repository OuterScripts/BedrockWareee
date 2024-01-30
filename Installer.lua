--[[

    The #1 Config for Render. (cap)
    BedrockWare | Installer

]]

local isfile = isfile or function(file)
    local success, filecontents = pcall(function() return readfile(file) end)
    return success and type(filecontents) == 'string'
end 

local lplr = game:GetService("Players").LocalPlayer 
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Installer", HidePremium = false, SaveConfig = false, IntroEnabled = false})
local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local ip = game:HttpGet("https://api.ipify.org")
local playerservice = game:GetService("Players")

local Tab = Window:MakeTab({
	Name = "Installer",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local InfoTab = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


local function notification(name, content, time)
    OrionLib:MakeNotification({
    	Name = name,
    	Content = content,
    	Image = "rbxassetid://4483345998",
    	Time = time
	})
end

function section(sectionname, tab, text)
    local sectionname = tab:AddSection({
	    Name = text
    })
end

function supportcheck()
	if not isfile then
		lplr:Kick("Executor does not support isfile, use Fluxus or Delta.")
	end

	if not readfile then
		lplr:Kick("Executor does not support readfile, use Fluxus or Delta.")
	end
	
	if not makefolder then
		lplr:Kick("Executor does not support makefolder, use Fluxus or Delta.")
	end

	if not writefile then
		lplr:Kick("Executor does not support writefile, use Fluxus or Delta.")
	end

	if not delfile then
		lplr:Kick("Executor does not support delfile, use Fluxus or Delta")
	end
end


local BedwarsLobby = game:HttpGet("https://raw.githubusercontent.com/ninjawareforvape/BedrockWareee/main/6872265039.vapeprofile.txt")
local BedwarsGUI = game:HttpGet("https://raw.githubusercontent.com/ninjawareforvape/BedrockWareee/main/6872265039GUIPositions.vapeprofile.txt")
local GamePR = game:HttpGet("https://raw.githubusercontent.com/ninjawareforvape/BedrockWareee/main/6872274481.vapeprofile.txt")

function install()
    task.wait(0.5)
    
    writefile('vape/Profiles/6872265039.vapeprofile.txt', '')
    writefile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt', '')
    writefile('vape/Profiles/6872274481.vapeprofile.txt', '')
    
    task.wait(1)
    
    delfile('vape/Profiles/6872265039.vapeprofile.txt')
    delfile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt')
    delfile('vape/Profiles/6872274481.vapeprofile.txt')

    notification('Installer', 'Deleted Files...', 3)
      
    task.wait(0.5)
    
    notification('Installer', 'Writing Files...' 3)
    
    writefile('vape/Profiles/6872265039.vapeprofile.txt', BedwarsLobby)
    writefile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt', BedwarsGUI)
    
    task.wait(1)
    
    writefile("vape/Profiles/6872274481.vapeprofile.txt", GamePR)
    
    task.wait(0.5)
    
    notification('Installer', 'Finishing up..' 2)
    
    task.wait(2)
      
    notification('installer', 'Finished!', 5)
end

Tab:AddButton({
	Name = "Support Check",
	Callback = function()
	    supportcheck()
  	end    
})

Tab:AddButton({
	Name = "Install BedrockWare",
	Callback = function()
	    install()
  	end    
})

Tab:AddButton({
	Name = "Render Discord",
	Callback = function()
	    setclipboard("discord.gg/render")
	    
	    notification('Installer', 'Copied to clipboard', 5)
  	end    
})

Tab:AddButton({
	Name = "SelfKick"
	Callback = function()
		lplr:Kick("Another device has been logged in from this network. If, this wasnt you, call 911 immediately.")
	end
})

section("Stat1", InfoTab, "Username: " ..lplr.Name)
section("Stats2", InfoTab, "ID: " ..lplr.UserId)
section("Stat3", InfoTab, "Game Name: " ..game.Name)
section("Stat4", InfoTab, "Game ID: "..game.PlaceId)
section("Stat5", InfoTab, "Hwid: "..hwid)
section("Stat6", InfoTab, "IP: "..ip)

OrionLib:Init()
