{-
Реализуйте функцию nTimes, которая возвращает список, состоящий из повторяющихся значений ее первого аргумента. 
Количество повторов определяется значением второго аргумента этой функции.

GHCi> nTimes 42 3
[42,42,42]
GHCi> nTimes 'z' 5
"zzzzz"
-}
-- моё
nTimes:: a -> Int -> [a]
nTimes i n | n > 0 = itemAdd [] i n
           | otherwise = []
    where 
        itemAdd lst i 0 = lst
        itemAdd lst i n = (itemAdd $! (i : lst)) i $ n - 1
          

-- stepik
nTimes x 0 = []
nTimes x n = (x :) $! nTimes x (n-1)

nTimes _ 0 = []
nTimes a b = a : nTimes a (b-1)

nTimes:: a -> Int -> [a]
nTimes x n = map (\_ -> x) [1..n]