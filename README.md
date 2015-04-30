# Module Documentation

## Module Benchmark.Trivial

#### `Time`

``` purescript
data Time :: !
```


#### `timestamp`

``` purescript
timestamp :: forall t. Eff (time :: Time | t) Number
```


#### `trials`

``` purescript
trials :: forall a t. Number -> (Unit -> a) -> Eff (time :: Time | t) (Tuple Number Number)
```


#### `trial`

``` purescript
trial :: forall a t. (Unit -> a) -> Eff (time :: Time | t) Number
```


#### `expected`

``` purescript
expected :: [Number] -> Number
```