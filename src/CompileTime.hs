{-# LANGUAGE TemplateHaskell #-}
module CompileTime where

import Language.Haskell.TH
import Language.Haskell.TH.Syntax

-- Efficient compile-time Fibonacci
compileTimeFib :: Int -> Q Exp
compileTimeFib n = do
    let result = fib n
    litE (integerL (fromIntegral result))
  where
    fib n = fibs !! n
    fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- Generate a list of Fibonacci numbers at compile time
compileTimeFibList :: Int -> Q Exp
compileTimeFibList n = do
    let fibList = take n fibs
    listE (map (litE . integerL . fromIntegral) fibList)
  where
    fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- Compile-time constant folding
compileTimeEval :: Int -> Q Exp
compileTimeEval x = do
    let result = x * 2 + 3
    litE (integerL (fromIntegral result))
