--[[

    The #1 Config for Render.
    BedrockWare | Installer

]]

local isfile = isfile or function(file)
    local success, filecontents = pcall(function() return readfile(file) end)
    return success and type(filecontents) == 'string'
end 

local lplr = game:GetService("Players").LocalPlayer 
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Installer", HidePremium = false, SaveConfig = false, IntroEnabled = false})
local supportchecked
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
	
	local supportchecked = true
end


local BedwarsLobby = game:HttpGet("https://raw.githubusercontent.com/ninjawareforvape/BedrockWareee/main/6872265039.vapeprofile.txt")
local BedwarsGUI = game:HttpGet("https://raw.githubusercontent.com/ninjawareforvape/BedrockWareee/main/6872265039GUIPositions.vapeprofile.txt")
local GamePR = game:HttpGet("https://raw.githubusercontent.com/ninjawareforvape/BedrockWareee/main/6872274481.vapeprofile.txt")

function install()
    task.wait(1)
    delfile('vape/Profiles/6872265039.vapeprofile.txt')
    delfile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt')
    delfile('vape/Profiles/6872274481.vapeprofile.txt')

    print("Deleted files.")
      
    task.wait(0.5)
      
    writefile("vape/Profiles/6872265039.vapeprofile.txt", BedwarsLobby)
    writefile("vape/Profiles/6872265039GUIPositions.vapeprofile.txt", BedwarsGUI)
    task.wait(1)
    writefile("vape/Profiles/6872274481.vapeprofile.txt", GamePR)
    task.wait(0.5)
      
    task.wait(2)
      
    print("finished")
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
	    if supportchecked == true then
	        install()
	    end
	    
	    if supportchecked == nil then
	        notification(Install, "Check Support!", 5)
	    end
  	end    
})

section("Stat1", InfoTab, "Username: " ..lplr.Name)
section("Stats2", InfoTab, "ID: " ..lplr.UserId)
section("Stat3", InfoTab, "Game Name: " ..game.Name)
section("Stat4", InfoTab, "Game ID: "..game.PlaceId)
section("Stat5", InfoTab, "Hwid: "..hwid)

OrionLib:Init()
