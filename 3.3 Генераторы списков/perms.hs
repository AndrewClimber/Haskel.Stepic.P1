{-
Пусть есть список положительных достоинств монет coins, отсортированный по возрастанию. 
Воспользовавшись механизмом генераторов списков, напишите функцию change, которая разбивает переданную ей положительную 
сумму денег на монеты достоинств из списка coins всеми возможными способами. Например, если coins = [2, 3, 7]:

 
GHCi> change 7
[[2,2,3],[2,3,2],[3,2,2],[7]]

Примечание. Порядок монет в каждом разбиении имеет значение, то есть наборы [2,2,3] и [2,3,2] — различаются.
Список coins определять не надо.

-}

import Data.List

helper y [] = [[y]]
helper y (x : lst) = (y : x : lst) :  (map (\u -> x : u) (helper y lst))   
perms [] = [[]]
perms (x : xs) = concatMap (\u -> helper x u) (perms xs) 

permutations' :: Eq a => [a] -> [[a]]
permutations' []   = [[]]
permutations' list = [(x:xs) | x <- list, xs <- permutations' $ delete x list]


coins = [1, 2, 3, 5]
change :: (Ord a, Num a) => a -> [[a]]
change = undefined

