{-
в стандартной библиотекуе есть ф-и которые порождают бесконечные списки
-}
module Demo where

import Prelude hiding (repeat, replicate, cycle, iterate)

repeat :: a -> [a]
-- repeat a = a:repeat a
repeat x = xs where xs = x : xs
{- вызывать надо так :
*Demo> take 10 $ repeat 'd'
"dddddddddd"
чтобы каждый раз не использовать take есть вспомогательная функция. replicate. Она не работает напрямую с бесконечными списками.
Работает через repeat
-}
replicate :: Int -> a -> [a]
replicate n x = take n (repeat x)

{-следующая функция cycle - повторяет список бесконечное кол-во раз-}
cycle :: [a] -> [a]
cycle [] = error "cycle: is empty list"
cycle xs = ys where ys = xs ++ ys

{-ф-я iterate -}
iterate :: (a -> a) -> a -> [a]
iterate f x = x : iterate f (f x)

{-
Demo> take 10 $ iterate (+1) 1
[1,2,3,4,5,6,7,8,9,10]
-}
