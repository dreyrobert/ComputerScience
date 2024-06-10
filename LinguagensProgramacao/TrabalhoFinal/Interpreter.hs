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
subst x n (Try e1 e2) = Try (subst x n e1) (subst x n e2)
subst x n e = e 

isvalue :: Expr -> Bool
isvalue BTrue = True
isvalue BFalse = True
isvalue (Num _) = True
isvalue (Lam _ _ _) = True
isvalue (Error _) = False
isvalue _ = False

step :: Expr -> Maybe Expr 
step (Add (Num n1) (Num n2)) = Just (Num (n1 + n2))
step (Add (Num n1) e2) = case step e2 of 
                           Just e2' -> Just (Add (Num n1) e2')
                           _        -> Just (Error "Invalid right operand in Add")
step (Add e1 e2) = case step e1 of 
                     Just e1' -> Just (Add e1' e2)
                     _        -> Just (Error "Invalid left operand in Add")
step (And BTrue e2) = Just e2 
step (And BFalse _) = Just BFalse 
step (And e1 e2) = case step e1 of 
                     Just e1' -> Just (And e1' e2)
                     _        -> Just (Error "Invalid left operand in And")
step (If BTrue e1 _) = Just e1 
step (If BFalse _ e2) = Just e2 
step (If e e1 e2) = case step e of 
                      Just e' -> Just (If e' e1 e2)
                      _       -> Just (Error "Invalid condition in If")
step (App e1@(Lam x t b) e2) | isvalue e2 = Just (subst x e2 b)
                             | otherwise = case step e2 of 
                                             Just e2' -> Just (App e1 e2')
                                             _        -> Just (Error "Invalid argument in App")
step (App e1 e2) = case step e1 of 
                     Just e1' -> Just (App e1' e2)
                     _        -> Just (Error "Invalid function in App")
step (Paren e) = Just e
step (Eq e1 e2) | isvalue e1 && isvalue e2 = if (e1 == e2) then
                                               Just BTrue 
                                             else 
                                               Just BFalse 
                | isvalue e1 = case step e2 of 
                                 Just e2' -> Just (Eq e1 e2')
                                 _        -> Just (Error "Invalid right operand in Eq")
                | otherwise = case step e1 of 
                                Just e1' -> Just (Eq e1' e2)
                                _        -> Just (Error "Invalid left operand in Eq")
step (Try e1 e2) | isvalue e1 = Just e1
                 | otherwise = case step e1 of
                                 Just e1' -> Just (Try e1' e2)
                                 _        -> Just e2 
step e = Just e


eval :: Expr -> Expr 
eval e | isvalue e = e 
       | otherwise = case step e of 
                       Just e' -> eval e'
                       _       -> error "Interpreter error!"