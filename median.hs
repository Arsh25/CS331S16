module Main where 
import System.IO

main = do
    putStrLn ("I will compute the median of the list.")
    -- numlist

numlist = do	
    -- putStrLn "Enter number (blank line to end):"
    input <- getLine 
    if input == "" 
		then 
		    return []
	    else do
		    let num = read input :: Int
            nextNum <- numlist
		    return (num : nextNum)