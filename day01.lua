-- print("hello lua")
-- print(b)
-- b=10
-- print(b)
-- print(type(nil))
-- print(type(false))
-- print(type(10))
-- print(type('test'))
-- print(type(print))
-- print(type(type("string")))
-- print(type(type('string')))

a=10
print(a)
a="hello world"
print(a)
a=print
a("hello")

--Boolean类型
-- a=0;
-- if a then
-- 	print("zhende")
-- else
-- 	print("jiade")
-- end

--字符串替换
-- a="one string"
-- b=string.gsub(a,"one","another")
-- print(b)

--数字与字符串
-- print(10+'1')
-- print("10"+"1")
-- -- print(10+"hello")--×

--字符串连接
-- print("hello".."world")
-- print("hello"..10)
-- print("a"..10 ..".png")

-- --数字连接
-- print(10 ..20)--1020
-- print(tonumber("hello"))--nil
--tostring()将数字转成字符串
-- print(tostring(20))--20
-- print(tostring("hello"))--hello
-- print(tostring(10)=="10")--true
-- print(10 ..""=="10")--true


--表达式
--[[
a,b=10,20
print(a,b)--10	20

c,d,e=10,20
print(c,d)--10	20  nil

--两个数字交换，直接互换
a,b=b,a
print(a,b)--20	10

if a then
	--局部变量，只在if对内有效
	local m = 20
end
print(m) --nil
--]]

--for循环,3表示i+3，不支持i++，可以i=i+1
-- for i=1,10,3 do
-- 	print(i)
-- end

--函数
-- function max( a,b )
-- 	if a>b then
-- 		return a
-- 	else
-- 		return b
-- 	end
-- end
-- print(max(100,200))


-- function test( ... )
-- 	return 10,20,30
-- end
-- a,b,c=test()
-- print(a,b,c)--10 20	30

-- --40放在test后面，
-- function test( ... )
-- 	return 10,20,30
-- end
-- a,b,c=test(),40
-- print(a,b,c)--10	40	nil

-- --40放在test前面，
-- function test( ... )
-- 	return 10,20,30
-- end
-- a,b,c=40,test()
-- print(a,b,c)--40	10	20

--局部函数的使用
-- function A( ... )
-- 	print("A called")
-- 	--局部函数输不出内容，会报错
-- 	--local function B( ... )
-- 	function B( ... )
-- 		print("B called")
-- 	end
-- end
-- A()
-- B()

