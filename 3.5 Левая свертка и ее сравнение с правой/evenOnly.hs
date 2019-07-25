{-
Используя однократный вызов свертки, реализуйте функцию evenOnly, которая выбрасывает из списка элементы,
стоящие на нечетных местах, оставляя только четные.

GHCi> evenOnly [1..10]
[2,4,6,8,10]
GHCi> evenOnly ['a'..'z']
"bdfhjlnprtvxz"
-}
-- aka . На бесконечных списках не работает.
import Data.List
evenOnly :: [a] -> [a]
evenOnly s = snd $ unzip [x | x <- (zip [1 .. (length s)] s), (even $ fst x)==True]
-- aka . Вариант для бесконечных списков.
evenOnly s = snd $ unzip [x | x <- (zip (cycle [1,2]) s), (even $ fst x)==True]

-- teacher's solution
{-
 идёт с конца по списку, хранит пару из двух списков. Когда надо добавить очередной элемент, меняет списки в паре местами 
 и приписывает к левому — соответственно, элементы по очереди приписываются к одному списку — к другому — к одному — к другому.
 В итоге просто возвращает правильный список (правильной — это не тот, 
 в который был добавлен последний [первый в исходном списке] элемент). 
-}
evenOnly :: [a] -> [a]
evenOnly = snd . foldr (\a (xs, ys) -> (a : ys, xs)) ([], [])

-- variant with foldl 
evenOnly :: [a] -> [a]
evenOnly = reverse . snd . foldl accumulate (1, []) where
  accumulate (pos, acc) x = (pos + 1, if even pos then x : acc else acc)
{-Вообще, конечно, в этой задаче подразумевалось использование правой свёртки, как наиболее естественной :). 
А левая свертка полезна, поскольку делает примерно то же самое, что циклы в нефункциональных языках.-}

-- для бесконечных списков
evenOnly :: [a] -> [a]
evenOnly =  foldr (\(i,x) xs -> if even i then x:xs else xs) [] . zip [1..]
-- для бесконечных списков
evenOnly :: [a] -> [a]
evenOnly = foldr (\(count, res) str-> if even count then res : str else str) ([]) . zip [1..]

-- no fold
evenOnly :: [a] -> [a]
evenOnly d = map fst $ filter snd $ zip d $ concat $ replicate (length d) [False, True]

-- WOW !
evenOnly :: [a] -> [a]
evenOnly [] = []
evenOnly [_] = []
evenOnly (x1:x2:xs) = x2 : evenOnly xs

-- gluk
evenOnly :: [a] -> [a]
evenOnly a = foldr (\(n,b) l -> if b then n:l else l) [] (zip a (cycle [False,True]))