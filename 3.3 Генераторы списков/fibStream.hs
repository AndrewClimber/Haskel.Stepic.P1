{-
Реализуйте c использованием функции zipWith функцию fibStream, возвращающую бесконечный список чисел Фибоначчи.

GHCi> take 10 $ fibStream
[0,1,1,2,3,5,8,13,21,34]
-}
-- моё
fibStream :: [Integer]
fibStream = 0:1:zipWith (+) fibStream (tail fibStream)

-- stepik
fibStream' = 0 : 1 : zipWith (+) fibStream' (drop 1 fibStream')

-- без zipWith
fibStream'' = helper 0 1  where 
        helper a b = a : helper b (a + b)


-- Прикольно
fibStream''' = zipWith (+) (0:fibStream''') (0:1:fibStream''')

fibStream'''' = 0 : zipWith (+) fibStream'''' (1 : fibStream'''')