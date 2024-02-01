local playerservice = game:GetService('Players')
local lplr = playerservice.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local replicatedstorage = game:GetService('ReplicatedStorage')
local BedwarsLobby = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872265039.vapeprofile.txt')
local BedwarsGUI = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872265039GUIPositions.vapeprofile.txt')
local GamePR = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872274481.vapeprofile.txt')
local MainScript = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/MainScript.lua')
local NewMainScript = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/NewMainScript.lua')

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
end

function LoadVape
    if isfile('vape/NewMainScript.lua') then
        delfile('vape/NewMainScript.lua')
    end

    if isfile('vape/MainScript.lua') then
        delfile('vape/MainScript.lua')
    end

    writ

task.wait(1)

resetprofilesfolder()

task.wait(0.5)

install()

task.wait(1)

