{-
Напишите реализацию функции qsort. Функция qsort должная принимать на вход список элементов и сортировать его в порядке возрастания с 
помощью сортировки Хоара: для какого-то элемента x изначального списка (обычно выбирают первый) делить список на элементы меньше и не меньше x, 
и потом запускаться рекурсивно на обеих частях.

GHCi> qsort [1,3,2,5]
[1,2,3,5]
Разрешается использовать только функции, доступные из библиотеки Prelude.

-}
--qsort :: Ord a => [a] -> [a]
--qsort [] = []
{-qsort (xs)  = glue: qsort xs where 
    cutr =  fst spn
    cutl =  snd spn
    glue = cutl ++ cutr
    spn = (span (<= head xs ) xs)
-}
-- oddsOnly'''' = \xs -> [x | x <- xs, odd x]
--qsort(x:xs) = qsort [y | y <- xs, y < x] 
qsort [] = []
qsort xs | first > second = second:first:qsort xs
         | otherwise = qsort xs where
            first  = head xs
            second = head $ tail xs
qs [] = []
qs (f:s:xs) | f > s = s:qs (f:xs)
            | otherwise = qs (f:xs)

--qso [] = []
qso (x:xs) = qso (ys (x:xs)) ++ qso (zs xs) where
    ys [] = []
    ys l = filter (<x) l
    zs [] = []
    zs l = filter (>=x) l

qqq [] = []
qqq xs = qqq (fst $ cutUp) ++ qqq (snd $ cutUp) where
    cutUp = (isPart (>= item) xs, isPart (< item) xs)
    item  = head xs
    isPart _ [] = []
    isPart p a = filter p a

