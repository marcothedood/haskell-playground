module Main where

main = print result

{-result = Times lhs rhs
    where
        lhs = Plus (Lit 1) (Lit 2)
        rhs = Plus (Lit 3) (Lit 4)
-}

{-e = Times lhs rhs
    where
        lhs = Plus (Lit 1) (Lit 2)
        rhs = Plus (Lit 3) (Lit 4)
-}
e :: Expr
e = (1 + 2) * (2 + 3)
result = eval e


data Expr = Lit Integer
          | Plus Expr Expr 
          | Times Expr Expr 
         
instance Show Expr where 
    show (Lit x) = show x
    show (Plus x y) = "(" ++ show x ++ "+" ++ show y ++ ")"
    show (Times x y) = "(" ++ show x ++ "*" ++ show y ++ ")"
    
eval :: Expr -> Integer
eval (Lit x) = x
eval (Plus x y) = eval x + eval y
eval (Times x y) = eval x * eval y

instance Num Expr where
    fromInteger x  = Lit x
    lhs + rhs  = Plus lhs rhs
    lhs * rhs = Times lhs rhs

    abs = undefined
    signum = undefined
    negate = undefined