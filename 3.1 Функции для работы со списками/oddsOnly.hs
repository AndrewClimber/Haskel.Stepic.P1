{-
Сформируйте список целых чисел, содержащий только те элементы исходного списка, значение которых нечетно.

GHCi> oddsOnly [2,5,7,10,11,12]
[5,7,11]
Для анализа четности можно использовать функции odd и even стандартной библиотеки.
-}

oddsOnly :: Integral a => [a] -> [a]

-- мои
oddsOnly [] =[]
oddsOnly (x:xs) =  if even x then ys else x : ys 
          where ys = if null xs then [] else oddsOnly xs

oddsOnly' [] =[]
oddsOnly' (x:xs) | even x = ys   | odd x = x : ys 
        where ys | null xs = []  | otherwise = oddsOnly' xs

-- мое решение с помощью генератора списков И pattern matching
oddsOnly'' [] = []
oddsOnly'' (x:xs) = [x | x <- x:xs, odd x]

oddsOnly''' = filter odd

--- stepik
-- хороший вариант, но без сопоставления с образцом
oddsOnly'''' = \xs -> [x | x <- xs, odd x]

-- блее элегантное - чем мои два первых
oddsOnly''''' [] = []
oddsOnly''''' (x:xs)
    | even x    = oddsOnly''''' xs
    | otherwise = x: oddsOnly''''' xs