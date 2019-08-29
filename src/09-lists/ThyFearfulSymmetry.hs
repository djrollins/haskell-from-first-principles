module ThyFearfulSymmetry where

splitOn :: Char -> String -> [String]
splitOn _ "" = []
splitOn c s = head : splitOn c tail
  where head = takeWhile (/=c) s
        tail = dropWhile (==c) . dropWhile (/=c) $ s

myWords :: String -> [String]
myWords = splitOn ' '

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen
          ++ thirdSen ++ fourthSen

myLines :: String -> [String]
myLines = splitOn '\n'

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]

main :: IO ()
main =
  print $
  "Are they equal? "
  ++ show (myLines sentences == shouldEqual)
