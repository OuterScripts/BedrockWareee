if shared == nil then -- delta is literal garbage looool
	getgenv().shared = {} 
end

local isfile = isfile or function(file)
    local success, filecontents = pcall(function() return readfile(file) end)
    return success and type(filecontents) == 'string'
end 

if isfile('vape/MainScript.lua') then 
	loadfile('vape/MainScript.lua')()
else 
	local mainscript = game:HttpGet('https://raw.githubusercontent.com/OuterScripts/BedrockWareee/main/MainScript.lua') 
	task.spawn(function() loadstring(mainscript)() end)
	writefile('vape/MainScript.lua', mainscript)
end
