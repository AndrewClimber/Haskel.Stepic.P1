-- для бесконечных списков
evenOnly :: [a] -> [a]
evenOnly = foldr (\(acc, x) xs-> if even acc then x : xs else xs) [] . zip  (cycle [1,2])


-- от преподавателя.
-- От решения предыдущей задачи отличается наличием очень важной тильдочки.
-- ~ это - lazy pattern matching - смотреть в интернете.
evenOnly :: [a] -> [a]
evenOnly = snd . foldr (\x ~(xs, ys) -> (x : ys, xs)) ([], [])

-- интересная функция свертки
evenOnly :: [a] -> [a]
evenOnly = snd . foldr f ([],[]) where
    f x p = (x:snd p, fst p)


-- без fold
evenOnly :: [a] -> [a]
evenOnly [] = []
evenOnly [_] = []
evenOnly (_ : x2 : xs) = x2 : evenOnly xs

-- без fold
-- интересно map fst  или map snd . И filter (even . snd) , filter fst
evenOnly :: [a] -> [a]
evenOnly xs = map fst $ filter (even . snd) $ zip xs [1..]

evenOnly :: [a] -> [a]
evenOnly = map snd . filter fst . zipWith (\c x -> (even c, x)) [1..]
