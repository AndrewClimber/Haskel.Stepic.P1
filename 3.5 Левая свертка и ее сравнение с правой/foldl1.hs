module Demo where
import Prelude hiding (foldl)
{-
так работает правая свертка

foldr  f ini [1,2,3] ~>> 1 `f` (2 `f`(3 `f` ini))

А так левая
foldl :: (b->a->b)->b->[a]->b
foldl  f ini [1,2,3] ~>> ((ini `f` 1) `f` 2) `f` 3
операторный синтаксис
((ini `f` 1) `f` 2) `f` 3
функциональный синтаксис
f(f(f ini 1) 2) 3
-}

-- реализация левой свертки
foldl :: (b->a->b) ->b->[a]->b
foldl f ini [] = ini
foldl f ini (x:xs) = foldl f (f ini x) xs
{-
рендукция при левой свертки
foldl  f ini [1,2,3]
~> foldl f (f ini 1) (2:3:[])
~> foldl f (f (f ini 1) 2) (3:[])
~> foldl f (f (f (f ini 1) 2) 3) []
~> foldl (f (f ini 1) 2) 3 --- это результат 
в отличие от правой свертки левая создает огромное отложенно евычисление.
и поэтому foldl не рекомендуется к использованию. Лоя оевой свертки есть строгая версия. 
Которая обычно используется в Haskell
-}

{-
реализация строгой версии левой свертки.
вынесем вычисление в Where (f ini x) - именно это надо форсировать
для этого есть инструмент. Оператор seq, который позволяет форсировать вычисления.
-}
-- первый вариант. в этом случае просто вынесли в where
foldl :: (b->a->b) ->b->[a]->b
foldl f ini [] = ini
foldl f ini (x:xs) = foldl f ini' xs where
    ini' = f ini x 
-- строгий вариант
foldl' :: (b->a->b) ->b->[a]->b
foldl' f ini [] = ini -- форсирование вычисления ini' с помощью seq
foldl' f ini (x:xs) = ini' `seq` foldl' f ini' xs where
    ini' = f ini x 


{-
сравнение поведения левой и правой сверток на бесконечных списках.
Поведение различное. Левая плохо себя ведет на бесконечных списках.
Правая - хорошо.    
-}

foldl :: (b->a->b) ->b->[a]->b
foldl f ini [] = ini -- т.к. список бесконечный, то это уравнение не работате
foldl f ini (x:xs) = foldl f (f ini x) xs -- в левой части уравнения сразу же идет рекурсия. и значит этот процесс никогда не остановится.

-- правая устроена немного по другому
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f ini [] = ini -- т.к. список бесконечный, то это уравнение не работате
foldr f ini (x:xs) = f x  (foldr f ini xs) -- в головном редоксен находится сворачивающая ф-я . и после 1-й же свертки срабатывает ф-я f
-- ф-я f это ф-я 2-х аргументов. И если f оказывается при каких-то значениях 1-го аргумента не строгой по 2-му аргументу.
-- т.е. игнорирует 2-й аргумент, тогда вычисление ф-и f - завершается. Т.к. не происходит рекурсивный вызов. И правая свертка
-- на бесконечном списке может остановиться.


-- Пример с правой сверткой
any::(a->Bool)->[a]->Bool
any p = foldr (\x b -> p x || b) False

{- можно ли в процессе свертки использовать не одну сворачивающую ф-ю , а несколько ?
Допустим в процессе одного прохода. Свертки списка - надо вычислить сумму и произведение элементов списка
foldr () () [1,2,3,4]
Надо где-то сохранять сумму элементов и сумму элементов. Для этого хорошо подойдет пара. Тогда инициализирующий 
элемент тоже должен быть парой. Сумму иницилизируем - 0 . Произведение - 1.
А ф-я сделаем лямбдой. Этой функции передаются два аргумента. x - элемент списка . А в качестве 2-го аргумента передается пара
И можем использовать сопоставление с образцом внутри лямбды.
s - это накопленная на хвосте сумма. p - накопленное произведение.
foldr (\x (s,p) -> (x+s,x*p)) (0,1) [1,2,3,4]

Prelude> foldr (\x (s,p) -> (x+s,x*p)) (0,1) [1,2,3,4]
(10,24)
-}