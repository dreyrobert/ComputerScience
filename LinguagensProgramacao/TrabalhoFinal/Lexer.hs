module Lexer where 

import Data.Char 

data Ty = TBool
        | TNum
        | TFun Ty Ty 
        deriving (Show, Eq)

data Expr = BTrue
          | BFalse
          | Num Int 
          | Add Expr Expr 
          | And Expr Expr 
          | If Expr Expr Expr 
          | Var String
          | Lam String Ty Expr 
          | App Expr Expr 
          | Paren Expr
          | Eq Expr Expr
          deriving (Show, Eq)

data Token = TokenTrue 
           | TokenFalse 
           | TokenNum Int 
           | TokenAdd 
           | TokenAnd
           | TokenIf 
           | TokenThen
           | TokenElse 
           | TokenVar String 
           | TokenLam
           | TokenColon
           | TokenArrow 
           | TokenLParen
           | TokenRParen
           | TokenBoolean
           | TokenNumber
           | TokenEq
           deriving Show 

data LexerError = InvalidCharacter Char
                | InvalidSymbol String
                deriving Show

isToken :: Char -> Bool
isToken c = elem c "->&|="

lexer :: String -> Either LexerError [Token]
lexer [] = Right [] 
lexer ('+':cs) = fmap (TokenAdd :) (lexer cs)
lexer ('\\':cs) = fmap (TokenLam :) (lexer cs)
lexer (':':cs) = fmap (TokenColon :) (lexer cs)
lexer ('(':cs) = fmap (TokenLParen :) (lexer cs)
lexer (')':cs) = fmap (TokenRParen :) (lexer cs)
lexer (c:cs) | isSpace c = lexer cs 
             | isDigit c = lexNum (c:cs)
             | isAlpha c = lexKW (c:cs)
             | isToken c = lexSymbol (c:cs)
lexer (c:_) = Left (InvalidCharacter c)

lexNum :: String -> Either LexerError [Token]
lexNum cs = case span isDigit cs of 
              (num, rest) -> fmap (TokenNum (read num) :) (lexer rest)

lexKW :: String -> Either LexerError [Token]
lexKW cs = case span isAlpha cs of 
             ("true", rest)  -> fmap (TokenTrue :) (lexer rest)
             ("false", rest) -> fmap (TokenFalse :) (lexer rest)
             ("if", rest)    -> fmap (TokenIf :) (lexer rest)
             ("then", rest)  -> fmap (TokenThen :) (lexer rest)
             ("else", rest)  -> fmap (TokenElse :) (lexer rest)
             ("Bool", rest)  -> fmap (TokenBoolean :) (lexer rest)
             ("Number", rest)-> fmap (TokenNumber :) (lexer rest)
             (var, rest)     -> fmap (TokenVar var :) (lexer rest)

lexSymbol :: String -> Either LexerError [Token]
lexSymbol cs = case span isToken cs of
                   ("->", rest) -> fmap (TokenArrow :) (lexer rest)
                   ("&&", rest) -> fmap (TokenAnd :) (lexer rest)
                   ("==", rest) -> fmap (TokenEq :) (lexer rest)
                   (sym, _)     -> Left (InvalidSymbol sym) 
