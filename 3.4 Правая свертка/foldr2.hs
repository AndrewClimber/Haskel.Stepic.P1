import Prelude hiding (foldr)
{-

-}

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f ini [] = ini 
foldr f ini (x:xs) = x `f` foldr f ini xs 

{-
*Main> foldr (-) 5 [1,2,3]
-3
Значение -3 получилось так :
Main> ( 1 - (2 - (3 - 5)))
-3

Запишем это немного по другому :
foldr f ini 1:2:3:[]
~> 1 `f` foldr f ini (2:3:[])
~> 1 `f` (2 foldr f ini (3:[]))
~> 1 `f` (2 `f` (3 `f` foldr f ini []))
~> 1 `f` (2 `f` (3 `f` ini))
-}




