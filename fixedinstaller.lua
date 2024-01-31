local getservice = game:GetService
local lplr = getservice('Players').LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = 'Installer', HidePremium = false, SaveConfig = false, ConfigFolder = 'idk', IntroEnabled = false})
local hwid = getservice('RbxAnalyticsService'):GetClientId()
local playerservice = getservice('Players')
local replicatedstorage = shortcuts.getservice('ReplicatedStorage')
local httpservice = getservice('HttpService')
local BedwarsLobby = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872265039.vapeprofile.txt')
local BedwarsGUI = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872265039GUIPositions.vapeprofile.txt')
local GamePR = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/6872274481.vapeprofile.txt')


OrionLib:MakeNotification({
    Name = 'Installer',
    Content = 'i dont know if this is a fix.',
    Image = 'rbxassetid://4483345998',
    Time = 5
})


local Tab = Window:MakeTab({
	Name = 'Installer',
    Icon = 'rbxassetid://4483345998',
    PremiumOnly = false
})


Tab:AddButton({
	Name = 'Install',
	Callback = function()
		delfolder('vape/Profiles')
      
        task.wait(0.5)

        makefolder('vape/Profiles')

        task.wait(1)
    
        writefile('vape/Profiles/6872265039.vapeprofile.txt', BedwarsLobby)
        writefile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt', BedwarsGUI)
        writefile('vape/Profiles/6872274481.vapeprofile.txt', GamePR)
		
		task.wait(1)

		OrionLib:MakeNotification({
		    Name = 'Installer',
			Content = 'Done!',
		    Image = 'rbxassetid://4483345998',
		    Time = 5
		})
  	end    
})