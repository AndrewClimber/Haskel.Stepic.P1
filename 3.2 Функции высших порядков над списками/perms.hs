{-
Воспользовавшись функциями map и concatMap, определите функцию perms, которая возвращает все перестановки, которые можно 
получить из данного списка, в любом порядке.

GHCi> perms [1,2,3]
[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
Считайте, что все элементы в списке уникальны, и что для пустого списка имеется одна перестановка.
-}


{-
concatMap :: (a -> [b]) -> [a] -> [b]
concatMap f = concat . map f

{-
*Main> concatMap (\x -> [x,x,x]) [1,2,3]
[1,1,1,2,2,2,3,3,3]
-}

-}

--perms :: [a] -> [[a]]
--perms [] = [[]]
{-perms xs = [[f, s], [s, f]] where
    f = head xs
    s = head (tail xs)
-}

perms :: [a] -> [[a]]
perms [] = [[]]
--perms xs = concatMap (\x -> [(x:xs)]) xs
perms (xs) = concatMap (\x -> [(end xs)]) xs 




top a [] = [a]
top a (x:xs) = a : top x xs
app a [] = [a]
app a (x:xs) = x : app a xs 

end (x:xs) = app x xs
pal (x:xs) = (app x xs)++(top x xs)


pe (xs) = concatMap (\x-> [(end xs)]) xs where 
    app a [] = [a]
    app a (x:xs) = x : app a xs 
    end (x:xs) = app x xs

{-
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs
-}    



--cMap = (.) (.) (.) concat map
--(.:) = (.) (.) (.)
--cMap = (.:) concat map
-- cMap = (concat .) . map
cp = (.)
cMap = cp cp cp concat map


fu (x:xs) = [x]


--oddEven :: [Integer] -> [Integer]
oddEven (h1:h2:t) = h2:h1:oddEven t
oddEven t = t