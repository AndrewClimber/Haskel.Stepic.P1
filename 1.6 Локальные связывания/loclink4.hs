-- конструкция связывания where
-- where это как-бы let in наоборот

roots'''' a b c =
    let
        d = sqrt $ b^2 - 4 * a * c
        x1 = (-b - d) / aTwice
        x2 = (-b + d) / aTwice
        aTwice = 2 * a
    in (x1, x2)

roots a b c = (x1, x2) where
    x1 = (-b - d) / aTwice
    x2 = (-b + d) / aTwice
    d = sqrt $ b^2 - 4 * a * c
    aTwice = 2 * a

-- но между let in и where есть отличие.
-- let in  - это выражение
-- let x = 2 in x^2
--  4
-- это выражение можно использовать в других конструкциях
-- ( let x = 2 in x^2 )^2
-- where - выражением не является.
-- вот так написать нельзя : x^2 where x = 2
-- where может использоваться в определении функции. и только в определенном месте
-- в качестве глобальной части тела функции.
-- Пример для чего сделано такое различие :
-- 6я версия факториала. со вспомогательной функцией helper
factorial6 n
   | n >= 0 = let
       helper acc 0 = acc 
       helper acc n = helper (acc * n) (n - 1)
       in helper 1 n
   | otherwise = error "arg must be >= 0"
-- предположим нам захотелось использовать вспомогательную ф-ю helper
-- не в одном уравнении с охранными выражениями - а в нескольких
-- т.е. вызов helper должен присутствовать и в первом равенстве n >= 0 = let
-- и во втором otherwise = error
-- и тогда, после использования where эта конструкция перестает быть выражением
factorial7 :: Integre->Integer
factorial7 n | n >= 0 = helper 1 n
             | otherwise = error "arg must be >= 0" 
    where 
        helper acc 0 = acc 
        helper acc n = helper (acc * n) (n - 1)
