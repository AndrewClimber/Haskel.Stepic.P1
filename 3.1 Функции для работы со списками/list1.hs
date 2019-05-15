{-
В ФП - списки играют фундаментальную роль.
В императивном программировании такую роль играют - массивы.
Списик в ФП - это рекурсивное определение данных.
Два способа создание списков :
1. создать пустой список 
Prelude> []
[]
2. взять готовый список и в голову добавить элемент
Prelude> 1 : []
[1]


Prelude> let lst = 5 : 3 : []
Prelude> lst
[5,3]

Prelude> 7 : lst
[7,5,3]


Prelude> :i (:)
data [] a = ... | a : [a]       -- Defined in `GHC.Types'
infixr 5 :
(:) - правоассоциативнфй оператор и поэтому считается, что в выражении 5 : 3 : [] , 
неявно заключено в скобки 3 : [] . 5 : ( 3 : [] )
[] и запятые - это синтаксический сахар для записи списков.
И поэтому нет никакой разницы как записывают списки , в каком ситаксисе:
Prelude> let lst = 5 : 3 : []
Prelude> [5,3] == lst
True
Таким образом у списка имеются два конструктора. 
Первый конструктор - константа []
Второй конструктор это бинарный оператор (:)
Используя эти конструкторы мы можем писать функции для конструирования различных списков
-}

constr42 = (42 :) -- использовали сечение оператора 
{-
*Main> :t constr42
constr42 :: [Integer] -> [Integer]
*Main> constr42 [2]
[42,2]
-}
constrLst a = (a :)