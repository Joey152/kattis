import Control.Arrow

main = do
  input <- getLine
  matches <- getContents
  let (n:w:h:[]) = map read $ words input
  let box = hyp w h
  solve box matches

hyp :: Float -> Float -> Float
hyp w h = sqrt $ (w ^ 2) + (h ^ 2)

solve box = lines
  >>> map read
  >>> map (<= box)
  >>> map comp
  >>> unlines
  >>> putStrLn

comp x = if x
  then "DA"
  else "NE"
