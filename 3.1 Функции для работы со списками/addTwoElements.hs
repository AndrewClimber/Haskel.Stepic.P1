{-
Реализуйте функцию addTwoElements, которая бы добавляла два переданных ей значения в голову переданного списка.

GHCi> addTwoElements 2 12 [85,0,6]
[2,12,85,0,6]
-}

addTwoElements :: a -> a -> [a] -> [a]
-- мой
addTwoElements a b p = a : b : p

-- степик
addTwoElements x = ((:) x .) . (:)

addTwoElements x y = (++) [x, y]

addTwoElements a b = (a :) . (b :)
