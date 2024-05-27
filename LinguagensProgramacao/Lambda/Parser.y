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
    "&&"    { TokenAnd }
    "||"    { TokenOr }
    if      { TokenIf }
    then    { TokenThen }
    else    { TokenElse }
    true    { TokenTrue }
    false   { TokenFalse }
    let     { TokenLet }
    in      { TokenIn }
    var     { TokenVar $$ }
    '='     { TokenEq }
    '\\'        { TokenLam }
    ':'         { TokenColon }
    "->"        { TokenArrow }
    '('         { TokenLParen }
    ')'         { TokenRParen }
    Bool        { TokenBoolean }
    Number      { TokenNumber }

%nonassoc if then else
%left "||"
%left "&&"
%left '+'
%left '-'
%left '*'

%% 

Exp     : num                  { Num $1 }
        | var                 { Var $1 }
        | Exp '+' Exp          { Add $1 $3 }
        | Exp '-' Exp          { Minus $1 $3 }
        | Exp '*' Exp          { Times $1 $3 }
        | Exp "&&" Exp         { And $1 $3 }
        | Exp "||" Exp         { Or $1 $3 }
        | if Exp then Exp else Exp  { If $2 $4 $6 }
        | let var '=' Exp in Exp    { Let $2 $4 $6 }
        | '\\' var ':' Type "->" Exp { Lam $2 $4 $6 }
        | '(' Exp ')'           { $2 }

Type    : Bool                       { TBool }
        | Number                     { TNum }
        | '(' Type "->" Type ')'     { TFun $2 $4 }

{
parseError :: [Token] -> a
parseError _ = error "Erro sintático!"
}
