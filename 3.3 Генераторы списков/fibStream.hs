{-
Реализуйте c использованием функции zipWith функцию fibStream, возвращающую бесконечный список чисел Фибоначчи.

GHCi> take 10 $ fibStream
[0,1,1,2,3,5,8,13,21,34]
-}
{-
fibStream :: [Integer]
fibStream = fib 0 1 where
    fib n1 n2 | (n1 == 0 && n2 ==1) = [0,1,1] ++ fib (2) (3)
              | otherwise =  (zipWith (+) [n1] [n2]) ++ fib (n1+1) (n2+1)
-}

--fibStream :: [Integer]
fibStream n = 0:1:zipWith (+) [(fibStream !! n)] [(fibStream !! (n+1))]




fibStream' :: [Integer]
fibStream' = fs 0 where 
    fs n = fibonacci (n) : fs (n+1) where 
        fibonacci 0 = 0
        fibonacci 1 = 1
        fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)


