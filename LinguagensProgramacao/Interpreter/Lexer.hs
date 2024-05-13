module Lexer where 

data Expr = BTrue
          | BFalse 
          | Num Int 
          | Add Expr Expr 
          | And Expr Expr 
          | If Expr Expr Expr
          deriving Show

data Ty = TBool 
        | TNum 
        deriving (Show, Eq)

data Token = TokenNum Int
        | TokenPlus
        | TokenAnd
        | TokenTrue
        | TokenFalse
        | TokenIf
        | TokenThen
        | TokenElse
        deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs) | isSpace c = lexer cs
             | isDigit c = lexNum (c:cs)
             | isAlpha c = lexKW (c:cs)
lexer ('+':cs) = TokenPlus : lexer cs
lexer _ = error "Erro léxico: caracter inválido!"

lexNum cs = case span isDigit cs of 
              (num, rest) -> TokenNum (read num) : lexer rest 

lexKW cs = case span isAlpha cs of 
              ("true", rest) -> TokenTrue : lexer rest
              ("false", rest) -> TokenFalse : lexer rest
              ("if", rest) -> TokenIf : lexer rest
              ("then", rest) -> TokenThen : lexer rest
              ("else", rest) -> TokenElse : lexer rest