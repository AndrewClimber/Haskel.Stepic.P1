import Data.Function
{-
В модуле Data.Function определена полезная функция высшего порядка

on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
on op f x y = f x `op` f y
Она принимает четыре аргумента: бинарный оператор с однотипными аргументами (типа b), функцию f :: a -> b, 
возвращающую значение типа b, и два значения типа a. Функция on применяет f дважды к двум значениям типа a и 
передает результат в бинарный оператор.

Используя on можно, например, записать функцию суммирования квадратов аргументов так:

sumSquares = (+) `on` (^2)
Функция multSecond, перемножающая вторые элементы пар, реализована следующим образом

multSecond = g `on` h

g = undefined

h = undefined
Напишите реализацию функций g и h.

GHCi> multSecond ('A',2) ('E',7)
14

-}

multSecond g h  = g `on` h

g  = (*)

h  =  snd
{-
*Main> :t g
g :: Integer -> Integer -> Integer
*Main> :t h
h :: (a, b) -> b
*Main> :t g `on` h
g `on` h :: (a, Integer) -> (a, Integer) -> Integer
-}
