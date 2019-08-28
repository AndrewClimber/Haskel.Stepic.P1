{-
Для правой свертки тоже можно реализовать соответствующее сканирование.

-}
module Demo where

import Prelude hiding (foldr, scanr)

foldlr :: (a -> b -> b) -> b -> [a] -> b
foldr f ini [] = ini
foldlr f ini (x:xs) = x `f` (foldlr f ini xs)
{-
редукция на правой свертке

foldlr f ini [1,2,3] ~>> 1 `f` (2 `f` (3 `f` ini))

?? ~>> [1 `f` (2 `f`(3 `f` ini)), 2 `f` (3 `f` ini), 3 `f` ini, ini]

-}
scanr :: (a -> b -> b) -> b -> [a] -> [b]
scanr _ ini [] = [ini]
scanr f ini (x:xs) = (x `f` q) : qs where
    qs@(q:_) = scanr f ini xs
{-
*Demo> scanr (+) 0 []
[0]
*Demo> scanr (+) 0 [1,2,3]
[6,5,3,0]
^^^^^^^ в обратном порядке. сначала вычислился последний элемент.
правое сканирование не работет на бесконечных циклах. Т.к. вначале надо вычимслить 
последний элемент. А на бесконечных циклах это проблематично
-}