-- PA5.hs
-- Arsh Chauhan
-- Source code for Assn5, Ex B
-- 03/29/2015

-- Haskell module to ask the user for a list of numbers 
-- and caluclate the median

-- Invariants:
--    All input must be integers. Does not handle floating point 
--    Will think the list is empty if median is 9999999999
import System.IO
import Data.List
import Data.Char
import Data.Int

main = do
    putStrLn "Enter a list of numbers"
    ans <- median
    hFlush stdout
    if ans == 9999999999
        then
            putStrLn ("Empty List: No Median")
        else do
            putStr "Median is :"
            print (ans)
            
    hFlush stdout
    
    putStrLn "Do you want to run this program again? (yes/no) "
    startOver <- getLine
    if map toLower startOver == "yes"
        then 
            main
        else do
            putStrLn "Thank You for using this program."
        
-- Pre: Must enter atleast 1 number
-- Post: Returns a list of Integers
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

--Pre: length of passed list >= 1
--Post: Returns median of list
--     Returns the mid element for even lists. 
--     This meets the requirement for the assignment but is is mathematically correct  


median = do
    putStrLn "I will now compute the median"
    nums <- numlist
    if length nums == 0
        then
            return 9999999999
            --error ("Empty List: No median") -- Exit with error message
        else do 
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
            

	   