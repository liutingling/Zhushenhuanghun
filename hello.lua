-- print("hello lua")

--模块的简单使用
-- game=require("game")
-- game.play()

--在hello.lua中运行，会输出“开始吧“
game = require("game")  -- game要和新建的文件名一致
game.play()


local function touchbegan(location,event)
	print("这是一种通用的接触")
	local p = location:getLocation()
	print(p.x..p.y)
	return true
end

local listener = cc.EventListenerTouchOneByOne:create()
local  dispatcher= cc.Director:getInstance():getEventDispatcher()
listener:registerScriptHandler(touchbegan,cc.Handler.EVENT_TOUCH_BEGAN)
dispatcher:addEventListenerWithSceneGraphPriority(listener, self)

local function touchended(location,event)
	print("这是一种通用的接触")
	local p = location:getLocation()
	print(p.x..p.y)
	return true
end

local listener = cc.EventListenerTouchOneByOne:create()
local  dispatcher= cc.Director:getInstance():getEventDispatcher()
listener:registerScriptHandler(touchended,cc.Handler.EVENT_TOUCH_ENDED)
dispatcher:addEventListenerWithSceneGraphPriority(listener, self)