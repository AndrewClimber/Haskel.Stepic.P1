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

--coins = [2, 3, 7]
coins = [2, 3, 4]
--change :: (Ord a, Num a) => a -> [[a]]
change n = pe n where
    pe n = [x | x <- l . map l . tails $ cycle coins, sum(x)==n] where 
        l = take $ length coins

--repl n = [x | x <- replicate n 1]

ta n = [x | x <- tails $ replicate n 1]
mTree 0 = []
mTree n = [x | x <- [n-(n-2),n-2]:mTree (n-2)]



ii n = [x | x <- inits $ replicate n 1]

eee n = [x `zip` y | x <- (tails $ replicate n 1), y <- (inits $ replicate n 1)]

--tails $ scanr (+) (last (repl 7))  (repl 7)
--permutations coins
--tails $ scanr ( (head(repl 7)) + (last (repl 7)) )  (repl 7)

rota xs = nub $ tail $ zipWith (++) (tails xs) (inits xs)

perm [] = [[]]
perm xs = nub [x:ps | (hs, x:ts) <- (inits xs `zip` tails xs), ps <- perm (hs ++ ts)]


