{
module Parser where

import Lexer
}

%name parser 
%tokentype { Token }
%error { parseError }

%token 
    num     { TokenNum $$ }
    '+'     { TokenPlus }
    '-'     { TokenMinus }
    '*'     { TokenTimes }
    if      { TokenIf }
    then    { TokenThen }
    else    { TokenElse }
    true   { TokenTrue }
    false  { TokenFalse }
    Or     { TokenOr }
    And   { TokenAnd }
    Let  { TokenLet }
    In  { TokenIn }

%left '+' '-'
%left '*'

%% 

Exp     : num           { Num $1 }
        | Exp '+' Exp   { Add $1 $3 }
        | Exp '-' Exp   { Minus $1 $3 }
        | Exp '*' Exp   { Times $1 $3 }
        | If Exp then Exp else Exp { If $2 $4 $6 }
        | Exp Or Expr { Or $1 $3 }
        | Exp And Expr { And $1 $3 }
        | Let Var '=' Exp In Exp { Let $2 $4 $6 }


{
parseError :: [Token] -> a
parseError _ = error "Erro sintático!"
}