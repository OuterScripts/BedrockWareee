local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

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

resetprofilesfolder()