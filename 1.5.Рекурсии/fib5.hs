module Fib5 where

  fibonacci :: Integer -> Integer
  fibonacci n
          | n == 0 = 0 | n == abs(1) = 1
          | n >= 0  = fibonacci (n - 1) + fibonacci (n - 2)
          | otherwise = fibonacci (n + 2) - fibonacci (n + 1)
