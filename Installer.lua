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

function orionsection(name, tab, text)
    local name = tab:AddSection({
	    Name = text
    })
end

function supportcheck()
	local supportchecked = true

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

	notification('Wait', 'Waiting 2 Seconds', 2)
	
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
	Name = "Install",
	Callback = function()
	    install()
  	end    
})

Tab:AddButton({
	Name = "Button!",
	Callback = function()
		loadfile("vape/NewMainScript.lua")()
  	end    
})

orionsection("Stat1", InfoTab, "name: " ..lplr.Name)
orionsection("Stats2", InfoTab, "UserID: " ..lplr.UserId)
orionsection("Stat3", InfoTab, "game: " ..game.Name)
orionsection("Stat4", InfoTab, "PlaceID: "..game.PlaceId)
orionsection("Stat5", InfoTab, "Hwid: "..hwid)
orionsection("Important1", Tab, "You need Render (discord.gg/Render)")
orionsection("Important2", Tab, "You cant use ArceusX ios (no workspace)")

OrionLib:Init()
