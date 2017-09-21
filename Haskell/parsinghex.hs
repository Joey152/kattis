import Control.Arrow

main = do
  input <- getContents
  io input

io = lines
  >>> solve
  >>> unlines
  >>> putStrLn

solve :: [String] -> [String]
solve = map parseHex
  >>> concat
  >>> zipDec
  >>> map tupleToString

zipDec :: [String] -> [(String, String)]
zipDec x = zip (map show $ map (+0) $ map read x) x

tupleToString :: (String, String) -> String
tupleToString (dec, hex) = hex ++ " " ++ dec

parseHex :: String -> [String]
parseHex str = parseHex' str "" []

parseHex' :: String -> String -> [String] -> [String]
parseHex' "" "" acc = acc
parseHex' "" hex acc
  | length hex > 2 = acc ++ [hex]
  | otherwise = acc
parseHex' (x:xs) hex acc
  | length hex >= 10 =
    parseHex' (x:xs) "" (acc ++ [hex])
  | x == '0' && length xs > 1 && (head xs) `elem` ['x','X'] =
    parseHex' (tail xs) ('0':[(head xs)]) acc
  | hex == "" =
    parseHex' xs "" acc
  | x `elem ` (['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F']) =
    parseHex' xs (hex ++ [x]) acc
  | length hex > 2 =
    parseHex' xs "" (acc ++ [hex])
  | otherwise =
    parseHex' xs "" acc
