{-
Напишите функцию squares'n'cubes, принимающую список чисел, 
и возвращающую список квадратов и кубов элементов исходного списка.
GHCi> squares'n'cubes [3,4,5]
[9,27,16,64,25,125]
-}

--- мое решение
squares'n'cubes :: Num a => [a] -> [a]
squares'n'cubes   = concatMap (\x -> [x^2, x^3]) 

--- stepik
squares'n'cubes2 :: Num a => [a] -> [a]
squares'n'cubes2 [] = []
squares'n'cubes2 (x:xs) = (^2) x : (^3) x : squares'n'cubes2 xs 