module Main where 
import System.IO
import Data.List

main = do
    putStrLn "I will compute the median of the list."
    ans <- median
    putStr "Median is :"
    hFlush stdout
    print (ans)

numlist = do	
    putStrLn "Enter number (blank line to end):"
    input <- getLine
    if input == "" 
        then 
            return []
        else do
            let num = read input :: Int
            nextNum <- numlist
            return (num:nextNum)
median = do
    nums <- numlist
    sortedNums <- listsort (nums)
    len <- listlen (sortedNums)
    mid <- mid (len)
    return (sortedNums !! mid)

listsort thelist = do
    return (sort thelist)
    
listlen thelist = do
    return (length thelist )

mid len = do
    return (div len 2)
            

	   