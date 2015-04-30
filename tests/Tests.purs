module Tests where

import Control.Bind
import Debug.Trace
import Data.Array (range)
import Data.Foldable (sum)

import Benchmark.Trivial

main = print =<< trials 100 (\_ -> sum $ range 0 10000)
