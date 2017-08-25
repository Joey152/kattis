readIntList :: [String] -> [Int]
readIntList = map read

solve :: [Int] -> Int
solve [a,b] = a * (b - 1) + 1

main = do
  input <- getLine
  putStrLn . show . solve . readIntList . words $ input
