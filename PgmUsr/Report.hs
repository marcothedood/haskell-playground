module Report where 

data Report = Report [Entry]
data Entry = Entry String [String]

mkReport :: String -> Report
mkReport _ = Report []

printReport :: Report -> IO()
printReport _ = putStrLn "fuckme"

