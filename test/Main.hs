module Main where

import MyLib

main :: IO ()
main = do
    -- Print the 10th Fibonacci number from the precomputed list
    print (getFib 10)

    -- Print the entire precomputed Fibonacci list
    print fibList

    -- Print the result of compile-time evaluation
    print constantExample
