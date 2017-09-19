import Control.Arrow
import qualified Data.Set as Set

main = do
  input <- getContents
  io input

io = lines
  >>> map read
  >>> solve
  >>> show
  >>> putStrLn

solve :: [Int] -> Int
solve = map (\x -> x `mod` 42)
  >>> getDistinct

getDistinct :: [Int] -> Int
getDistinct = Set.fromList
  >>> length
