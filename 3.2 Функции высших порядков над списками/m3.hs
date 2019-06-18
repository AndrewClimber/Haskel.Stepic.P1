{-
Напишите функцию max3, которой передаются три списка чисел одинаковой длины
и которая возвращает список чисел той же длины, содержащий на k-ой позиции
наибольшее значение из чисел на этой позиции в списках-аргументах.
GHCi> max3 [7,2,9] [3,6,8] [1,8,10]
[7,8,10]

GHCi> max3 [7,2,9,11] [3,6,8,12] [1,8,10,13]
[7,8,10,13]
-}

import Data.List

-- мое решение. Когда плохо знаешь Prelude или Data.List
max3 :: Ord a => [a] -> [a] -> [a] -> [a]
max3 a1 a2 a3 = maxi3 a1 a2 a3 where
    maxi3 a1 a2 a3 = map maximum  (concat3 0 (length a1)) where
        elpos3 n1 n2 n3 = [glu3 !! n1 , glu3 !! n2 , glu3 !! n3]
        glu3 = a1 ++ a2 ++ a3
        concat3 n l | n < l = ([(elpos3 n l (n+l+l))] ++ (concat3 (n+1) l))
                    | otherwise = []
        
-- stepik
max3' a1 a2 a3 = map maximum $ transpose [a1, a2, a3]

max3'' x y z = map (\(x',y',z') -> max z' $ max x' y') $ zip3 x y z

-- как это работает не понял.
max3''' = zipWith3 ((max .) . max)