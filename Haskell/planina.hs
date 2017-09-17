import Control.Arrow

main = do
  n <- getLine
  io n

io = read
  >>> solve 3
  >>> (^ 2)
  >>> show
  >>> putStrLn

solve a 1 = a
solve a n = solve (a + a - 1) (n - 1)
