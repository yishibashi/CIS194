module Golf where

skips :: [a] -> [[a]]
skips xs = [map geti [(x * i) - 1 | x <- [1..size], (x*i-1) < size] | i <- [1..size]]
   where geti = (!!) xs -- get i : get i_th element from xs
         size = length xs -- size of xs
-- each i (1 to size), while x*i-1<size, get i_th,i*2_th,...,i*x_th element from xs and
-- make them wrap every i.
-- and each i_th list is bundled by outer [, ] .


localMaxima :: [Integer] -> [Integer]
localMaxima (x:xs@(y:z:_)) = lm ++ localMaxima xs
    where lm = if  x < y && y > z then [y] else []
localMaxima _ = []
