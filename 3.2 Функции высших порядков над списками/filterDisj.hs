{-
Реализуйте функцию filterDisj, принимающую два унарных предиката и список, и возвращающую список элементов, 
удовлетворяющих хотя бы одному из предикатов.

GHCi> filterDisj (< 10) odd [7,8,10,11,12]
[7,8,11]
-}


filterDisj :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filterDisj _ _ [] = []
filterDisj p1 p2 (x:xs) | p1 x || p2 x = x : filterDisj p1 p2 xs
                        | otherwise = filterDisj p1 p2 xs 

-- stepik
-- решение с помощью созданя своего оператора. Понравилось.
filterDisj :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filterDisj p1 p2= filter ( (<!>) (||) p1 p2)

(<!>) :: ( b -> b -> c) -> ( a -> b) -> ( a -> b) -> a -> c
(<!>) op f1 f2 x = op (f1 x) (f2 x)                         

---------------------------------------------------
filterDisj :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filterDisj p1 p2 = filter (\x -> p1 x || p2 x)
