-- error("dfdsf")
-- local name = "123"
	-- if name ~= "张三" then
	-- 	error("你不是张三，我要找的人是张三")
	-- end
--assert(name == "张三","你不是张三，我要找的人是张三")--条件不满足输出后面的那句话.条件满足什么也不输出

--pcall 捕获错误代码
-- function test()
-- 	print(a[1])  --不存在a这个table,所有会执行print("函数出错了") 
-- end
-- if pcall(test) then
-- 	print("程序正常")函数模板也可以声明为inline函数模板也可以声明为inline
-- else
-- 	print("函数出错了") 
-- end

-- --可以输出错误信息
-- function test()
-- 	print(a[1])  --不存在a这个table,所有会执行print("函数出错了") 
-- end
-- --任何类型的Lua值都可以作为错误消息传递给error函数,并且这些值也会成 为pcall的返回值
-- local status,err = pcall(test);--pcall返回两个值，状态和错误信息
-- if status then
-- 	print("程序正常")
-- else
-- 	print("函数出错了") ;
-- 	print(err);--可以输出错误信息
-- end

-- 新建一个hello.lua的文件
-- loadfile("./hello.lua")--只会加载文件,编译代码,不会运行文件里的代码。不会输出任何内容

-- dofile("./hello.lua")--会执行代码

-- for i=1,2,1 do
-- 	--在第一次加 载文件的时候,会执行里面的代码。但是,第二次之后,再次加载文件,则不会重复 执行了。
-- 	--换句话说,它会保存已经加载过的文件,不会重复加载。
-- 	require("hello")--require不需要加.lua后缀。开发中经常用require
-- end

--如果需要多次运行一个文件,只需要在调用一次loadfile之后,多次调用它的 返回结果就可以了。
--相对于多次调用dofile来说,由于只编译一次文件,开销比较 小。

--元表是普通的Lua表 ，定义了原始值在某些特定操作下 的行为

-- t1 = {
-- 	name="hh",
-- 	sayHello=function() --键值对既可以使一个值，也可以是一个函数
-- 		print("hello")
-- 	end
-- }
-- t1.sayHello()


local  mt = {}  --定义一个空表 
--lua在创建新的table不会创建元表
--print(getmetatable(mt))--nil  

--与下面的等价
-- function mt.__add(t1,t2)-- __add是系统提供的
-- 	print("两个table相加的时候调用")
-- end

mt.__add=function (t1,t2)
	print("两个table相加的时候调用")
end
local  t1 = {}
local  t2 = {}
setmetatable(t1,mt)--给两个table设置新的元表
setmetatable(t2,mt)
local result = t1+t2--进行加法操作，先找到t1,t2的元表，再找到__add函数


mytable = setmetatable({key1 = "value1"}, {
	--__index 我们称之为元方法。
  __index = function(mytable, key)
    if key == "key2" then
      return "metatablevalue"
    else
      return mytable[key]
    end
  end
})
print(mytable.key1,mytable.key2)

--等价上面的  上述程序的简化版本
-- mytable = setmetatable({key1 = "value1"}, { __index = { key2 = "metatablevalue" } })
-- print(mytable.key1,mytable.key2)

-- mymetatable = {}
-- mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })
-- print(mytable.key1)--value1
-- mytable.newkey = "new value 2"
-- print(mytable.newkey,mymetatable.newkey)--nil	new value 2
-- mytable.key1 = "new  value 1"
-- print(mytable.key1,mymetatable.newkey1)--new  value 1	nil

-- mytable = setmetatable({key1 = "value1"}, {
--   __newindex = function(mytable, key, value)
--   rawset(mytable, key, "\""..value.."\"")
-- end
-- })
-- mytable.key1 = "new value"
-- mytable.key2 = 4
-- print(mytable.key1,mytable.key2) --  new value	"4"


