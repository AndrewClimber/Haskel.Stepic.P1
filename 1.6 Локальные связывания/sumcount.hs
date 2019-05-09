-- Задачка
{- Реализуйте функцию, находящую сумму и количество цифр десятичной записи заданного целого числа.

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x = undefined
GHCi> sum'n'count (-39)
(12,2)
-}
--import Data.Char

{-
Для строки без пробелов нам нужно преобразовать каждый Char в одноэлементный список. 
Это можно сделать, применив к нему (:"") - a String - это всего лишь список Char s. 
Затем мы применяем read снова, как и раньше:
http://qaru.site/questions/768675/how-do-i-convert-string-into-list-of-integers-in-haskell
-}
sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x =  (mySum $ x, myLen $ x ) where
    myLen x | x >= 0 = lenx x
            | otherwise = lenx $ absx x  where 
                lenx x = toInteger . length $ show x
    mySum x | x < 0 = sumx $ absx x
            | otherwise = sumx $ x where 
        sumx x = sum (map (read . (:"")) (show x) :: [Integer])
    absx x = x * (-1)
        

-- решения со степика
import Data.Char

sum'n'count' :: Integer -> (Int, Int)
sum'n'count' x = (sum $ digits x, length $ digits x) 
    where
        digits = map digitToInt . show . abs

-------------------------------------------------
sum'n'count'' :: Integer -> (Integer, Integer)
sum'n'count'' x = helper (0, 0, abs(x))
  where
    helper (n, sum, x)
      | x < 10 = (x + sum, n + 1)
      | otherwise = helper(n + 1, sum + x `mod` 10, x `div` 10)
----------------------------------------
-- нифига не понял
import Control.Arrow

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count = abs >>> show >>> map (read . return) >>> sum &&& toInteger . length      