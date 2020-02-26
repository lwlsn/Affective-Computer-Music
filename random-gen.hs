module Main (
  main
  ) where

import qualified Data.Vector.Unboxed as V
import Data.Random.Source.PureMT
import Data.Random
import Control.Monad.State

nItt :: Int
nItt = 1000000000

gridSize :: Int
gridSize = 10

testData :: Int -> V.Vector Double
testData m =
  V.fromList $
  evalState (replicateM m (sample (uniform (0 :: Double) 1.0)))
  (pureMT 2)

test = V.foldl (+) 0 (testData nItt)

main = putStrLn $ show test
