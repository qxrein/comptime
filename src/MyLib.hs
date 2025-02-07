{-# LANGUAGE TemplateHaskell #-}
module MyLib where

import CompileTime

-- Precompute the first 100 Fibonacci numbers at compile time
fibList :: [Int]
fibList = $(compileTimeFibList 100)

-- Function to get the nth Fibonacci number from the precomputed list
getFib :: Int -> Int
getFib n
    | n >= 0 && n < length fibList = fibList !! n
    | otherwise = error "Index out of bounds"

-- Example usage of compile-time evaluation
constantExample :: Int
constantExample = $(compileTimeEval 5)
