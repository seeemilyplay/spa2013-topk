module Main where

import Control.Applicative
import Data.List
import Data.Ord
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  let k = argNumber args "-k" 10
  -- if you need more numeric args do add them here, e.g.
  -- let s = argNumber args "-s" 20
  els <- lines <$> getContents
  putStrLn . show $ topK k els
  where
    argNumber :: [String] -> String -> Integer -> Integer
    argNumber [] _ d = d
    argNumber (x:(y:_)) f _ | x==f = read y
    argNumber (_:xs) f d = argNumber xs f d

topK :: (Ord e) => Integer -> [e] -> [(e, Integer)]
topK k = undefined --your implementation goes here