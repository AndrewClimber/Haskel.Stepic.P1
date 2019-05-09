{-
Пусть существуют два класса типов KnownToGork и KnownToMork, которые предоставляют методы stomp (stab) и 
doesEnrageGork (doesEnrageMork) соответственно:

class KnownToGork a where
    stomp :: a -> a
    doesEnrageGork :: a -> Bool

class KnownToMork a where
    stab :: a -> a
    doesEnrageMork :: a -> Bool
Класса типов KnownToGorkAndMork является расширением обоих этих классов, предоставляя дополнительно метод stompOrStab:

class (KnownToGork a, KnownToMork a) => KnownToGorkAndMork a where
    stompOrStab :: a -> a
Задайте реализацию по умолчанию метода stompOrStab, которая вызывает метод stomp, если переданное ему значение 
приводит в ярость Морка; вызывает stab, если оно приводит в ярость Горка и вызывает сначала stab, а потом stomp, 
если оно приводит в ярость их обоих. Если не происходит ничего из вышеперечисленного, метод должен возвращать 
переданный ему аргумент.
-}

class KnownToGork a where
    stomp :: a -> a
    stomp a = a
    doesEnrageGork :: a -> Bool
    doesEnrageGork a = True

class KnownToMork a where
    stab :: a -> a
    stab a = a
    doesEnrageMork :: a -> Bool
    doesEnrageMork a  = True
             

class (KnownToGork a, KnownToMork a) => KnownToGorkAndMork a where
    stompOrStab :: a -> a
    stompOrStab ar        
        | doesEnrageMork ar  && not (doesEnrageGork ar) = stomp ar
        | doesEnrageGork ar  && not (doesEnrageMork ar) = stab ar
        | doesEnrageGork ar && doesEnrageMork ar =  stomp  $ stab ar
        | otherwise = ar


-- красиво . но непонятно
class (KnownToGork a, KnownToMork a) => KnownToGorkAndMork a where
            stompOrStab :: a -> a
            stompOrStab a = ((if doesEnrageMork a then stomp else id) . (if doesEnrageGork a then stab else id)) a

-- наглядно
class (KnownToGork a, KnownToMork a) => KnownToGorkAndMork a where
            stompOrStab :: a -> a
            stompOrStab a = switch (doesEnrageGork a, doesEnrageMork a) a where 
                switch p
                    | p == (True, True) = stomp . stab
                    | p == (True, False) = stab
                    | p == (False, True) = stomp
                    | otherwise = id            

                    