{-
Напишите функцию с сигнатурой:

avg :: Int -> Int -> Int -> Double
вычисляющую среднее значение переданных в нее аргументов:

GHCi> avg 3 4 8
5.0
-}
-- мое решение
avg :: Int -> Int -> Int -> Double
avg p1 p2 p3 =  (fi p1 + fi p2 + fi p3)  / 3.0 where fi = fromIntegral

-- stepik
avg :: Int -> Int -> Int -> Double
avg = \x y z -> ((fromInteger (toInteger x) :: Double) + 
                 (fromInteger (toInteger y) :: Double) + 
                 (fromInteger (toInteger z) :: Double))/3

avg :: Int -> Int -> Int -> Double
avg a b c = (sum $ map fromIntegral [a,b,c]) / 3

avg :: Int -> Int -> Int -> Double
avg a b c = (toDouble a + toDouble b + toDouble c) / 3

avg :: Int -> Int -> Int -> Double
avg a x b = sum [fromIntegral a, fromIntegral x, fromIntegral b] / 3

avg :: Int -> Int -> Int -> Double
avg x y z = (/ 3) $ sum [i,j,k]
    where
        i = fromIntegral x
        j = fromIntegral y
        k = fromIntegral z

avg :: Int -> Int -> Int -> Double
f_I_to_O = fromInteger . toInteger
avg x y z = ((f_I_to_O x) + (f_I_to_O y) + (f_I_to_O z)) / 3        