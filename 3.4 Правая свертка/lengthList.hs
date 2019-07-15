{-
Используя функцию foldr, напишите реализацию функции lengthList, вычисляющей 
количество элементов в списке.

GHCi> lengthList [7,6,5]
3
-}


--foldr f ini [] = ini 
--foldr f ini (x:xs) = x `f` foldr f ini xs 

--sumPositiveSquares :: [Integer] -> Integer
--sumPositiveSquares = foldr (\x s -> if x > 0 then x^2 + s else s) 0

lengthList :: [a] -> Int
lengthList = foldr (\_ acc -> acc+1) 0

-- stepik
lengthList :: [a] -> Int
lengthList = foldr (\_ -> (+1)) 0

--- я не понимаю как это работает !
lengthList :: [a] -> Int
lengthList = foldr (const succ) 0
