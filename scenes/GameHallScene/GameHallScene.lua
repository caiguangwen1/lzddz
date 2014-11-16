--GameHallScene.lua
--Create by cgw. 2014-11-17

local GameHallScene = class("GameHallScene", function()
	return display.newScene("GameHallScene")
end)

function GameHallScene:ctor()
	print("GameHallScene:ctor()")
	--display.addSpriteFrames("gamehall/gamehall.plist")
	self.bg = display.newColorLayer(cc.c4b(255, 255, 255, 255))
	self:addChild(self.bg)

end

function GameHallScene:run()
	-- body
	print("GameHallScene:run()")
end

function GameHallScene:onEnter()
	print("GameHallScene:onEnter()")
end

function GameHallScene:onExit()
end

return GameHallScene
