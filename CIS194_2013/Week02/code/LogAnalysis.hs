{-# OPTIONS_GHC -Wall #-}

module LogAnalysis where

import           Log

{-- Exercise 1 --}

parseMessage :: String -> LogMessage
parseMessage s = case words s of
  ("E":sote:t:msg) -> LogMessage (Error (read sote)) (read t) (unwords msg)
  ("I":t:msg) -> LogMessage Info  (read t) (unwords msg)
  ("W":t:msg) -> LogMessage Warning (read t) (unwords msg)
  _ -> Unknown s

parse :: String -> [LogMessage]
parse s = map parseMessage $ lines s


{-- Exercise 2 --}

insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) msgT = msgT
insert msg Leaf = Node Leaf msg Leaf
insert msg@(LogMessage _ ts _) (Node left msg'@(LogMessage _ ts' _) right)
  |ts <= ts' = Node (insert msg left) msg' right
  |otherwise = Node left msg' (insert msg right)


{-- Exercise 3 --}

build :: [LogMessage] -> MessageTree
build = foldr insert Leaf


{-- Exercise 4--}

inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node left msg right) =  inOrder left ++ [msg] ++ inOrder right


{-- Exercise 5 --}

whatWentWrong :: [LogMessage] -> [String]
whatWentWrong logs = map getMsg $ filter sev_50ovr msgs
  where msgs = inOrder $ build logs
        -- vvvvv functions vvvvv
        sev_50ovr (LogMessage (Error sev) _ _) = sev >= 50
        sev_50ovr _ = False
        getMsg (LogMessage _ _ m) = m
        getMsg (Unknown _) = ""
