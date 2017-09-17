import Control.Arrow
import Data.List as List

main = do
  input <- getLine
  let (a:_:b:_:[]) = List.sort $ map read $ words input
  io a b

io a b = putStrLn $ show $ solve a b

solve :: Int -> Int -> Int
solve a b = a * b
