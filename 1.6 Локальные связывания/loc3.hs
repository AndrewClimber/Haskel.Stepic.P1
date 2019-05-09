sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x =  (mySum $ x, myLen $ x ) where
    myLen x | x >= 0 = lenx x
            | otherwise = lenx $ absx x  where 
                lenx x = toInteger . length $ show x
    mySum x | x < 0 = sumx $ absx x
            | otherwise = sumx $ x where 
        sumx x = sum (map (read . (:"")) (show x) :: [Integer])
    absx x = x * (-1)