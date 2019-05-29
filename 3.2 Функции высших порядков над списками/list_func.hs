
{-
*Main> top 1 [1,2,3]
[1,1,2,3]
-}
top :: t -> [t] -> [t]
top a [] = [a]
top a (x:xs) = a : top x xs

{-
*Main> app 1 [1,2,3]
[1,2,3,1]
-}
app :: t -> [t] -> [t]
app a [] = [a]
app a (x:xs) = x : app a xs 

{-
*Main> end [1,2,3]
[2,3,1]
-}
end :: [t] -> [t]
end (x:xs) = app x xs

{-
*Main> pal [1,2,3]
[2,3,1,1,2,3]
-}
pal :: [t] -> [t]
pal (x:xs) = (app x xs)++(top x xs)

{-
*Main> oddEven [1,2,3,4,5,6]
[2,1,4,3,6,5]
-}
oddEven :: [a] -> [a]
oddEven (h1:h2:t) = h2:h1:oddEven t
oddEven t = t


{-
*Main> cMap (\x -> [x,x,x]) [1,2,3]
[1,1,1,2,2,2,3,3,3]
-}
cMap :: (a1 -> [a2]) -> [a1] -> [a2]
(.:) = (.) (.) (.)
cMap = (.:) concat map
