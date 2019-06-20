--[[
	Adds Greentext to your roblox game.
	Made by StrangeEggs
--]]

local scriptservice = game:GetService("ServerScriptService")

local ChatService = nil

game.Players.PlayerAdded:Connect(function(plr)
	local ChatService = require(scriptservice:WaitForChild("ChatServiceRunner").ChatService, 1)
	local speaker
	while not speaker do
		speaker = ChatService:GetSpeaker(plr.Name)
		wait()
	end
	
	print 'loaded'
	
	plr.Chatted:Connect(function(msg)
		if string.sub(msg, 1, 1) == ">" then
			speaker:SetExtraData("ChatColor", Color3.fromRGB(0, 255, 0))
			wait(0.01)
			speaker:SetExtraData("ChatColor", Color3.fromRGB(255,255,255))
		end
	end)
end)
