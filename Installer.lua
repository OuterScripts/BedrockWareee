local playerservice = game:GetService('Players')
local lplr = playerservice.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local replicatedstorage = game:GetService('ReplicatedStorage')
local BedwarsLobby = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872265039.vapeprofile.txt')
local BedwarsGUI = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872265039GUIPositions.vapeprofile.txt')
local GamePR = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872274481.vapeprofile.txt')

local isfile = isfile or function(file) -- i needed it, ty render
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end

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
	    Content = "Installed Profiles!",
	    Image = "rbxassetid://4483345998",
	    Time = 5
    })
end

task.wait(1)

resetprofilesfolder()

task.wait(0.5)

install()