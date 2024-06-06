module Interpreter where

import Lexer

subst :: String -> Expr -> Expr -> Expr 
subst x n b@(Var v) = if v == x then 
                        n 
                      else 
                        b 
subst x n (Lam v t b) = Lam v t (subst x n b)
subst x n (App e1 e2) = App (subst x n e1) (subst x n e2)
subst x n (Add e1 e2) = Add (subst x n e1) (subst x n e2)
subst x n (And e1 e2) = And (subst x n e1) (subst x n e2)
subst x n (If e e1 e2) = If (subst x n e) (subst x n e1) (subst x n e2)
subst x n (Paren e) = Paren (subst x n e)
subst x n (Eq e1 e2) = Eq (subst x n e1) (subst x n e2)
subst x n e = e 

isvalue :: Expr -> Bool 
isvalue BTrue = True
isvalue BFalse = True
isvalue (Num _) = True
isvalue (Lam _ _ _) = True 
isvalue _ = False 

step :: Expr -> Either String Expr 
step (Add (Num n1) (Num n2)) = Right (Num (n1 + n2))
step (Add (Num n1) e2) = step e2 >>= \e2' -> Right (Add (Num n1) e2')
step (Add e1 e2) = step e1 >>= \e1' -> Right (Add e1' e2)
step (And BTrue e2) = Right e2 
step (And BFalse _) = Right BFalse 
step (And e1 e2) = step e1 >>= \e1' -> Right (And e1' e2)
step (If BTrue e1 _) = Right e1 
step (If BFalse _ e2) = Right e2 
step (If e e1 e2) = step e >>= \e' -> Right (If e' e1 e2)
step (App e1@(Lam x t b) e2) | isvalue e2 = Right (subst x e2 b)
                             | otherwise = step e2 >>= \e2' -> Right (App e1 e2')
step (App e1 e2) = step e1 >>= \e1' -> Right (App e1' e2)
step (Paren e) = Right e
step (Eq e1 e2) | isvalue e1 && isvalue e2 = Right $ if e1 == e2 then BTrue else BFalse 
                | isvalue e1 = step e2 >>= \e2' -> Right (Eq e1 e2')
                | otherwise = step e1 >>= \e1' -> Right (Eq e1' e2)
step e = Right e 

eval :: Expr -> Either String Expr 
eval e | isvalue e = Right e 
       | otherwise = step e >>= eval
