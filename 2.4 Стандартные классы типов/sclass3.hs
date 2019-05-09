-- Многие встроенные типя являются - типами перечислениями
-- Bool :  False, True
-- тоже самое Int, Integer, Char. У них есчть естественый порядок. И по нему можем двигаться
-- в большую или меньшую сторону.
-- Есть интерфейс Enum, который обеспечивает это движение. Он содержит 2 ф-и сакцессор - succ и предессор pred
-- 
class Enum a where
    succ, pred :: a -> a  -- для движения по Enum
    toEnum :: Int -> a    -- для индексации 
    fromEnum :: a -> Int  --

-- *Main> succ 4
-- 5
-- *Main> pred 'g'
-- 'f'
-- *Main> fromEnum 'z'
-- 122
-- *Main> toEnum 122 :: Char
-- 'z'

-- класс типов Bounded . Нужен для указания верхней и нижней границы.
class Bounded a where
    minBound, maxBound :: a

-- *Main> succ False
-- True
-- *Main> succ True
-- *** Exception: Prelude.Enum.Bool.succ: bad argument
-- *Main> minBound :: Bool
-- False
-- *Main> maxBound :: Bool
-- True
-- *Main> maxBound :: Int
-- 9223372036854775807
-- У типа Integer нет инстанса в Bounded
-- т.к. Integer - трактуется как бесконечный.
