-- класс тип Show - похож на 
-- мой вариант
class Printable a where
    toString  :: a -> String
    
instance Printable Bool where
     toString True  = "true"
     toString False = "false"

instance Printable () where
    toString () = "unit type"

-- Основной метод класс-типа Show - show
-- *Main> :t show
-- show :: Show a => a -> String
-- *Main> show True
-- "True"
-- *Main> show 5
-- "5"
-- *Main> show [1,2,3]
-- "[1,2,3]"
-- есть обратный процесс работе shpw. show - сериализует. а обратный процесс отвечает 
-- класс типов Read и его метод read
-- *Main> :t read
-- read :: Read a => String -> a
-- read - полиморфна по возвращаемому значению 
-- *Main> read "45"
-- *** Exception: Prelude.read: no parse
-- И поэтому однозначно распарсить не получается
-- 45 - это Int или Integer или Double ??  Поэтому если ф-я полиморфна по возвращаемому значению
-- то надо снять полиморфизм. Указать целевой тип.
-- *Main> read "45" :: Int
-- 45
-- И даже вот так :
-- *Main> read "[4,5]" :: [Double]
-- [4.0,5.0]
-- На самом деле read - не определена в Read . Она внешняя. И ограничена по возможностям - "5 rings" не распарсит
-- в Read определена другая ф-я - reads
-- *Main> :t reads
-- reads :: Read a => ReadS a
-- *Main> :t reads "5 rings"
-- reads "5 rings" :: Read a => [(a, String)]
-- *Main> reads "5 rings" :: [(Int, String)]
-- [(5," rings")]

ip a b c d = show a ++ show b ++ show c ++ show d