--元表的真实操作
--创建一个元表，元表中的键为事件(event),称值为 元方法(metamethod)
-- local mt = {}
-- mt.__add=function ( s1,s2 )
-- 	local result = ""
-- 	if s1.sex == "boy" and s2.sex == "girl" then
-- 		result = "完美"
-- 	elseif s1.sex == "girl" and s2.sex == "girl" then
-- 		result = "不好"
-- 	else
-- 		result = "不好"
-- 	end
-- 	return result
-- end
-- -- 创建两个table,可以想象成是两个类的对象
-- local  s1 = {
-- 	name = "hello",
-- 	sex = "boy"
-- }
-- local  s2 = {
-- 	name = "world",
-- 	sex = "girl"
-- }
-- -- 给两个table设置新的元表,保证两个元表有一个即可
-- setmetatable(s1,mt)
-- --setmetatable(s2,mt)
-- local result = s1 + s2
-- print(result)



-- local t = {
-- 	name="hehe"
-- }--子类
-- local mt = {
-- --在父类中，找对应的元方法
-- 	__index=function ( table,key )
-- 		print("调用了不存在的字段"..key)
-- 	end
-- }
-- setmetatable(t,mt)--调用了不存在的字段money
-- print(t.money)--nil


--在子类里写上对应的key值，就可以输出子类中对应的money，
-- local t = {
-- 	name="hehe",
-- 	money=300
-- }--子类
-- local mt = {
-- --在父类中，找对应的元方法
-- 	__index=function ( table,key )
-- 		print("调用了不存在的字段"..key)
-- 	end
-- }
-- setmetatable(t,mt)
-- print(t.money)--300

--  --__index可以是一个function，也可以是一个table
-- local t = {
-- 	name="hehe",
-- }--子类
-- local mt = {
-- --在父类中，找对应的元方法
-- 	__index = {
-- 		money = "6000",
-- 	}
-- }
-- setmetatable(t,mt)
-- print(t.money)--6000

--   __newindex的使用，监控table的操作
--   __index用于查询,__newindex用于更新
--t1有值的话，对本身表进行修改，查找，更新，把一个表作为只读的表，
-- local smartMan = {
-- 	name = "none",
-- 	money = 900000,
-- 	sayHello = function (  )
-- 		print("dajia")
-- 	end
-- }
-- local t1 = {
-- 	-- sayHello= function (  )
-- 	-- 	print("dajiatwo")
-- 	-- end
-- }
-- local mt = {
-- 	__index = smartMan,
-- 	__newindex = function ( table,key,value )
-- 		print(key .. "字段是不存在的不要试图给它赋值")
-- 	end
-- }
-- setmetatable(t1,mt)
-- -- t1.sayHello = function (  )
-- -- 	print("en")-- table  t1中有sayHello函数，就相当于重写t1中的方法，输出“en”
-- -- 			-- 当t1中没有sayHello函数，即为空的表，对一个table不存在的字段进行赋值的时候。
-- -- 			-- __newindex就会监控出此字段不存在，调用__newindex的函数 
-- -- 			--输出sayHello字段是不存在的不要试图给它赋值
-- -- end
-- t1.sayHello();-- dajia


-- mytable = setmetatable({ 1, 2, 3 }, {
--   __add = function(mytable, newtable)
--     for i = 1, table.maxn(newtable) do
--       table.insert(mytable, table.maxn(mytable)+1,newtable[i])
--     end
--     return mytable
--   end
-- })
-- secondtable = {4,5,6}
-- mytable = mytable + secondtable
-- for k,v in ipairs(mytable) do
-- 	print(k,v)
-- end
-- 
-- 1	1
-- 2	2
-- 3	3
-- 4	4
-- 5	5
-- 6	6


-- local smartMan = { name = "none"}
-- local other = { name = "我是无辜的表"}
-- --local t1 = {}
-- local t1 = {name = "ltl"} --
-- local mt = {
-- 	__index = smartMan,
-- 	__newindex = other
-- }
-- setmetatable(t1,mt)
-- print("other的名字，赋值前:" ..other.name)
-- print("t1的名字:" ..t1.name) --如果t1表里没有对应的字段，会调用mt里的__index的smartMan，
-- 							--再次调用smartMan里的name = “none”
-- 							--如果t1表里有对应的字段，会直接输出name = "ltl"
-- t1.name = "小偷" --如果t1表里没有对应的字段，会调用mt里的__newindex,会修改other表里name为“小偷”
-- 				--如果t1表里有对应的字段，会直接修改t1里name为“小偷”，而不会改变other里的内容
-- --t1.hehe = "asd" --如果t1表里没有字段，
-- 				--会调用元表mt里的__newindex中other表,也没有对应的hehe，就都不会修改内容
-- 				--如果t1表里有字段，但是没有对应hehe的字段
-- 				--继续掉用元表里的__newindex中other表，也没有对应的hehe，就都不会修改内容
-- print("other的名字，赋值后:" ..other.name)
-- print("t1的名字:" ..t1.name) --查询元表，调用__index，输出none



