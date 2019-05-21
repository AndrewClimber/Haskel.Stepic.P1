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

-- мое решение
groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems xs = fs : groupElems (drop (length fs)  xs) where
    fs = fst $ span (== head xs) xs

-- stepik    
groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems (x:xs ) = (x:ys) : groupElems zs 
                     where (ys,zs) = span (==x) xs

groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems (x:xs) = el : groupElems tail where
    (el, tail) = span (== x) (x : xs)

groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems (x:xs) = (fst (span (== x) (x:xs))) : (groupElems (snd (span (== x) (xs))))
groupElems [] = []
groupElems [a] = [[a]]

groupElems (a:b:xs) | (a == b) = (a:head result) : tail result
                    | otherwise = [a] : (result)
            where 
                result = groupElems (b:xs)