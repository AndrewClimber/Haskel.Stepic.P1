{-
Реализуйте функцию meanList, которая находит среднее значение элементов списка, используя однократный вызов функции свертки.

GHCi> meanList [1,2,3,4]
2.5
Постобработка считается допустимой, то есть предполагаемая реализация функции meanList имеет вид

meanList = someFun . foldr someFoldingFun someIni
-}
-- aka
meanList :: [Double] -> Double
meanList s = (/) (foldr (+) 0 s ) (fromIntegral $ length s)

-- stepik
meanList :: [Double] -> Double
meanList = (\(s,c) -> s / c) . foldr (\x (s,c) -> (s + x, c + 1)) (0,0)

-- непонятно
import Control.Arrow
meanList :: [Double] -> Double
meanList = uncurry (/) . foldr ((*** succ) . (+)) (0, 0)