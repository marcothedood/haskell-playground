module Main where

main = print (f Andy)

data Pplroom = Vito | Marco | Andy
data Ageclass = Youngsters | Daddy | Ancients
    deriving Show


age :: Pplroom -> Int
age Vito = 21
age Marco = 25
age Andy = 53

cl :: Int -> Ageclass
cl x   | x < 22 = Youngsters 
       | 23 < x  && x <= 40 = Daddy 
       | x > 41 = Ancients 

f x = cl (age x)

