module HW01 where
{-- Validating Credit Card Numbers --}


-- Exercise 1

toDigits :: Integer -> [Integer]
toDigits x
      |x <= 0 = []
      |x > 0  = toDigits (x `div` 10) ++ [x `mod` 10]

digitsRev :: [Integer] -> [Integer]
digitsRev (x:xs)
  |xs == [] = [x]
  |xs /= [] = (digitsRev xs) ++ [x]

toDigitsRev :: Integer -> [Integer]
toDigitsRev x = digitsRev $ toDigits x

-- Exercise 2

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther (x:xs)
  |(length xs) `mod` 2 == 0 = x : doubleEveryOther xs
  |otherwise              = x*2 : doubleEveryOther xs
-- Exercise 3

sumFigure :: Integer -> Integer
sumFigure x
        |x <= 0 = 0
        |x > 0  = (x `mod` 10) + sumFigure (x `div` 10)

sumFigures :: [Integer] -> [Integer]
sumFigures [] = []
sumFigures (x:xs) = sumFigure x : sumFigures xs

sumDigits :: [Integer] -> Integer
sumDigits (x:[]) = sumFigure x
sumDigits (x:xs) = sumFigure x + sumDigits xs

-- Exercise 4

validate :: Integer -> Bool
validate x
  |(sumDigits $ doubleEveryOther $ toDigits x) `mod` 10 == 0 = True
  |otherwise                   = False



{-- The Towers of Hanoi --}

-- Exercise 5

type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi n start goal tmp
  | n <= 0    = []
  | n == 1    = [(start, goal)]
  | otherwise = hanoi (n-1) start tmp goal ++ hanoi 1 start goal tmp ++ hanoi (n-1) tmp goal start


-- Exercise 6 (Optional)
