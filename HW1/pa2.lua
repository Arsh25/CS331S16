local pa2 = {}


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
	if(k == 1)then 
		--coroutine.yield(1)
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
end

return pa2

