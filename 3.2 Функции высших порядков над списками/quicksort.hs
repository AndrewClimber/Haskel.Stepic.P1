{-
Напишите реализацию функции qsort. Функция qsort должная принимать на вход список элементов и сортировать его в порядке возрастания с 
помощью сортировки Хоара: для какого-то элемента x изначального списка (обычно выбирают первый) делить список на элементы меньше и не меньше x, 
и потом запускаться рекурсивно на обеих частях.

GHCi> qsort [1,3,2,5]
[1,2,3,5]
Разрешается использовать только функции, доступные из библиотеки Prelude.

-}


-- три моих варианта
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort xs = qsort (filter (< head xs)  $ drop 1 xs) ++ (head xs):qsort (filter (>= head xs)  $ drop 1 xs)
------------------------------------
qsort xs = qsort (leftPart xs) ++ (head xs):qsort (rightPart xs) where
    leftPart  a = filter  (< head a)  $ drop  1 a
    rightPart a = filter (>= head a)  $ drop  1 a
------------------------------------
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort (filter (< x) xs) ++ x:qsort (filter (>= x) xs)


-- stepik

qsort [] = []
qsort (x:[]) = [x]
qsort (x:xs) = qsort (filter (\i -> i <= x) xs) ++ [x] ++ qsort (filter (\i -> i > x) xs)
------------------------------------

qsort [] = []
qsort ys@(x:xs) | null xs = ys
                | otherwise = qsort (filter p xs) ++ x:qsort (filter (not.p) xs) where p = (< x)

------------------------------------
qsort [] = []
qsort (x:xs) = qsort[y | y <- xs, y < x] ++ [x] ++ qsort[y | y <- xs, y >= x]                

------------------------------------
qsort xs | length xs <= 1 = xs
qsort (x : xs) = qsort (filter (< x) xs) ++ x : qsort (filter (>= x) xs)

------------------------------------
qsort []  = []
qsort (x:xs) = qsort left ++ x : qsort right
  where
    left  = filter (< x)  xs
    right = filter (>= x) xs
------------------------------------

