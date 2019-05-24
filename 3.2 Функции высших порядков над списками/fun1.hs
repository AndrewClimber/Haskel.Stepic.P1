{-  Стандартные функции высших порядков для работы со списками
Начнем с ф-й, которые принимают в качестве аргументов некий унарный предикат.
Унарный предикат это ф-я, которая принимает некоторое значение, а возвращает Bool - значение.
-}
module Demo where

import Prelude hiding (filter, takeWhile, dropWhile, span, break)

filter :: (a -> Bool) -> [a] -> [a] -- 1-й аргумент унарный предикат, 2-й аргумент список
                                    -- и возвращает список, который состоит из элементов, Удовлетворяющих предикату.  
-- по предикату не можем сопоставить с образцом. можем только  связать с переменной. (a -> Bool) - стрелка не имеет образцов.                                    
-- и поэтому связываем  предикат с переменной p . И пишем два уравнения.
filter p [] = []  -- 1-е ур-е описывает пустой список. ВОзвращается пустой список. Вне зависимости от предиката.
filter p (x:xs)  -- 2-е уравнение в качестве аргумента принимает непустой список. Если список непустой - надо проверить голову удовлетворения предикату
    | p x = x : filter p xs -- и далее вызвать ф-ю рекурсивно на хвосте списка. Применяется предикат к голове  | p x - если = True, то x добавляем
    -- в список. И далее вызываем рекурсивно filter на хвосте, уменьшеном на один элемент. С тем же предикатом. Таким образом в список добавляются
    -- только удовлетворяющие предикату элементы.
    | otherwise = filter p xs -- если предикат = False, то тогда по прежнему вызываем рекурсивно filter, но элемент в список не добавляем.
 {-
  Пример:
    *Demo> filter (<3) [1,2,1,4,5,6,1,0]
    [1,2,1,1,0]
-}    
-- пока предикат выполняется. Элементы складываются в результирующий список
takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile p (x:xs) 
   | p x  = x : takeWhile p xs
   | otherwise = []
{- Пример работы :
*Demo> takeWhile (< 3) [1,2,3,4,1,2,3,4]
[1,2]
-}
-- похожа на takeWhile, но работает наоборот. 
-- пока предикат выполняется. Элементы отбрасываются.
-- как только предикат перестает выполнятнся. Возвращается хвост оставшегося списка.
dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ [] = [] -- 1-е терминальное ур-е ничем не отличается от такового в takeWhile
dropWhile p xs@(x:xs') -- а если список непустой , то используется хитрая синтаксическая конструкция, которая называется синоним. 
-- Локальный псевдоним xs для выражения (x:xs')
{-строго говоря, если не использовать локальный псевдоним, то запись "x : xs" в теле функции означает "сконструируй новый список". 
Если же вводится псевдоним, то на этапе сопоставления с образцом весь список будет связан с псевдонимом и в теле функции не надо будет конструировать 
его каждый раз при использовании. Второй вариант выгоднее с точки зрения производительности.-}

    | p x = dropWhile p xs' -- происходит рекурсивный вызхов на хвосте. Предикат = True , то элемент отбрасывается.
    | otherwise = xs -- предикат = False. Выполнение прекращается и возвращается оставшийся хвост списка.
{-
Пример работы :
*Demo> dropWhile (< 3) [1,2,3,4,1,2,3,4]
[3,4,1,2,3,4]
-}

span :: (a -> Bool) -> [a] -> ([a], [a])
span p xs = (takeWhile p xs, dropWhile p xs)

-- ф-я алтернативная span
break :: (a -> Bool) -> [a] -> ([a], [a])
-- работает как span, но только вместо предиката используется его отрицание.
break p = span (not . p)
{-
Примеры работы :
*Demo> span (< 3) [1,2,3,4,1,2,3,4]
([1,2],[3,4,1,2,3,4])
*Demo> break (> 3) [1,2,3,4,1,2,3,4]
([1,2,3],[4,1,2,3,4])
-}

