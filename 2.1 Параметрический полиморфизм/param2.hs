-- Напишите функцию трех аргументов getSecondFrom, полиморфную по каждому из них, которая полностью 
-- игнорирует первый и третий аргумент, а возвращает второй. Укажите ее тип.
-- GHCi> getSecondFrom True 'x' "Hello"
-- 'x'
-- GHCi> getSecondFrom 'x' 42 True 
-- 42

-- мой вариант
getSecondFrom :: p1 -> p2 -> p3 -> p2
getSecondFrom a b c = b

-- со степика
getSecondFrom' :: a -> b -> c -> b
getSecondFrom' = const const

-- Sugar-free версия)
getSecondFrom'' :: a -> b -> c -> b
getSecondFrom'' = (\_ x _ -> x)


getSecondFrom''' :: a -> b -> c -> b
getSecondFrom''' _ b _ = b



