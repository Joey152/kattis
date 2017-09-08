import Control.Arrow
import Data.Char
import Data.Function

solve :: Int -> Int
solve num
  | mod10 && mod100 && mod1000 && mod10000 && mod100000 = num - 100000
  | mod10 && mod100 && mod1000 && mod10000 = num - 10000
  | mod10 && mod100 && mod1000 = num - 1000
  | mod10 && mod100 = num - 100
  | mod10 = num - 10
  | otherwise = num - 1
  where
    mod10 = num `mod` 10 == 0
    mod100 = num `mod` 100 == 0
    mod1000 = num `mod` 1000 == 0
    mod10000 = num `mod` 10000 == 0
    mod100000 = num `mod` 100000 == 0

main = do
  ignore <- getLine
  input <- getContents
  input & (
    lines
    >>> map read
    >>> map solve
    >>> map show
    >>> unlines
    >>> putStrLn)
