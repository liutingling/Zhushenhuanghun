--模块的简单使用
-- game={}
-- function game.play()
-- 	print("开始")
-- end
-- function game.quit()
-- 	print("结束")
-- end
-- return game

--游戏中模块的使用，保存数据，像单例一样
--package.seeall参数的作用就是让原来的_G依然生效,相当于调用了: setmetatable(M, {__index = _G})

module("game",package.seeall);
local level = 1
function setLevel(le)
	level = le
end
function getLevel()
	return level
end
function play()
	print("开始吧")
end
function quit()
	print("你走吧")
end

-- 返回值的主表的总和与传递表
-- mytable = setmetatable({10}, {
--   	__call = function(mytable, newtable)
--  	sum = 0
--  	for i = 1, table.maxn(mytable) do
--   		sum = sum + mytable[i]
--  	end
--  	for i = 1, table.maxn(newtable) do
--   		sum = sum + newtable[i]
--  	end
-- 	return sum
--  end
-- })
-- newtable = {10,20,30}
-- print(mytable(newtable))

--更改打印语句的行为，可以用__toString元方法
-- mytable = setmetatable({ 10, 20, 30 }, {
--   	__tostring = function(mytable)
--     sum = 0
--     for k, v in pairs(mytable) do
--   		sum = sum + v
--  	end
--     return "The sum of values in the table is " .. sum
--   	end
-- })
-- print(mytable)



