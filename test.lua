local rdebug = require "remotedebug"

rdebug.start "debugmain"

local function foo(...)
	print(...)	-- line 6, look debugmain.lua
end

local b = { a = 2 }

local function abc(a, ...)
	local a = b.a
	local a = { b = { c = { d = 1 } } }

	local c = {}
	local d = { [c] = { e = 1 }, 3, a = {4,5} }

	rdebug.probe "abc"
	local c = 2
	return a, c, ...
end

for i = 1, 3 do
	rdebug.probe "ABC"
end

abc(1,2,{a = 1})

foo(5,4,3,2,1)

