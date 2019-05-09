{-
Будем задавать точки на плоскости парами типа (Double, Double). Реализуйте функцию dist, которая возвращает расстояние между
двумя точками, передаваемыми ей в качестве аргументов.

dist :: (Double, Double) -> (Double, Double) -> Double
dist p1 p2 = ???
-}
-- мое решение. увы пока слишком императивное
dist :: (Double, Double) -> (Double, Double) -> Double
dist p1 p2 = sqrt( (fst p1 - fst p2)^2 + (snd p1 - snd p2)^2 )


{-
еще решения

Вот этот вариант похож на sql запрос !
dist :: (Double, Double) -> (Double, Double) -> Double
dist p1 p2 = sqrt $ x + y
    where x = (fst p1 - fst p2) ^ 2
          y = (snd p1 - snd p2) ^ 2

------------------------------------------------
Почти без скобок !
dist :: (Double, Double) -> (Double, Double) -> Double
dist (x1,y1) (x2,y2) = sqrt . sum . map (^2) $ [x1 - x2, y1 - y2]

------------------------------------------------
Прикольно . Но громоздко
infixl 6 *+*
a *+* b = a ^ 2 + b ^ 2

infixl 6 |-|
a |-| b = abs (a - b)

dist :: (Double, Double) -> (Double, Double) -> Double
dist p1 p2 = sqrt $ (fst p1 |-| fst p2) *+* (snd p1 |-| snd p2)

------------------------------------------------

dist :: (Double, Double) -> (Double, Double) -> Double
dist p1 p2 = sqrt $ (+) (dx ^ 2) (dy ^ 2)  where
   dx = snd p2 - snd p1
   dy = fst p2 - fst p1

------------------------------------------------
dist :: (Double, Double) -> (Double, Double) -> Double
dist p1 p2 = sqrt $ (^) (fst p1 - fst p2) 2 + (^) (snd p1 - snd p2) 2


-}
