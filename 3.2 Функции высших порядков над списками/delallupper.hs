{-
Реализуйте функцию delAllUpper, удаляющую из текста все слова, целиком состоящие из символов в верхнем регистре. Предполагается, 
что текст состоит только из символов алфавита и пробелов, знаки пунктуации, цифры и т.п. отсутствуют.

GHCi> delAllUpper "Abc IS not ABC"
"Abc not"
"Abc  not "
Постарайтесь реализовать эту функцию как цепочку композиций, аналогично revWords из предыдущего видео.

revWords = unwords . map reverse . words
-}

-- мой
delAllUpper :: String -> String
delAllUpper = unwords . filter (/= "") . map delUpper . words where
    delUpper str | all (`elem` ['A' .. 'Z']) str = drop (length str) str | otherwise = str
        
    
-- stepik
delAllUpper :: String -> String
delAllUpper = unwords . filter (not . and . map (`elem` ['A' .. 'Z'])) . words

delAllUpper :: String -> String
delAllUpper = unwords . filter (any (`elem` ['a' .. 'z'])) . words