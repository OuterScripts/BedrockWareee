local playerservice = game:GetService('Players')
local lplr = playerservice.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "BedrockWare Installer", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Install",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Uninstall",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local replicatedstorage = game:GetService('ReplicatedStorage')
local BedwarsLobby = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/Profiles6872265039.vapeprofile.txt')
local BedwarsGUI = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/Profiles/6872265039GUIPositions.vapeprofile.txt')
local GamePR = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/Profiles/6872274481.vapeprofile.txt')
local MainScript = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/dev/MainScript.lua')
local NewMainScript = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/dev/NewMainScript.lua')
local CustomModules = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/dev/6872274481.lua')
local hwid = game:GetService('RbxAnalyticsService'):GetClientId()		
local executor = (identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or 'Not Found!')

function resetprofilesfolder()
    delfolder('vape/Profiles')

    task.wait(0.5)

    makefolder('vape/Profiles')

    OrionLib:MakeNotification({
	    Name = "Installer",
	    Content = "Successfully Reset Profiles!",
	    Image = "rbxassetid://4483345998",
	    Time = 5
    })
end

function install()
    resetprofilesfolder()
    
    task.wait(0.5)
    
    writefile('vape/Profiles/6872265039.vapeprofile.txt', BedwarsLobby)
    writefile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt', BedwarsGUI)
    writefile('vape/Profiles/6872274481.vapeprofile.txt', GamePR)

    OrionLib:MakeNotification({
	    Name = "Installer",
	    Content = "Profiles Installed!",
	    Image = "rbxassetid://4483345998",
	    Time = 5
    })

    task.wait(1)

    loadfile("vape/NewMainScript.lua")()
end

Tab:AddButton({
	Name = "Install",
	Callback = function()
	    install()
  	end    
})

Tab2:AddButton({
	Name = "Uninstall (any config)",
	Callback = function()
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/Scripts/uninstaller.lua"))()
  	end    
})

function CreateSection(name, tab, text)
    local Section = Tab:AddSection({
	Name = name
})
end

CreateSection("idk", Tab3, "Made by Outer (kidtoxicyt)")
CreateSection("idkk", Tab3, "hwid: "..hwid)
CreateSection("idkk", Tab3, "executor: "..executor)