--忽略元表的属性 rawget rawset
--rawget函数可以忽略元表的__index功效,纯粹地从t1中调用字段
--rawset函数可以忽略元表的__newindex功效,纯粹地给t1赋值
-- local smartMan = {
--     name = "none",
-- }
-- local t1 = {
-- 	hehe = 123; 
-- }
-- local mt = {
--     __index = smartMan,
--     __newindex =function(t, k, v) 
--     	print("别赋值!");
-- 	end 
-- }
-- setmetatable(t1,mt)
-- print(rawget(t1,"name"))--nil
-- print(rawget(t1,"hehe"))--123
-- rawset(t1,"name","小偷")--小偷
-- print(t1.name)

-- -G 全局环境表
-- 打印当前环境中所有全局变量的名称
-- for n in pairs(_G) do print(n) end
-- -- 定义一个全局变量

--  gName = "我是全局变量";
--  -- 用三种方式输出变量的值 
--  print(gName); 
--  print(_G["gName"]); 
--  print(_G.gName);

 -- 定义一个全局变量
-- gName = "我是全局变量";
-- -- 将当前全局环境重新设置为新的table 
-- -- setfenv函数就是用来改变某个函数范围里的全局环境的,通俗地说,就是把某个函 数范围内的_G给弄没了
-- -- setfenv函数两个参数分别代表:
-- -- 1). 第一个参数,可以是即将要改变环境的函数,也可以是一个数字。
			--数字1代表当 前函数,数字2代表调用当前函数的函数,后面以此类推。
-- -- ￼2).第二个参数,新的全局环境table。
-- setfenv(1,{});--5.0之前有
-- -- 输出值
-- print(gName);

-- 定义一个全局变量 
-- gName = "我是全局变量";
-- -- 将当前全局环境重新设置为新的table 
-- setfenv(1, {g = _G});
-- -- 输出值
-- g.print(gName);
-- -- 再次定义一个全局变量 
-- gName = "我是全局变量2"; 
-- -- 再次输出值 
-- g.print(gName);
-- -- 输出原来的值 
-- g.print(g.gName);


-- 隐藏参数self
-- TSprite = {
-- 	x = 0,
-- 	y = 0,
-- }
-- function TSprite:setPosition(x,y)
-- --function TSprite.setPosition(self,x,y)
-- 	self.x = x;
-- 	self.y = y;
-- end
-- local who = TSprite;
-- TSprite = nil;
-- who:setPosition(1,2);  -- 冒号: ,系统会提供一个self,"."系统不会提供一个self,
-- -- who.setPosition(who,1,2);
-- for k,v in pairs(who) do
-- 	print(k,v)
-- end

-- 继承的实现
-- attack属性
-- self当前的调用者
-- 不仅把父类的方法继承下来，还会覆盖


-- Hero = {
-- 	attack = 0
-- }
-- function Hero:new(o)
-- 	o = o or {}
-- 	setmetatable(o,self)
-- 	self.__index = self
-- 	return o
-- end
-- function Hero:skill(addAttrack)

-- 	self.attack = self.attack + addAttrack
-- end
-- oneHero = Hero:new() --当我们调用Hero:new的 时候,产生了一个新的表,并且 对应的元表是Hero
-- --调用skill 函数的时候,在oneHero里面无 法找到skill,就会去元表里面 查找,查找到之后进行调用。
-- function oneHero:skill(addAttrack)
-- 	print("重写了父类的skill函数")
-- end
-- --写一个自己的方法
-- function oneHero:test()
-- 	print("test")
-- end
-- oneHero:skill(10) --谁调用了skill，self就是谁
-- print(oneHero.attack)--10
-- --重写了父类的skill函数,会输出0
-- --print(oneHero.attack)--0

-- for k,v in pairs(oneHero) do
-- 	print(k,v)  -- attack	10
-- end

-- oneHero:test()



