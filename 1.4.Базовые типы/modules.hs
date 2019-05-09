module Modules where


import Data.Char

-- задачка
{-
Реализуйте функцию twoDigits2Int, которая принимает два символа и возвращает число, составленное из этих символов, если оба символа числовые,
и 100 в противном случае. (Первый символ рассматривается как количество десятков, второй — единиц.)
GHCi> twoDigits2Int
-}
twoDigits2Int :: Char -> Char -> Int
twoDigits2Int x y =
  if isDigit x && isDigit y
    then digitToInt x * 10 + digitToInt y
    else 100

{-

другие решения

import Data.Char
twoDigits2Int :: Char -> Char -> Int
twoDigits2Int x y = if (&&) (isDigit x) (isDigit y) then ((digitToInt x) * 10) + digitToInt y else 100


import Data.Char
twoDigits2Int :: Char -> Char -> Int
twoDigits2Int x y
  | isDigit x && isDigit y = (digitToInt x * 10) + (digitToInt y)
  | otherwise = 100

-}
