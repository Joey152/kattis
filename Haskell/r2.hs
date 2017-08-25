solve :: [Int] -> Int
solve [r,s] = s * 2 - r

readIntList :: [String] -> [Int]
readIntList = map read

main = do
  input <- getLine
  (putStrLn . show . solve . readIntList . words) input
