# comptime
zig `comptime` implementation in haskell


Example ./src/MyLib.hs
```
  import CompTime
  
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

```

> [!note]
> It currently uses Haskell TH

# Testing
`cabal bench`
### verification
`cabal build --ghc-options="-ddump-simpl"`
### Running
```
cabal build
cabal run
```

# Installation
- Includes `shell.nix`
  run `nix-shell` to initialize
- Add the library to your .cabal file:
```
  build-depends:
    base >= 4.14 && < 4.18,
    template-haskell >= 2.18 && < 2.20
```

# License
`MIT-LICENSE`
