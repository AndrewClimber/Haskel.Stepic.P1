{-
Напишите функцию groupElems которая группирует одинаковые элементы в списке (если они идут подряд) и возвращает список таких групп.

GHCi> groupElems []
[]
GHCi> groupElems [1,2]
[[1],[2]]
GHCi> groupElems [1,2,2,2,4]
[[1],[2,2,2],[4]]
GHCi> groupElems [1,2,3,2,4]
[[1],[2],[3],[2],[4]]
Разрешается использовать только функции, доступные из библиотеки Prelude.
-}


--groupElems (x:xs) = if x == head xs then [x: (head xs)] else groupElems xs 

--groupElems (x:xs) = (head  xs) 
--groupElems (x:xs) = x

groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems [x] = [[x]]
--groupElems (_:xs) = (fst $ span (== head xs) xs) : groupElems xs
groupElems (x:xs) = (fst $ span (== x) xs) : groupElems (x:xs)

