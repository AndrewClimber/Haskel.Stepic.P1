{-
Примеры использования ф-и map
-}
module Demo where

import Prelude hiding (and, or, all, any)

and, or :: [Bool] -> Bool
-- and : если в списке все истинные значение - возвращает True
-- если в списке хотябы одно ложное - возвращает False
and [] = True
and (x:xs) = x && and xs
-- ф-я or работает аналогично ф-и and
or [] = False
or (x:xs) = x || or xs

-- в качестве аргумента 1. унарный предикат. 2. список. к которому этот предикат применяется
-- на выходе булево значение. если на всех эл-тах списка True, то возвращается True
-- если хоть на одном эл-те False, т овозвращяется False 
all :: (a -> Bool) -> [a] -> Bool
all p = and . map p
{-
*Main> all odd [2,4,6]
False
*Main> all odd [2,4,6,1]
False
*Main> all odd [1,3,5,7]
True
-}
any :: (a -> Bool) -> [a] -> Bool
any p = or . map p
{-
*Demo> any odd [1,2,4]
True
*Demo> any odd [4,2,4]
False
-}
{-пактическая задача. перевернуть текст
"Abc is not ABC"
применим сначала ф-ю words
*Demo> words "sdf sdf dfg tytr 546"
["sdf","sdf","dfg","tytr","546"]

обратная ей ф-я unwords
*Demo> unwords (words "sdf sdf dfg tytr 546")
"sdf sdf dfg tytr 546"

Или с помощью композиции функций.
*Demo> unwords . words $  "sdf sdf dfg tytr 546"
"sdf sdf dfg tytr 546"

Или так 
*Demo> unwords $ words  "sdf sdf dfg tytr 546"
"sdf sdf dfg tytr 546"

И заключительно 
*Demo> unwords . map reverse . words $ "Abc is not ABC"
"cbA si ton CBA"

-}

revWords :: String -> String
revWords = unwords . map reverse . words
{-
*Demo> revWords "Mommy washes window"
"ymmoM sehsaw wodniw"
-}