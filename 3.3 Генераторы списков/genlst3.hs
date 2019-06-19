{-
Есть специальные синктаксические конструкции, которые позволяют генерировать списки регулярной структуры.
Это арифметические последовательности.
Prelude> [1..10]
[1,2,3,4,5,6,7,8,9,10]
Эта конструкция - синтаксический сахар. Над вызовом функции :
Prelude> enumFromTo 1 10
[1,2,3,4,5,6,7,8,9,10]

Prelude> :t enumFromTo
enumFromTo :: Enum a => a -> a -> [a]
enumFromTo - член класса Enum
Prelude> :i enumFromTo
class Enum a where
  ...
  enumFromTo :: a -> a -> [a]
  ...
        -- Defined in `GHC.Enum'

Можно задавать более сложные структуры.
Задавая шаг.
Prelude> [1,3..10]
[1,3,5,7,9]
Prelude> [1,2..10]
[1,2,3,4,5,6,7,8,9,10]
Это тоже синтаксический сахар. Для ф-и enumFromThenTo
Prelude> enumFromThenTo 1 3 10
[1,3,5,7,9]
Арифметические последовательности можно использовать для конструирования безконечных структур данных.
Список всех натуральных чисел можно задать так : [1..], take 100 [1..]
Сахар для enumFrom
Prelude> take 10 $ enumFrom 10
[10,11,12,13,14,15,16,17,18,19]

И последнее [1,3..]
Prelude> take 5 [1,3..]
[1,3,5,7,9]
enumFromThen
Prelude> take 7 $ enumFromThen  2 3
[2,3,4,5,6,7,8]

Вывести пять чисел кратных семи :
Prelude> take 5 [7,14..]
[7,14,21,28,35]
-}
