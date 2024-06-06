module TypeChecker where 

import Lexer

type Ctx = [(String, Ty)]

data TypeError = TypeError String deriving Show

typeof :: Ctx -> Expr -> Either TypeError Ty
typeof _ BTrue = Right TBool 
typeof _ BFalse = Right TBool 
typeof _ (Num _) = Right TNum
typeof ctx (Add e1 e2) = do
  t1 <- typeof ctx e1
  t2 <- typeof ctx e2
  if t1 == TNum && t2 == TNum then
    Right TNum
  else
    Left $ TypeError "Type error in Add"
typeof ctx (And e1 e2) = do
  t1 <- typeof ctx e1
  t2 <- typeof ctx e2
  if t1 == TBool && t2 == TBool then
    Right TBool
  else
    Left $ TypeError "Type error in And"
typeof ctx (If e e1 e2) = do
  t <- typeof ctx e
  if t == TBool then do
    t1 <- typeof ctx e1
    t2 <- typeof ctx e2
    if t1 == t2 then
      Right t1
    else
      Left $ TypeError "Type mismatch in branches of If"
  else
    Left $ TypeError "Condition in If is not a Bool"
typeof ctx (Var v) = maybe (Left $ TypeError $ "Unbound variable " ++ v) Right (lookup v ctx)
typeof ctx (Lam v t1 b) = do
  t2 <- typeof ((v, t1):ctx) b
  Right $ TFun t1 t2
typeof ctx (App e1 e2) = do
  t1 <- typeof ctx e1
  t2 <- typeof ctx e2
  case t1 of
    TFun t11 t12 -> if t2 == t11 then Right t12 else Left $ TypeError "Type mismatch in App"
    _ -> Left $ TypeError "First expression in App is not a function"
typeof ctx (Eq e1 e2) = do
  t1 <- typeof ctx e1
  t2 <- typeof ctx e2
  if t1 == t2 then Right TBool else Left $ TypeError "Type mismatch in Eq"
typeof ctx (Paren e) = typeof ctx e

typecheck :: Expr -> Either TypeError Ty
typecheck expr = typeof [] expr
