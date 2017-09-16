import Control.Arrow

data ServerInfo = ServerInfo Int Int

solve k = lines
  >>> map read
  >>> maxInterval 0 []
  >>> getServers k
  >>> show
  >>> putStrLn

maxInterval :: Int -> [Int] -> [Int] -> Int
maxInterval maxRequest _ [] = maxRequest
maxInterval maxRequest currentStack (r:requests)
  | null currentStack =
    maxInterval 1 (r:currentStack) requests
  | compareRequests r currentStack =
    maxInterval (nextStackAddOne maxRequest currentStack) (r:currentStack) requests
  | otherwise =
    maxInterval (nextStack maxRequest currentStack) (r:(init currentStack)) requests
  where
    compareRequests r s = r - last s < 1000
    nextStackAddOne m s = max m (length s + 1)
    nextStack m s = max m (length s)

getServers k m = round $ (fromIntegral m) / (fromIntegral k)

main = do
  serverInfo <- getLine
  requests <- getContents
  let (_:k:[]) = map read $ words serverInfo
  solve k requests
