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
groupElems (x:xs) = equals : groupElems others
    where
        (equals, others) = span (== x) (x:xs)
-----------------------------------------------------
groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems (x:xs ) = (x:ys) : groupElems zs 
                     where (ys,zs) = span (==x) xs
-----------------------------------------------------

groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems (x:xs) = el : groupElems tail where
    (el, tail) = span (== x) (x : xs)

-----------------------------------------------------
-- вот это понравилось с использованием span
groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems (x:xs) = (fst (span (== x) (x:xs))) : (groupElems (snd (span (== x) (xs))))

-----------------------------------------------------
-- вот это понравилось без span
groupElems [] = []
groupElems [a] = [[a]]
groupElems (a:b:xs) | (a == b) = (a:head result) : tail result
                    | otherwise = [a] : (result)
            where 
                result = groupElems (b:xs)

-----------------------------------------------------                
-- решение от команды курса. Kirill Elagin
-- Простой рекурсивный алгоритм. Использование `head` тут безопасно, поскольку наш алгоритм 
-- гарантированно никогда не положит в ответ пустую группу.
groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems (x : xs) = case groupElems xs of
                        [] -> [[x]]
                        (g : gs) | x == head g -> (x : g) : gs
                                 | otherwise   -> [x] : g : gs
-----------------------------------------------------                


groupElems :: Eq a => [a] -> [[a]]
groupElems as = groupElems' as []
  where 
    groupElems' [] [] = []
    groupElems' (a1:[]) [] = [[a1]]
    groupElems' [a1,a2] acc = if a1 == a2 then [a1:a2:acc] else (a1:acc): groupElems' [a2] []
    groupElems' (a1:a2:as) acc = if a1 == a2 then groupElems' (a2:as) (a2:acc) else (a1:acc):groupElems' (a2:as) []

-----------------------------------------------------                

groupElems :: Eq a => [a] -> [[a]]
groupElems = gr []
    where
    gr [] [] = []
    gr xs [] = [xs]
    gr [] (y:ys) = gr [y] ys
    gr (x:xs) (y:ys)
        | x == y = gr (y:x:xs) ys
        | otherwise = (x:xs) : gr [y] ys