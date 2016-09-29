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
