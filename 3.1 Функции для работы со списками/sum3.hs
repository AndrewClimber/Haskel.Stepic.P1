{-
Составьте список сумм соответствующих элементов трех заданных списков. Длина результирующего списка должна быть равна длине самого 
длинного из заданных списков, при этом «закончившиеся» списки не должны давать вклада в суммы.

GHCi> sum3 [1,2,3] [4,5] [6]
[11,7,3]
-}

--oddsOnly'''' = \xs -> [x | x <- xs, odd x]
--oddsOnly'' (x:xs) = [x | x <- x:xs, odd x]
--oddsOnly (x:xs) =  if even x then ys else x : ys 
          --where ys = if null xs then [] else oddsOnly xs



--sum3  =  \as bs cs -> [x+y+z | x <- as, y <- bs, z <- cs, not(null as), not (null bs), not (null cs)]
--sum3  =  \as bs cs -> [x+y+z | x <- as, y <- bs, z <- cs]
--sum3  (a:as) (b:bs) (c:cs) =  [x+y+z | x <- a:as, y <- b:bs, z <- c:cs]
--sum3 [] [] [] = []

{-
sum3  (a:as) (b:bs) (c:cs) | null as = sum3  [0] (b:bs) (c:cs)
                           | null bs = sum3  (a:as) [0] (c:cs)
                           | null cs = sum3  (a:as) (b:bs) [0] 
                           | otherwise = a+b+c : sum3  as bs cs
                           -}

--oddsOnly (x:xs) =  if even x then ys else x : ys 
    --where ys = if null xs then [] else oddsOnly xs





sum3 :: Num a => [a] -> [a] -> [a] -> [a]
{-
sum3  (a:as) (b:bs) (c:cs) = (isNulled a)+(isNulled b)+(isNulled c) : sum3  as bs cs where
    isNulled n = if null n then 0 else n
    -}

--sum3 [] [] [] = []
sum3  (a:as) (b:bs) (c:cs) = if null as && null bs && null cs  then [] else a + b + c : sum3  (isNull as) (isNull bs) (isNull cs) where
    isNull ns = if null ns then [0] else ns

    



sum3 _ _ _ = []
--sum3 [] [] [] = []
--sum3  (a:as) (b:bs) (c:cs) = a + b + c : sum3  as bs cs

--sum3  _ _ _  = _ + _ + _ : _ _ _
