{-
Используя unfoldr, реализуйте функцию, которая возвращает в обратном алфавитном порядке список символов, 
попадающих в заданный парой диапазон. Попадание символа x в диапазон пары (a,b) означает, что x >= a и x <= b.

revRange :: (Char,Char) -> [Char]
revRange = unfoldr g 
  where g = undefined
GHCi> revRange ('a','z')
"zyxwvutsrqponmlkjihgfedcba"
-}
import Data.Char
import Data.List

--revRange :: (Char,Char) -> [Char]
--revRange (c1, c2) = unfoldr (g (c1, c2))
--  where g (c1, c2) = (\c1 c2 -> take (ord c2 - ord c1 + 1) ['a'..'z'])

--revRange :: (Char,Char) -> [Char]
--revRange (c1, c2) =   reverse $ take (ord (snd (c1,c2)) - ord (fst(c1,c2)) + 1) ['a'..'z']
revRange :: (Char,Char) -> [Char]
revRange = unfoldr g 
  where g = undefined

