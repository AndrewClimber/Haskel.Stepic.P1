-- Представителем класса типов можем объявлять не только конкретный тип. Но и некоторые полиморфные типы.
-- Например есть полиморфный тип 2-х элементного кортежа. Пары. Можем проверить 2-ве пары на предмет равенства
-- Только элементы пары должны иметь такой тип, который является представителем  класса типов Eq, 
-- т.е. который можно сравнивать и второй элемент пары тоже должен обладать этим свойством
--  Пример:
class Eq a where
    (==), (/=) :: a -> a => Bool
    x /= y = not (x == y)
    x == y = not (x /= y)

instance Eq Bool where
    True  == True  = True
    False == False = False
    _     == _     = False
-- реализация представителя для классов типа Eq для пары
-- в объявлении представителя появляется контекст
-- он выражает - что мы хотим тип пары объявить представителем классов типа Eq
-- Eq (a, b), то это можно сделать не всегла , а когда на типы - a и - b
-- наложены ограничения , которые появляются в виде контекста : (Eq a, Eq b)
-- этот контекст утверждает, что  тип- a и- b должены быть представителем класса Eq 
-- Тогда пару можно объявить представителем класса Eq
-- и дальше после where - идет реализация. Оператора равенства p1 == p2, где p1 и p2 - некие пары
-- и пары равны , когда равны их первые и вторые элементы.
-- Скобки ставить тут не надо p1 == fst p2 && snd p1 == snd p2
-- т.к :
-- *Main> :i (==)
-- infix 4 ==
-- *Main> :i (&&)
-- infixr 3 &&    
-- приоритет == -выше , чем у &&
instance (Eq a, Eq b) => Eq (a, b) where
    p1 == p2 = fst p1 == fst p2 && snd p1 == snd p2
-- p1 == fst p2 - это равенство мы можем использовать, т.к. это равенство внутри типа - a
-- тип - a это представитель Eq 
-- аналогично и для второго равенства p1 == snd p2, но только оно внутри типа - b и он тоже представитель Eq
-- Это указано в контексте (Eq a, Eq b)

-- список тоже представитель Eq
instance Eq a => Eq [a] where
    --- тут реализация
-- может показаться, что все типы могут быть представителем класса Eq
-- Но это не так. Функциональные типы не могут сравниваться.    