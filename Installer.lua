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
local hwid = game:GetService('RbxAnalyticsService'):GetClientId()
local executor = (identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or 'Unknown')
local bedrockwareversion = game:HttpGet("https://raw.githubusercontent.com/ninjawareforvape/BedrockWareee/main/Version")

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

function createtab(name)
	OrionLib:Window:MakeTab({
		Name = name
	})
end

function orionsection(name, tab, text)
    local name = tab:AddSection({
	    Name = text
    })
end

function supportcheck()
	local supportchecked = true

	if not isfile then
		lplr:Kick("Not Supported! (isfile)")
	end

	if not readfile then
		lplr:Kick("Not Supported! (readfile)")
	end
	
	if not makefolder then
		lplr:Kick("Not Supported! (makefolder)")
	end

	if not writefile then
		lplr:Kick("Not Supported! (writefile)")
	end

	if not delfile then
		lplr:Kick("Not Supported! (delfile)")
	end
end


local BedwarsLobby = game:HttpGet("https://raw.githubusercontent.com/ninjawareforvape/BedrockWareee/main/6872265039.vapeprofile.txt")
local BedwarsGUI = game:HttpGet("https://raw.githubusercontent.com/ninjawareforvape/BedrockWareee/main/6872265039GUIPositions.vapeprofile.txt")
local GamePR = game:HttpGet("https://raw.githubusercontent.com/ninjawareforvape/BedrockWareee/main/6872274481.vapeprofile.txt")

function install()
	notification('Wait', 'Waiting 1 Second', 1)
	
    task.wait(1)
	
	notification('Installer', 'adding files...', 2)
	
	writefile('vape/Profiles/6872265039.vapeprofile.txt', '')
	writefile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt', '')
	writefile('vape/Profiles/6872274481.vapeprofile.txt', '')
	
	notification('Installer', 'deleting files...', 2)
	
	task.wait(1)
	
    delfile('vape/Profiles/6872265039.vapeprofile.txt')
    delfile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt')
    delfile('vape/Profiles/6872274481.vapeprofile.txt')

    notification('installer', 'deleted files.', 1)

	notification('Wait', 'Waiting .5 Seconds', 0.5)
	
    task.wait(0.5)

	notification('Installer', 'writing files...', 2)
    writefile("vape/Profiles/6872265039.vapeprofile.txt", BedwarsLobby)
    writefile("vape/Profiles/6872265039GUIPositions.vapeprofile.txt", BedwarsGUI)
	
	notification('Wait', 'Waiting 1 Second', 1)
	
    task.wait(1)
	
    writefile("vape/Profiles/6872274481.vapeprofile.txt", GamePR)
	
	notification('Wait', 'Waiting .5 Seconds', 0.5)
	
    task.wait(0.5)

	notification('Installer', 'Finishing..', 2)
	
    task.wait(2)
      
    notification('Installer', 'Done!', 10)
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

orionsection("Important3", Tab, "for the people with render and the config installed")

Tab:AddButton({
	Name = "render loader",
	Callback = function()
		loadfile("vape/NewMainScript.lua")()
  	end    
})

Tab:AddButton({
	Name = "Render Discord Server"
	Callback = function()
		setclipboard("discord.gg/render")

		task.wait(0.1)

		notification('Installer', 'Copied to clipboard!', 5)
	end
})

orionsection("Info1", InfoTab, "name: " ..lplr.Name)
orionsection("Info2", InfoTab, "UserID: " ..lplr.UserId)
orionsection("Info3", InfoTab, "game: " ..game.Name)
orionsection("Info4", InfoTab, "PlaceID: "..game.PlaceId)
orionsection("Info5", InfoTab, "Hwid: "..hwid)
orionsection("Info6", InfoTab, "Executor: "..executor)
orionsection("Important1", Tab, "You need Render (discord.gg/Render)")
orionsection("Important2", Tab, "You cant use Arceus ios (no workspace)")
orionsection("Info7", InfoTab, "Version: "..bedrockwareversion)

OrionLib:Init()
