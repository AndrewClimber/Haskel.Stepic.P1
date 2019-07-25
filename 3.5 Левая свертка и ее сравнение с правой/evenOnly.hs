{-
Используя однократный вызов свертки, реализуйте функцию evenOnly, которая выбрасывает из списка элементы,
стоящие на нечетных местах, оставляя только четные.

GHCi> evenOnly [1..10]
[2,4,6,8,10]
GHCi> evenOnly ['a'..'z']
"bdfhjlnprtvxz"
-}
import Data.List
import Data.Maybe

--evenOnly :: [a] -> [a]
--evenOnly s = foldr 
evenPosList c s = even $ (fromJust $ elemIndex c s)+1
