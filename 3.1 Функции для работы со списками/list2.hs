{-
Обратная задача конструирования данных - это задача деконструирования.
Для пары - конструктор пары (,). Для деконструирования пары использовали две
функции fst, snd . Список устроен схожим способом. У него есть два конструктора.
(:) и [] и есть два деструктора - 2 ф-и head и tail

*Main> :t head
head :: [a] -> a
возвращяет 1-й элемент списка

*Main> :t tail
tail :: [a] -> [a]
возврящает список без 1-го элемента
tail и head - это частичные ф-и. Работают не на всех аргументах.
Main> head []
*** Exception: Prelude.head: empty list

-}
-- second тоже частичная ф-я. она даже более частичная, чем head, т.к.
second :: [a] -> a
second xs = head (tail xs)
second'  = head . tail -- более элегантный. бесточечный способ записи ф-и second
{-
более частичная, т.к. не будет работать даже на списке из одного элемента.
*Main> second [1]
*** Exception: Prelude.head: empty list
-}
-- но более мощным способом записи  - является сопоставления с образцом.
-- сопоставления с образцом для пары
fst' ((,) x y) = x
-- конструктор (,) - явился тут образцом для сопоставления.
-- а что-же является образцом для списка ?
-- напишем реализацию для ф-и head , ф-ю head'
head' ((:) x xs) = x
head'' (x : xs) = x -- или так
head''' (x : _) = x -- или так, т.к. справа xs не используется.
-- реализация  для tail
tail' (x : xs) = xs -- видим, Что одна из связываемых переменных не участвует в правой части
-- поэтому её можно не давать имени
tail'' (_ : xs) = xs
-- перепишем second в стиле соспоставления с образцом
second''  (_ : xs) = head xs -- однако тут у нас все же использовалась деконструктуризирующая ф-я head
-- можно ли от нее освободится, Чтобы было полное сопоставление с образцом ?
-- можно !
second''' (_ : xs) = head''' xs
second'''' (_ : (x : _)) = x
second''''' (_ : x : _) = x -- можно еще лишние скобки убрать это что-то вроде такого - (x1 : x2 : xs) = x2


sndHead = snd . head

