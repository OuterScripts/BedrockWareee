local playerservice = game:GetService('Players')
local lplr = playerservice.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local replicatedstorage = game:GetService('ReplicatedStorage')
local BedwarsLobby = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/Profiles6872265039.vapeprofile.txt')
local BedwarsGUI = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/Profiles/6872265039GUIPositions.vapeprofile.txt')
local GamePR = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/Profiles/6872274481.vapeprofile.txt')
local MainScript = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/dev/MainScript.lua')
local NewMainScript = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/dev/NewMainScript.lua')
local CustomModules = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/dev/6872274481.lua')

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

resetprofilesfolder()

task.wait(0.5)

install()