--数据结构table,下标从1开始
-- days={"Monday","Tuesday","wednesday","Thursday","Friday"}
-- print(days[1])--Monday
-- --输出table的长度的两种方式
-- print(#days)--5
-- print(table.maxn(days))--5

-- days={"Monday","Tuesday","wednesday","Thursday","Friday"}
-- --快速遍历，输出days里的所有内容
-- for k,v in pairs(days) do
-- 	print(k,v)
-- end

--字典形式的table
-- t={
-- 	{a=2,b=3},
-- 	{a=3,b=4}
-- }
-- --得到a的值
-- print(t[1].a)--2

-- test={name="ltl",age=20}
-- print(test.name)
-- print(test["name"])
-- --添加键值对
-- test.sex="girl"
-- test["id"]=12514112
-- --快速遍历输出table里的所有键值
-- for k,v in pairs(test) do
-- 	print(k,v)
-- end

--键是顺序排序输出，值时逆序排序输出


--ipairs与pairs的测试
-- test={name="ltl",age=20,"hello","world",[3]="nihao",[5]="kkk"}
-- --添加键值对
-- test.sex="girl"
-- test["id"]="12514112"
-- --快速遍历输出table里的所有键值
-- for k,v in pairs(test) do
-- 	print(k,v)
-- end

--ipairs 输出是按照table的有序顺序进行输出，
-- 输出为
-- 1	hello
-- 2	world
-- 3	nihao

--pairs迭代输出table元素
-- 1	hello
-- 2	world
-- 3	nihao
-- 5	kkk
-- id	12514112
-- age	20
-- name	ltl
-- sex	girl

--求一个数的阶乘
-- function jiecheng(n)
-- 	if n==1 then
-- 		return 1
-- 	else
-- 		return n*jiecheng(n-1)
-- 	end
-- end

-- print(jiecheng(5))

--闭合函数   count函数会返回另外一个函数,同时,这个返回的函数会使用count函数 的局部变量。
-- function count( ... )
-- 	--local i就属于一个非局部变量,因为它既不是全局变量,也不是单纯的局部变量(因为另外一个函数可以访问到它)。
-- 	--count函数里的那个函数,加上非局部变量i,就构成了一个闭合函数
-- 	local i = 0
-- 	--闭合函数，会记录上次i保留下来的值
-- 	return function ()
-- 		i=i+1
-- 		return i
-- 	end
-- end
-- --定义一个局部的变量存放count函数返回的值
-- local fun = count()
-- print(fun)--function: 0x7ff993c08210
-- --每调用一次fun，count函数返回的值就会加一
-- print(fun())--1
-- print(fun())--2
-- print(fun())--3


--非全局函数,存储在局部变量中的函数称为非全局函数
-- local test
-- test=function ()
-- 	print("testcalled")
-- end
-- test()--testcalled


--两者等价
-- local function test()
-- 	print("testcalled")
-- end
-- test()--testcalled

--注意函数调用的顺序
-- local function drink()
--         print("drink");
-- end
--只有当drink变量存在的时候，eat函数才能调用 
-- local function eat()
--         print("eat");
--         return drink();
--     end
-- eat()

--修改为以下形式（最好）
-- local  eat
-- local drink
-- drink=function ()
-- 	print("drink")
-- 	return eat()
-- end
-- eat=function ()
-- 	print("eat")
-- end
-- drink()
-- -- drink
-- -- eat

--尾调用，一个函数的调用是另一个函数的最后一个动作时,这个调用就称之为尾调用

-- local  eat
-- local drink
-- drink=function ()
-- 	print("drink")
-- 	return eat()
-- end
-- eat=function ()
-- 	local sum = 0
-- 	for i=1,10 do
-- 		sum=sum+i
-- 	end
-- 	return sum
-- end
-- for i=1,100 do
-- 	drink()
-- end

--迭代器（正是利用了闭合函数的特性来实现迭代功能的。
-- function dieDaiQi( t )--t为table
--  --闭合函数
-- 	local i = 0
-- 	return function ()
-- 		i=i+1
-- 		return t[i]
-- 	end
-- end

--  t={"a","b","c"}
-- --将这个函数保存，便于调用
-- --因为每一次调用dieDaiQi函数，就会产生一个新的闭合函数，所以我们要用一个iter变量保存这个闭合函数，避免重复创建。
--  local iter = dieDaiQi(t);
-- --循环遍历iter函数
--  while true do
--  	local  value = iter()--调用iter函数
--  	if value == nil then
--  		break
--  	end
--  	print(value);
--  end 
--  --输出 a  b  c
--  --print(iter())--只输出a



-- --输出数组中的值
-- --使用for循环调用迭代器
 -- local t = {"fa","22"}
 -- for value in dieDaiQi(t) do
 -- 	print(value)
 -- end

--所谓迭代器就是一种可以遍历一种集合中所有元素的机制,在Lua中,
--通常将迭代器表示为函数,每调用一次函数,即返回集合中的下一个元素
-- function dieDaiQi( t )--t为table
-- 	local i = 0--静态局部变量
-- 	--闭合函数
-- 	return function ()
-- 		i=i+1
-- 		if i>#t then
-- 			return nil
-- 		end
-- 		return i,t[i];--返回两个值
-- 	end
-- end

-- -- --调用for循环迭代器 输出键与值
-- local  t = {"fa","22","qq"}
-- for k,v in dieDaiQi(t) do
-- 	print(k,v)
-- end

-- 遍历一个
-- arr={1,2,3,4,"Hello"}
-- for key,var in pairs(arr) do
--     print(key,var)
-- end
--

-- 1	1
-- 2	2
-- 3	3
-- 4	4
-- 5	Hello

--练习
--经典
-- arr={}--创建一个空表
-- --在空表里插入1~10的值
-- for var=1,10 do
-- 	table.insert(arr,2,var)
-- end
-- --用循环输出arr表里的内容
-- for k,v in pairs(arr) do
-- 	print(k,v)
-- end
--输出表里最大的数
--print(table.maxn(arr))--10


--  local t = {"fdsd", "445"};
--  for k,v in pairs(t) do
--  	print("k=" ..k ..",v=" ..v)
--  end
-- --  k=1,v=fdsd
-- -- k=2,v=445


--自己写一个迭代器
-- function dieDaiQi( t )
-- 	local i = 0
-- 	return function ()
-- 		i=i+1
-- 		return t[i]
-- 	end
-- end
-- 然后遍历table
-- t = {"fdsd", "445"};
-- local iter = dieDaiQi()
-- for value in dieDaiQi(t) do
-- 	print(value)
-- end

