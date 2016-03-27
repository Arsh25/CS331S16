module PA5 where 
import Data.List

collatz num
    | num == 0 = 0
    | mod num 2 == 0 = div num 2
    | otherwise = 3*num+1
    
collatzSeq num 
    | num == 1 = 0
    | collatz num == 1 = 1
    | otherwise = 1 + collatzSeq (collatz num)

collatzCounts = map collatzSeq [1..]

findList :: Eq a => [a] -> [a] -> Maybe Int
findList list1 list2 = findIndex (isPrefixOf list1) (tails list2)

search :: Eq a => [[a]] -> Integer
search list 
    | list == []  = 0
    | length (head list) <= 1 = 0
    | head (head list) == last (head list) = 1 + search (tail list)
    | otherwise = search (tail list)

list1 ## list2 = n where
    transposedList = transpose [list1, list2]
    n = search (transposedList)


getTuplefirst (a,_) = a
getTuplesecond (_,b) = b

filterAB fn list1 list2 = anslist where 
    pairedList = zip list1 list2
    trueList = filter (fn.fst) pairedList
    anslist = getTuplesecond (unzip trueList)
    
    
    
parts [] = ([], [])
parts [x] = ([x],[])
parts (x:y:xs) = (x:xp, y:yp ) where (xp, yp) = parts xs


sumEvenOdd list = tuple where
    tupleParts = parts list
    evenSum = foldr (+) 0 (getTuplefirst tupleParts)
    oddSum = foldr (+) 0 (getTuplesecond tupleParts)
    tuple = (evenSum, oddSum)
    
    


    
    