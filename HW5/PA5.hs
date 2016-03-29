-- PA5.hs
-- Arsh Chauhan
-- Source code for Assn5, Ex B
-- 03/29/2015



module PA5 where
-- For list operations (findIndex, isPrefixOf, zip, transpose)
import Data.List


-- collatz: Compute collatz number for num
-- Helper function for collatzCounts: Do not use externally
collatz num
    | num == 0 = 0
    | mod num 2 == 0 = div num 2
    | otherwise = 3*num+1


-- collatzSeq: returns how many times collatz had to be called to take num to num+1
-- Helper function for collatzCounts: Do not use externally 
collatzSeq num 
    | num == 1 = 0
    | collatz num == 1 = 1
    | otherwise = 1 + collatzSeq (collatz num)

-- collatzCounts: Maps an infitie list to collatzseq
-- Lazy evaluation: Only calls collatzSeq for the passed list
-- Call from external modules 
collatzCounts = map collatzSeq [1..]


-- findlist: Check if list1 is a consecutive sublist of list2
-- Returns the index where the consecutive sublist begins
-- If no sublist is found, then returns Nothing 
findList :: Eq a => [a] -> [a] -> Maybe Int -- Declaration: Takes 2 lists and returns a Maybe Int 
findList list1 list2 = findIndex (isPrefixOf list1) (tails list2)

-- search: helper function for ## operator 
-- Given a list of lists, returns the number of times the first and second element are equal 
-- Designed to only work on sublists of 2 elements 
search :: Eq a => [[a]] -> Integer
search list 
    | length list == 0  = 0
    | length (head list) <= 1 = 0
    | head (head list) == last (head list) = 1 + search (tail list)
    | otherwise = search (tail list)

-- operator ## : Takes 2 lists and returns the number of times elements in equal indices are equal 
list1 ## list2 = n where
    n = search (transpose [list1, list2])

--given a tuple, retrieve the first or second element
getTuplefirst (first,_) = first
getTuplesecond (_,second) = second

-- filterAB: Takes a boolean function and 2 lists 
-- Runs the passed function (fn) against all elements in first list
-- Returns a list consisting of all elements in the second list for 
-- whose corresponding index value in the first list returned true for fn 
filterAB fn list1 list2 = anslist where 
    pairedList = zip list1 list2
    trueList = filter (fn.fst) pairedList
    anslist = getTuplesecond (unzip trueList)
    
    
--parts: generate a tuple from a list
parts [] = ([], [])
parts [x] = ([x],[])
parts (x:y:xs) = (x:xp, y:yp ) where (xp, yp) = parts xs

-- sumEvenOdd: takes a list 
-- Returns a tuple, first value is sum of all even indices and second value is sum of odd indices
sumEvenOdd list = tuple where
    tupleParts = parts list
    evenSum = foldr (+) 0 (getTuplefirst tupleParts)
    oddSum = foldr (+) 0 (getTuplesecond tupleParts)
    tuple = (evenSum, oddSum)
    
    


    
    