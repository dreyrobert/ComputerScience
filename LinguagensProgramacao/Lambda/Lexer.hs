module Lexer where 

import Data.Char

data Expr = BTrue
          | BFalse 
          | Num Int 
          | Var String
          | Lam String Ty Expr 
          | App Expr Expr
          | Add Expr Expr 
          | And Expr Expr
          | Minus Expr Expr
          | Or Expr Expr
          | Times Expr Expr
          | If Expr Expr Expr 
          | Let String Expr Expr
          | Paren Expr
          | Eq Expr Expr
          deriving Show

data Ty = TBool 
        | TNum 
        | TFun Ty Ty 
        deriving (Show, Eq)

data Token = TokenNum Int
        | TokenPlus
        | TokenMinus
        | TokenTimes
        | TokenAnd
        | TokenTrue
        | TokenFalse
        | TokenIf
        | TokenThen
        | TokenElse
        | TokenIn
        | TokenOr
        | TokenLet
        | TokenEq
        | TokenBoolean
        | TokenNumber
        | TokenColon
        | TokenArrow 
        | TokenLParen
        | TokenRParen
        | TokenVar String
        | TokenLam
        deriving Show

isToken :: Char -> Bool
isToken c = c `elem` "+-*/\\():=&"

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs) | isSpace c = lexer cs
             | isDigit c = lexNum (c:cs)
             | isAlpha c = lexKW (c:cs)
             | isToken c = lexSymbol (c:cs)
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('-':cs) = TokenMinus : lexer cs
lexer ('*':cs) = TokenTimes : lexer cs
lexer ('\\':cs) = TokenLam : lexer cs
lexer (':':cs) = TokenColon : lexer cs
lexer ('(':cs) = TokenLParen : lexer cs
lexer (')':cs) = TokenRParen : lexer cs
lexer _ = error "Erro léxico: caracter inválido!"

lexNum cs = case span isDigit cs of
              (num, rest) -> TokenNum (read num) : lexer rest 

lexKW cs = case span isAlpha cs of 
              ("true", rest) -> TokenTrue : lexer rest
              ("false", rest) -> TokenFalse : lexer rest
              ("if", rest) -> TokenIf : lexer rest
              ("then", rest) -> TokenThen : lexer rest
              ("else", rest) -> TokenElse : lexer rest
              ("or", rest) -> TokenOr : lexer rest
              ("let", rest) -> TokenLet : lexer rest
              ("in", rest) -> TokenIn : lexer rest
              ("Bool", rest)  -> TokenBoolean : lexer rest 
              ("Number", rest)  -> TokenNumber : lexer rest
              (var, rest) -> TokenVar var : lexer rest

lexSymbol :: String -> [Token]
lexSymbol cs = case span isToken cs of
                   ("->", rest) -> TokenArrow  : lexer rest
                   ("&&", rest) -> TokenAnd    : lexer rest
                   ("==", rest) -> TokenEq     : lexer rest
                   _ -> error "Lexical error: símbolo inválido!"
