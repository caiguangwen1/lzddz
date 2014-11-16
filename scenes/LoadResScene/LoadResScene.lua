--LoadResScene.lua
--Create by cgw. 2014-11-15

GameHallScene = import(".GameHallScene/GameHallScene")

local scheduler = require("framework.scheduler")

local LoadResScene = class("LoadResScene", function()
	return display.newScene("LoadResScene")
end)

LoadResScene.res = 
{
	"public/zhuomian_bg.png",
	"public/bg_zhezhao_01.png",
	"tinycard.png",
	"tinytinycard.png"
}

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

	self.progressSize = self.progress:getContentSize()
	self:SetPercent(0)
	self.resId = 0

	self.value = 0
	local function UpdateProgress()
		-- body
		if self.value >= 100 then
			--todo
			self.value = 100
			scheduler.unscheduleGlobal(self.handle)

			local function EnterGameHall()
				-- body
				local gameHall = GameHallScene.new()
				display.replaceScene(gameHall)
			end
			scheduler.performWithDelayGlobal(EnterGameHall, 0.1)
		end
		self:SetPercent(self.value/100)
	end

	self.handle = scheduler.scheduleGlobal(UpdateProgress, 0.1)	
end

function LoadResScene:SetPercent(fPercent)
	-- body
	self.progress:setTextureRect(cc.size(self.progressSize.width*fPercent, self.progressSize.height))
end

function LoadResScene:LoadRes(event, texture)
	-- body
	printLog("WARN", "Network connection lost at %d", self.resId)
	printLog("tag", "%d", table.getn(self.res))
	
	--todo
	local function addAsync( event, texture )
		-- body

		local function timeInterval(event, texture)
			-- body
			scheduler.performWithDelayGlobal(addAsync, 0.1)
		end
		local fPercent = self.resId/table.getn(self.res)
		printf("fPercent %f", fPercent)
		self.value = fPercent*100

		if self.resId < table.getn(self.res) then
			display.addImageAsync(LoadResScene.res[self.resId], timeInterval)
			self.resId = self.resId + 1
			print("res ", LoadResScene.res[self.resId])
		end
	end
	self.resId = self.resId + 1
	print("res ", LoadResScene.res[self.resId])
	scheduler.performWithDelayGlobal(addAsync, 0.1)
end

function LoadResScene:onEnter()
	self:LoadRes()
end

function LoadResScene:Exit()
	-- body
	scheduler.unscheduleGlobal(self.handle)
	display.removeSpriteFrameByImageName("public/loading_bg.png")
end

return LoadResScene