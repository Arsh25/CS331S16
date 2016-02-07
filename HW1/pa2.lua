--[[
	pa2.lua
	Arsh Chauhan
	06/02/2016
	module pa2.lua for assignment 2
  ]]


local pa2 = {}	-- Our module 


function pa2.concatLimit(str, num)
	size = str:len()
	print ("size"..size)
	if (size > num)
		then return ""
	end
	
	if (size == num) 
		then return str
	else 
		tempStr = ""
		while(size < num) do
			tempStr = str .. tempStr
			--print(tempStr)
			size = tempStr:len()
		end
		return tempStr
	end
end

--filerTable
--Pre: 
--		Function f must return a bool and have 1 parameter
--		t must be table whose values are passable to f.
--Post: Returns a table consisting of all keys of t for which 
--		f returned true. 
--		isTrue has same keys as t.
function pa2.filterTable(f, t)
	isTrue = {} -- All true return values
	retValue = {} -- All return values of f
	for key, value in pairs(t) do
		retValue[key] = f(key)
		if(retValue[key] == true) then 
			isTrue[key] = t[key]
		end
	end 
	return isTrue
end
	
--FIXME: I'm not returning the first value 
function pa2.collatzSeq(k) 
	--[[if(k == 1)then --Base Case
		return
	else if((k%2) == 0)then 
		k = k/2
		coroutine.yield(k)
		k = pa2.collatzSeq(k)
	else
		k = ((3*k)+1)
		coroutine.yield(k)
		k = pa2.collatzSeq(k)
	end
	end
	]]
	
	while true do
		if k == 1 then
			coroutine.yield(k)
			break
		end
		if ((k%2) == 0) then
			coroutine.yield(k)
			k = k/2;
		else 
			coroutine.yield(k)
			k = (3*k)+1
		end
		end
	end

return pa2 		--Return the module

