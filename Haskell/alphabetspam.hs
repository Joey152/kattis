import Control.Arrow
import Data.Function

solve :: [Int] -> String -> [Int]
solve acc "" = acc
solve [a,b,c,d] (h:rest)
  | h `elem` ['_'] = solve [a+1,b,c,d] rest
  | h `elem` ['a'..'z'] = solve [a,b+1,c,d] rest
  | h `elem` ['A'..'Z'] =  solve [a,b,c+1,d] rest
  | otherwise = solve [a,b,c,d+1] rest

rate :: Double -> Double -> Double
rate total x = x / total

findChar :: [Char] -> Int
findChar range = length [x | x <- range]

main = do
  input <- getLine
  input & (
    solve [0,0,0,0]
    >>> map fromIntegral
    >>> map (rate (fromIntegral (length input)))
    >>> map show
    >>> unlines
    >>> putStrLn)
  -- (putStrLn . unlines . (map show) . (solve (0,0,0,0))) input
