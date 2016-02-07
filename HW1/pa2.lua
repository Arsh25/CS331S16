--[[
	pa2.lua
	Arsh Chauhan
	06/02/2016
	module pa2.lua for assignment 2
  ]]


local pa2 = {}	-- Our module 


--concatLimit
--Pre: None 
--Post: Concatenates the passed string, totalCopies times
--			totalCopies = math.floor(num - str:size() / size )

function pa2.concatLimit(str, num)
	size = str:len()
	origStr = str
	totalCopies = math.floor((num - size)/size) 
	if (totalCopies < 0)
		then return ""
	end
	
	if (totalCopies == 0) 
		then return str
	else 
		copies = 0
		while(copies < totalCopies)  do
			str = str..origStr
			copies = copies + 1
		end
		return str
		
	end
	
end

--filterTable
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
	
--collatzSeq
--Pre: None
--Post: Returns collatz numbers starting at n
function pa2.collatzSeq(k) 
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

