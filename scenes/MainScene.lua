local logoScene = import(".LogoScene.LogoScene")

local MainScene = class("MainScene", function()
	return display.newScene("MainScene")
end)

function MainScene:ctor()
	cc.ui.UILabel.new({
			UILabelType = 2, text = "Hello, World", size = 64})
		:align(display.CENTER, display.cx, display.cy)
		:addTo(self)

	cc.FileUtils:getInstance():addSearchPath("res/TV/common/image/")
	cc.ui.UIPushButton.new("public/btn_kongbai2_up.png")
		:align(display.CENTER, display.right - 100, display.bottom + 120)
		:onButtonClicked(function()
			self:enterLogoScene()
		end)
		:addTo(self)

	local scene = logoScene:new()
	self:addChild(scene)
end

function MainScene:run()
	-- body
	print("MainScene:run()")
end

function MainScene:enterLogoScene()
	-- body
	print("MainScene:enterLogoScene")
	local scene = logoScene.new()
	display.replaceScene(scene)
end

function MainScene:onEnter()

end

function MainScene:onExit()
end

return MainScene
