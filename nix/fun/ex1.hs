module Main where

main = print result

result = pipe P

data Fruit = B | A | P
data User = User Int String deriving Show

eats :: Fruit -> User
eats A = User 33 "Andy"
eats B = User 69 "Marco"
eats P = eats B


name :: User -> String
name (User x y) = y

len :: [a] -> Int
len [] = 0
len (x:xs) = 1 + len xs

pipe :: Fruit -> Int
pipe x = len (name (eats x))

""