module Demorecurs where

  -- пример рекурсии
  factorial n = if n == 0 then 1 else n * factorial (n - 1)


-- Но вместо if then else использовать сопоставление с образцом.
-- для этого придется переписать факториал с помощью двух уравнений
  factorial' 0 = 1
  factorial' n = n * factorial' (n - 1)

  factorial'' 0 = 1
  factorial'' n | n < 0 = error "arg must be > 0" | otherwise = n * factorial' (n - 1)

  {-
Определите функцию, вычисляющую двойной факториал, то есть произведение натуральных чисел, не превосходящих заданного числа и имеющих ту же четность.
Например: 7!!=7⋅5⋅3⋅1,  8!!=8⋅6⋅4⋅2. Предполагается, что аргумент функции может принимать только неотрицательные значения.
-}

  doubleFact :: Integer -> Integer
  doubleFact n = if n == 0 || n < 0 then 1 else n * doubleFact (n - 2)

  doubleFact' :: Integer -> Integer
  doubleFact' n | n == 0 = 1 | n < 0 = 1 | otherwise = n * doubleFact' (n - 2)
  {-
  Без охранников
  doubleFact :: Integer -> Integer
  doubleFact 0 = 1
  doubleFact 1 = 1
  doubleFact n = n * doubleFact (n - 2)

  пока не знаю этой функции.
  doubleFact :: Integer -> Integer
  doubleFact n = product [n, n - 2 .. 1]

  doubleFact :: Integer -> Integer
  doubleFact n | n > 0     = n * (doubleFact (n-2))
               | otherwise = 1

  doubleFact :: Integer -> Integer
  doubleFact n
          | n <= 1 = 1
          | otherwise = n * doubleFact(n - 2)

  -}




  fibonacci 0 = 0
  fibonacci 1 = 1
  fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Задачка. Фиббоначи для положительных и отрицательных
  fibonacci' :: Integer -> Integer
  fibonacci' n
          | n == 0 = 0 | n == 1 = 1 | n == (-1) = 1
          | n >= 0  = fibonacci' (n - 1) + fibonacci' (n - 2)
          | otherwise = fibonacci' (n + 2) - fibonacci' (n + 1)

  

{-
Другие решения
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n | n > 1 = sum . map fibonacci $ [n - 1, n - 2]
            | n < 0 = foldl1 (-) . map fibonacci $ [n + 2, n + 1]

Вот этот вариант не понял
fibonacci :: Integer -> Integer
fibonacci n = if n < 0 then (-1)^abs(n + 1) * helper 0 1 (abs n) else (helper 0 1 n) where
                      helper curr next counter = if counter == 0 then curr else helper next (next + curr) (counter - 1)

красиво !!
fibonacci :: Integer -> Integer
fibonacci n | n == 0 = 0
            | abs(n) == 1 = 1
            | n < -1 = -fibonacci(n+1) + fibonacci(n+2)
            | otherwise = fibonacci(n-1) + fibonacci(n-2)

-}

-- Факториал с аккумулятором
{-
  factorial5 n | n >= 0 = helper1 1 n
               | otherwise = error "arg < 0 !"

  helper1 acc 0 = acc
  helper1 acc n = helper1 (acc * n) (n - 1)
-}
