module PlayData.Distribution.CountHistogram (
  generateElements,
  NoOfElements,
  CountHistogram(..),
  parseDistribution) where

import Data.Map (Map, fromList, lookup)
import Data.Maybe

import PlayData.Distribution
import PlayData.Element


type NoOfElements = Integer

data CountHistogram = CountHistogram [(Count, NoOfElements)]
  deriving Show

instance Distribution CountHistogram NumberedElement where
  generateElements dist n ch = do
    let elMap = elementMap dist
        total = totalCount dist
    numbers <- randomNumbers n ch total
    return $ map (fromJust . flip Data.Map.lookup elMap) numbers
    where
      totalCount :: CountHistogram -> Integer
      totalCount (CountHistogram dist') = sum $ map (uncurry (*)) dist'

      elementMap :: CountHistogram -> Map Integer NumberedElement
      elementMap (CountHistogram dist') = fromList $ f 0 0 dist'
        where
          f :: Integer -> Integer -> [(Count, NoOfElements)] -> [(Integer, NumberedElement)]
          f _ _ [] = []
          f cc ce ((c, ne):xs) =
            zip (map (+cc) [1..])
                (take (fromIntegral c * fromIntegral ne) $ concatMap (replicate (fromIntegral c) . NumberedElement) [(ce+1)..])
              ++ f (cc + (c * ne)) (ce + ne) xs

instance ParsableDistribution CountHistogram where
  parseDistribution = CountHistogram . map ((\ws -> (read $ head ws, read $ ws!!1)) . words) . lines . map (\e -> if e `elem` "\" (,) " then ' ' else e)
