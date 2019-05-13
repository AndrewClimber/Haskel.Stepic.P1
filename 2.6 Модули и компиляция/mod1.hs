module Demo where
{-
Неявно импортируется module Prelude
ДЛя того чтобы импортировать модуль :
-}
-- в иерархии модулей повторяется структура директорий - вкоторой находится иерархия модулей.
-- /Data/Char/
import Data.Char  -- импортирует все публичные функции
-- import Data.Char (toUpper) можем указать к импорту не все ф-и
-- import Data.Char hiding (toUpper) - импорт всех кроме toUpper

import Data.List
--import Data.Set
{-
ф-я union есть и в  Data.List и в Data.Set
Data.Set.union
Data.List.union
*Demo> :t Data.List.union
Data.List.union :: Eq a => [a] -> [a] -> [a]
*Demo> :t Data.Set.union
Data.Set.union :: Ord a => Set a -> Set a -> Set a
-}

{-
import qualified Data.Set - означает, что имена из этого модуля должны использоваться с префиксом имени этого модуля. 
-}
--import qualified Data.Set
{-
это union из import Data.List
*Demo> :t union
union :: Eq a => [a] -> [a] -> [a]
а к union из Data.Set теперь, после qualified только так :
Data.Set.union
:: Ord a => Data.Set.Set a -> Data.Set.Set a -> Data.Set.Set a
-}
import qualified Data.Set as Set -- для сокращения записи
{-
*Demo> :t Set.union
Set.union :: Ord a => Set.Set a -> Set.Set a -> Set.Set a
-}

