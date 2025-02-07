import Criterion.Main
import MyLib

main :: IO ()
main = defaultMain
    [ bench "getFib 10" $ whnf getFib 10
    , bench "getFib 50" $ whnf getFib 50
    , bench "getFib 99" $ whnf getFib 99
    ]
