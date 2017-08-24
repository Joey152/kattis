writeOutput answer = do
  (putStrLn . show) answer

convert :: [String] -> [Int]
convert = map read

solve [n,p] = p
solve (n:_:p) = sum [n - x | x <- p] + n

main = do
  input <- getContents
  (writeOutput . solve . convert . lines) input
