-- Задачка
-- Реализуйте функцию seqA, находящую элементы следующей рекуррентной последовательности
-- a0=1;a1=2;a2=3;  ak+3=ak+2+ak+1−2ak.

-- Вариант №1
seqA :: Integer -> Integer
seqA k  | k == 0 = 1 | k == 1 = 2 | k == 2 = 3 
        | k > 2 = calcA 3 2 1 k --1 2 3  k
        | otherwise = error "ERROR!!!"

calcA :: Integer->Integer->Integer->Integer->Integer
calcA a2 a1 a0 k | k == 2 = a2
                 | otherwise = calcA(a2 + a1 - 2*a0)  a2 a1  (k-1)


-- Вариант №2 с where
seqA' :: Integer -> Integer
seqA' k | k == 0 = 1 | k == 1 = 2 | k == 2 = 3 | k > 2 = calcA' 3 2 1 k where
    calcA' a2 a1 a0 k | k == 2 = a2 | otherwise = calcA'(a2 + a1 - 2*a0) a2 a1 (k - 1)


-- Чужое решение. много неизвестного
seqA''' :: Integer -> Integer
seqA''' n = let
        seq :: [Integer]
        seq = 1 : 2 : 3 : zipWith3 (\a1 -> \a2 -> \a3 -> a3 + a2 - 2*a1) seq (drop 1 seq) (drop 2 seq)
      in seq !! (fromIntegral n)

-- чужой вариант с let
seqA'''' :: Integer -> Integer
seqA'''' n | n < 3 = n + 1
             | otherwise = let
                 helper c b a 0 = a
                 helper c b a n = helper (c + b - 2*a) c b (n-1) in helper 3 2 1 n      