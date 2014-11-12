
require("config")
require("cocos.init")
require("framework.init")

--local logoScene = import(".scenes.LogoScene.LogoScene")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    self:enterScene("MainScene")
    --self:enterLogoScene()
end

function MyApp:enterLogoScene()
	-- body
	cc.FileUtils:getInstance():addSearchPath("res/")
	app:enterScene(".LogoScene.LogoScene")
end

return MyApp
