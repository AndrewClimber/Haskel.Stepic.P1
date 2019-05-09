{-
Реализуйте функцию on3, имеющую семантику, схожую с on, но принимающую в качестве первого аргумента 
трехместную функцию:

on3 :: (b -> b -> b -> c) -> (a -> b) -> a -> a -> a -> c
on3 op f x y z = undefined
Например, сумма квадратов трех чисел может быть записана с использованием on3 так

GHCi> let sum3squares = (\x y z -> x+y+z) `on3` (^2)
GHCi> sum3squares 1 2 3
14
-}
import Data.Function

-- мое решение
on3 :: (b -> b -> b -> c) -> (a -> b) -> a -> a -> a -> c
on3 op f x y z =  (op) (f x) (f y) (f z)

-- со степика
-- вот это понравилось наглядностью
on3' :: (b -> b -> b -> c) -> (a -> b) -> a -> a -> a -> c
on3' op f x y z = op a b c where a = f x 
                                b = f y 
                                c = f z

--- вот это не понятное . изврат с частичным применением ф-и op .
on3'' :: (b -> b -> b -> c) -> (a -> b) -> a -> a -> a -> c
on3'' op f x y z = on op f x y $ f z


