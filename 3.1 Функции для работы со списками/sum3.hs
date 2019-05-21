import Data.List (transpose)
{-
Составьте список сумм соответствующих элементов трех заданных списков. Длина результирующего списка должна быть равна длине самого 
длинного из заданных списков, при этом «закончившиеся» списки не должны давать вклада в суммы.

GHCi> sum3 [1,2,3] [4,5] [6]
[11,7,3]
-}



sum3 :: Num a => [a] -> [a] -> [a] -> [a]
{-
sum3  (a:as) (b:bs) (c:cs) = if null as && null bs && null cs  then [] else a + b + c : sum3 (isNull as) (isNull bs) (isNull cs) where
    isNull ns = if null ns then [0] else ns
sum3 _ _ _ = []
-}
-- мое решение
sum3 = \as bs cs -> [sum x | x <- transpose $ [as,bs,cs]]

-- stepik
sum3' :: Num a => [a] -> [a] -> [a] -> [a]
sum3' a b c = map sum (transpose [a,b,c])

sum3'' a b c = ((map sum) . transpose) [a,b,c]

{-
sum3 :: Num a => [a] -> [a] -> [a] -> [a]
sum3 [] [] [] = []
sum3 [] ys zs = sum3 [0] ys zs
sum3 xs [] zs = sum3 xs [0] zs
sum3 xs ys [] = sum3 xs ys [0]
sum3 (x:xs) (y:ys) (z:zs) = x+y+z : sum3 xs ys zs

-- через sum2
sum3 :: Num a => [a] -> [a] -> [a] -> [a]
sum3 xs ys zs = xs `sum2` ys `sum2` zs
  where
    sum2 [] bs = bs
    sum2 as [] = as
    sum2 (a : as) (b : bs) = (a + b) : sum2 as bs



    -}