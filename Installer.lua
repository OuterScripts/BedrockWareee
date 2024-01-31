local lplr = game:GetService('Players').LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = 'Installer', HidePremium = false, SaveConfig = false, ConfigFolder = 'idk', IntroEnabled = false})
local hwid = game:GetService('RbxAnalyticsService'):GetClientId()
local playerservice = game:GetService('Players')
local replicatedstorage = game:GetService('ReplicatedStorage')
local BedwarsLobby = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872265039.vapeprofile.txt')
local BedwarsGUI = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872265039GUIPositions.vapeprofile.txt')
local GamePR = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872274481.vapeprofile.txt')

local isfile = isfile or function(file) -- i needed it, ty render
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end

local Tab = Window:MakeTab({
	Name = "Installer",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


Tab:AddButton({
	Name = 'Install',
	Callback = function()
		if not isfile('vape/Profiles/6872265039.vapeprofile.txt') then
            writefile('vape/Profiles/6872265039.vapeprofile.txt', '')
        end

        if not isfile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt') then
            writefile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt', '')
        end

        if not isfile('vape/Profiles/6872274481.vapeprofile.txt', '') then
            writefile('vape/Profiles/6872274481.vapeprofile.txt', '')
        end

        task.wait(0.5)
    
        if isfile('vape/Profiles/6872265039.vapeprofile.txt') then
            delfile('vape/Profiles/6872265039.vapeprofile.txt')
        end

        if isfile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt')
            delfile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt')
        end

        if isfile('vape/Profiles/6872274481.vapeprofile.txt')
            delfile('vape/Profiles/6872274481.vapeprofile.txt')
        end
      
        task.wait(0.5)

        if not isfile('vape/Profiles/6872265039.vapeprofile.txt') then
            writefile('vape/Profiles/6872265039.vapeprofile.txt', BedwarsLobby)
        end

        if not isfile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt') then
            writefile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt', BedwarsGUI)
        end

        if not isfile('vape/Profiles/6872274481.vapeprofile.txt') then
            writefile('vape/Profiles/6872274481.vapeprofile.txt', GamePR)
        end
		
		task.wait(1)

		OrionLib:MakeNotification({
		    Name = 'Installer',
			Content = 'Done!',
		    Image = 'rbxassetid://4483345998',
		    Time = 5
		})
  	end    
})