--LoadResScene.lua
--Create by cgw. 2014-11-15

local LoadResScene = class("LoadResScene", function()
	return display.newScene("LoadResScene")
end)

function LoadResScene:ctor()
	-- body
	print("=======LoadResScene:ctor()=========")
	self.bg = display.newSprite("public/loading_bg.png")
		:align(display.CENTER, display.cx, display.cy)
		:addTo(self)

	local progressBg = display.newSprite("dengjikuang.png")
		:addTo(self)
	progressBg:setPosition(cc.p(display.width/2, display.height/8))

	local s = progressBg:getContentSize()
	self.progress = display.newSprite("dengjijindutiao.png")
		:align(display.CENTER_LEFT, 2.5, s.height/2)
		:addTo(progressBg)

	self:SetPercent(0.50)
end

function LoadResScene:SetPercent(fPercent)
	-- body
	self.progressSize = self.progress:getContentSize()
	self.progress:setTextureRect(cc.size(self.progressSize.width*fPercent, self.progressSize.height))
end

function LoadResScene:onEnter()
end

function LoadResScene:Exit()
	-- body
	self:removeSelf()
end

return LoadResScene