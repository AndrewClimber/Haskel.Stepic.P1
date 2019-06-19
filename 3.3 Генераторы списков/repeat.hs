{-
Предположим, что функция repeat, была бы определена следующим образом:
repeat = iterate repeatHelper
определите, как должна выглядеть функция repeatHelper.
-}


import Prelude hiding (repeat)

repeat = iterate repeatHelper where
    repeatHelper  = id


