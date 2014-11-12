--LogoScene.lua
--Create by cgw. 2014-11-10

cc.FileUtils:getInstance():addSearchPath("res/TV/common/image/")

local LogoScene = class("LogoScene", function()
	return display.newScene("LogoScene")
end)

LogoScene.EXIT_BTN_IMG = {
	normal = "public/btn_kongbai_up1.png",
	pressed = "public/btn_kongbai_up2.png",
	disabled = "public/btn_kongbai2_hui.png",
}

function LogoScene:ctor()
	-- body
	print("=======LogoScene:ctor()=========")
	self.bg = display.newColorLayer(cc.c4b(255, 255, 255, 255))
	self:addChild(self.bg)

	local function animationEvent(armatureBack,movementType,movementID)
		self:Exit()
	end

	local manager = ccs.ArmatureDataManager:getInstance()
	manager:addArmatureFileInfo("animation/logo/logo2.ExportJson")
	local armature = ccs.Armature:create("logo2")
	armature:getAnimation():playWithIndex(0)
	armature:setPosition(cc.p(0, 0))
	armature:getAnimation():setMovementEventCallFunc(animationEvent)
	self:addChild(armature)
end

function LogoScene:onEnter()
end

function LogoScene:Exit()
	-- body
	self:removeSelf()
end

return LogoScene