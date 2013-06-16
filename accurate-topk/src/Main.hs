module Main where

import Control.Applicative
import Data.List
import Data.Ord
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  let k = argNumber args "-k" 10
  els <- lines <$> getContents
  putStrLn . show $ topK k els
  where
    argNumber :: [String] -> String -> Integer -> Integer
    argNumber [] _ d = d
    argNumber (x:(y:_)) f _ | x==f = read y
    argNumber (_:xs) f d = argNumber xs f d

topK :: (Ord e) => Integer -> [e] -> [(e, Integer)]
topK k =
    take (fromIntegral k) . reverse
                          . sortBy (comparing snd)
                          . map (\x -> (head x, fromIntegral $ length x))
                          . group
                          . sort
