module TypeChecker where 

import Lexer

type Ctx = [(String, Ty)]

typeof :: Ctx -> Expr -> Maybe Ty
typeof _ BTrue = Just TBool 
typeof _ BFalse = Just TBool 
typeof _ (Num _) = Just TNum

typeof ctx (Add e1 e2) = 
    case (typeof ctx e1, typeof ctx e2) of 
        (Just TNum, Just TNum) -> Just TNum
        _                      -> Nothing 

typeof ctx (And e1 e2) = 
    case (typeof ctx e1, typeof ctx e2) of 
        (Just TBool, Just TBool) -> Just TBool 
        _                        -> Nothing

typeof ctx (If e e1 e2) = 
    case typeof ctx e of 
        Just TBool -> case (typeof ctx e1, typeof ctx e2) of 
                          (Just t1, Just t2) -> if t1 == t2 then Just t1 else Nothing
                          _                  -> Nothing 
        _          -> Nothing

typeof ctx (Var v) = lookup v ctx 

typeof ctx (Lam v t1 b) = 
    case typeof ((v, t1) : ctx) b of
        Just t2 -> Just (TFun t1 t2)
        Nothing -> Nothing

typeof ctx (App t1 t2) = 
    case (typeof ctx t1, typeof ctx t2) of 
        (Just (TFun t11 t12), Just t2') -> if t11 == t2' then Just t12 else Nothing
        _                               -> Nothing 

typeof ctx (Eq e1 e2) = 
    case (typeof ctx e1, typeof ctx e2) of 
        (Just t1, Just t2) -> if t1 == t2 then Just TBool else Nothing
        _                  -> Nothing

typeof ctx (Paren e) = typeof ctx e

typeof ctx (Try e1 e2) = 
    case (typeof ctx e1, typeof ctx e2) of
        (Just TError, Just t2) -> Just t2
        -- (Just t1, Just t2) -> if t1 == t2 then Just t1 else Just TError
        (Just t1, _)            -> Just t1
        _           -> Nothing

typeof _ Err = Just TError

typecheck :: Expr -> Expr 
typecheck e = case typeof [] e of
                Just _ -> e 
                _      -> error "Type error"
