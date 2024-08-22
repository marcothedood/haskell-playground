module Main where 

import Report

main = do 
    input <- getContents
    let report = mkReport input
    printReport report