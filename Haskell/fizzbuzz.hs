import Control.Arrow

main = do
  input <- getLine
  let (x:y:n:[]) = map read $ words input
  putStrLn $ solve x y n

solve :: Int -> Int -> Int -> String
solve x y n = unlines $ map (fizzbuzz x y) [1..n]

fizzbuzz x y n
  | n `mod` x == 0 = "Fizz"
  | n `mod` y == 0 = "Buzz"
  | n `mod` x == 0 && n `mod` y == 0 = "FizzBuzz"
  | otherwise = show n
