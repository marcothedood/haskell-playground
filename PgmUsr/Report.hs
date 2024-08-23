module Report where 

import Data.List

data Report = Report [Entry]
data Entry = Entry String [String]
type Username = String
type Pgname = String
data ExtractedLine = ExtractedLine Username Pgname

instance Show Entry where
    show (Entry n ps) = n ++ ": " ++ show ps

mkReport :: String -> Report
mkReport = Report . groupByName . extractFields


printReport :: Report -> IO()
printReport (Report entries) = putStrLn reportLines
    where
        reportLines = unlines (map show entries)

extractFields :: String -> [ExtractedLine]
extractFields  = map (toLine . words) . lines

toLine :: [String] -> ExtractedLine
toLine fields = ExtractedLine username pgname
        where 
            username = fields !! 3
            pgname = fields !! 1

groupByName :: [ExtractedLine] -> [Entry]
groupByName  = map toEntry . toBuckets

toEntry :: [ExtractedLine] -> Entry
toEntry [ExtractedLine username pgname] = Entry username [pgname]
toEntry (ExtractedLine username pgname : xs) = Entry username (pgname : ps)
    where
        Entry _ ps = toEntry xs 
 
toBuckets :: [ExtractedLine] -> [[ExtractedLine]]
toBuckets = collectBuckets . sortByName

collectBuckets :: [ExtractedLine] -> [[ExtractedLine]]
collectBuckets = groupBy sameName 
     where
        sameName (ExtractedLine n _) (ExtractedLine n' _) = n == n'


sortByName :: [ExtractedLine] -> [ExtractedLine]
sortByName = sortOn usrn
    where
        usrn (ExtractedLine username pgname) = username

