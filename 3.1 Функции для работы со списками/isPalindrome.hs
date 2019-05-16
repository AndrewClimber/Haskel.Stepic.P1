{-
Реализуйте функцию isPalindrome, которая определяет, является ли переданный ей список палиндромом.

GHCi> isPalindrome "saippuakivikauppias"
True
GHCi> isPalindrome [1]
True
GHCi> isPalindrome [1, 2]
False
-}

-- мой
isPalindrome :: Eq a => [a] -> Bool
isPalindrome l = if l == reverse l then True else False 

-- stepik
isPalindrome :: Eq a => [a] -> Bool
isPalindrome a = reverse a == a

-- вот это должно быть быстрее
isPalindrome xs = half xs == (half $ reverse xs)
  where
    half xs = take (length xs `div` 2) xs

--  с лямбдой
isPalindrome = \x -> reverse x == x 

---
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome (x:xs) = (x == last xs) && (isPalindrome (init xs))