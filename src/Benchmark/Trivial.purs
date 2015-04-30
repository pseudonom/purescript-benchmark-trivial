module Benchmark.Trivial where

import Control.Monad
import Control.Monad.Eff
import Data.Array (length)
import Data.Foldable (sum)
import Data.Tuple
import Math

foreign import data Time :: !
foreign import timestamp """
  function timestamp() {
    return Date.now();
  }
""" :: forall t. Eff (time :: Time | t) Number

trials :: forall a t. Number -> (Unit -> a) ->
          Eff (time :: Time | t) (Tuple Number Number)
trials n f = do
  ts <- replicateM n $ trial f
  let avg = expected ts
  let stdDev = sqrt <<< expected $ (\t -> pow (t - avg) 2) <$> ts
  pure $ Tuple avg stdDev

trial :: forall a t. (Unit -> a) -> Eff (time :: Time | t) Number
trial f = do
  t1 <- timestamp
  let a = f unit
  t2 <- timestamp
  pure $ t2 - t1

expected :: [Number] -> Number
expected ns = sum ns / length ns
