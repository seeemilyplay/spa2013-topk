module Main (main) where

import Control.Applicative
import System.Environment

import PlayData

main :: IO ()
main = do
  args <- getArgs
  let n = argNumber args "-n" 100
      ch = argNumber args "-c" 1
      input = head $ reverse args
  if "count-histogram" `elem` args then do
      (dist :: CountHistogram) <- parseDistribution <$> readFile input
      (els :: [NumberedElement]) <- generateElements dist n ch
      putStrLn $ show els
  else do
      (dist :: Histogram) <- parseDistribution <$> readFile input
      (els :: [NamedElement]) <- generateElements dist n ch
      mapM_ (\(NamedElement e) -> putStrLn e) els

  where
    argNumber :: [String] -> String -> Integer -> Integer
    argNumber [] _ d = d
    argNumber (x:(y:_)) f _ | x==f = read y
    argNumber (_:xs) f d = argNumber xs f d
