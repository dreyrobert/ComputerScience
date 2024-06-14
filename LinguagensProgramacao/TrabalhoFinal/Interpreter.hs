module Interpreter where

import Lexer

-- Substituição de variáveis em expressões
subst :: String -> Expr -> Expr -> Expr 
subst x n b@(Var v) = if v == x then n else b 
subst x n (Lam v t b) = Lam v t (subst x n b)
subst x n (App e1 e2) = App (subst x n e1) (subst x n e2)
subst x n (Add e1 e2) = Add (subst x n e1) (subst x n e2)
subst x n (And e1 e2) = And (subst x n e1) (subst x n e2)
subst x n (If e e1 e2) = If (subst x n e) (subst x n e1) (subst x n e2)
subst x n (Paren e) = Paren (subst x n e)
subst x n (Eq e1 e2) = Eq (subst x n e1) (subst x n e2)
subst x n (Try e1 e2) = Try (subst x n e1) (subst x n e2)
subst x n e = e 

-- Verifica se uma expressão é um valor
isvalue :: Expr -> Bool
isvalue BTrue = True
isvalue BFalse = True
isvalue (Num _) = True
isvalue (Lam _ _ _) = True
isvalue (Error _) = True
isvalue _ = False

-- Realiza um passo de avaliação
step :: Expr -> Maybe Expr 
step (Add (Num n1) (Num n2)) = Just (Num (n1 + n2))
step (Add (Num n1) e2) | not (isvalue e2) = case step e2 of
                                               Just e2' -> Just (Add (Num n1) e2')
                                               _        -> Nothing
                       | otherwise = Just (Error "Add requires numerical operands")
step (Add e1 e2) | not (isvalue e1) = case step e1 of
                                        Just e1' -> Just (Add e1' e2)
                                        _        -> Nothing
                 | isvalue e1 && not (isvalue e2) = case step e2 of
                                                     Just e2' -> Just (Add e1 e2')
                                                     _        -> Nothing
                 | otherwise = Just (Error "Add requires numerical operands")
step (And BFalse _) = Just BFalse 
step (And BTrue e2) = Just e2
step (And e1 e2) | isvalue e1 && not (isvalue e2) = case step e2 of 
                                                     Just e2' -> Just (And e1 e2')
                                                     _        -> Nothing
                 | not (isvalue e1) = case step e1 of 
                                        Just e1' -> Just (And e1' e2)
                                        _        -> Nothing
                 | otherwise = Just (Error "And requires boolean operands")
step (If BTrue e1 _) = Just e1
step (If BFalse _ e2) = Just e2
step (If e e1 e2) | not (isvalue e) = case step e of
                                        Just e' -> Just (If e' e1 e2)
                                        _       -> Nothing
                  | otherwise = Just (Error "If condition must be a boolean value")
step (App e1@(Lam x t b) e2) 
  | isvalue e2 = Just (subst x e2 b)
  | otherwise  = case step e2 of 
                   Just e2' -> Just (App e1 e2')
                   _        -> Nothing 

step (App e1 e2) 
  | not (isvalue e1) = case step e1 of
                         Just e1' -> Just (App e1' e2)
                         _        -> Nothing
  | otherwise        = Just (Error "App requires function in first position")
step (Paren e) = Just e
step (Eq e1 e2) 
  | isvalue e1 && isvalue e2 = if e1 == e2 then
                                 Just BTrue 
                               else 
                                 Just BFalse 
  | isvalue e1 = case step e2 of 
                   Just e2' -> Just (Eq e1 e2')
                   _        -> Nothing
  | not (isvalue e1) = case step e1 of 
                         Just e1' -> Just (Eq e1' e2)
                         _        -> Nothing
  | otherwise = Just (Error "Eq requires values")
step (Var x) = Just (Error ("Unbound variable: " ++ x))
step (Try e1 e2) 
    | isvalue e1 = Just e1
    | otherwise = case step e1 of
                    Just (Error _) -> Just e2
                    Just e1' -> Just (Try e1' e2)
                    _ -> Just e2 
step e = Just e

-- Avalia uma expressão até um valor
eval :: Expr -> Expr 
eval e | isvalue e = e 
       | otherwise = case step e of 
                       Just e' -> eval e'
                       _       -> e

-- Teste
main = do
    let result = eval (Try (And (Num 1) (Num 2)) (Num 0))
    print result
