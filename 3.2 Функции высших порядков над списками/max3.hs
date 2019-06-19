{-
Напишите функцию max3, которой передаются три списка чисел одинаковой длины
и которая возвращает список чисел той же длины, содержащий на k-ой позиции
наибольшее значение из чисел на этой позиции в списках-аргументах.
GHCi> max3 [7,2,9] [3,6,8] [1,8,10]
[7,8,10]
-}

--max3 :: Ord a => [a] -> [a] -> [a] -> [a]
--max3 a1 a2 a3 = [maximum a1, maximum a2, maximum a3]
--max3 (a1:ax1) (a2:ax2) (a3:ax3) = map maximum [a1:ax1, a2:ax2, a3:ax3] 
--max3 (a1:ax1) (a2:ax2) (a3:ax3) = map maximum [a1:ax1, a2:ax2, a3:ax3]
--max3 (a1:ax1) (a2:ax2) (a3:ax3) = map maximum [(get3 ax1 ax2 ax3), (get3 ax1 ax2 ax3), (get3 ax1 ax2 ax3)] where
    --get3 [[a1],[a2],[a3]] = [a1,a2,a3]
    --get3 [(a1:ax1), (a2:ax2), (a3:ax3)] =  get3 [ax1, ax2, ax3]


--get3 (a1:ax1) (a2:ax2) (a3:ax3) =  [a1, a2, a3]    

--maximum'' [x]       = x
--maximum'' (x:x':xs) = maximum'' ((if x >= x' then x else x'):xs)

m3 x y z = max (max x y) z
--m3' x y z = \x y z -> max (max x y) z





--get3 [[a1],[a2],[a3]] = [a1,a2,a3]
--get3 [(a1:ax1), (a2:ax2), (a3:ax3)] =  get3 [ax1, ax2, ax3]

get3 [a1] [a2] [a3] = [[a1,a2,a3]]
get3 (a1:ax1) (a2:ax2) (a3:ax3) = get3 ax1 ax2 ax3

get1 (a1:ax1) (a2:ax2) (a3:ax3) = [ [a1, a2, a3] : get1 ax1 ax2 ax3]

mmm  = map maximum [[7,3,1], [2,6,8], [9,8,10]]

