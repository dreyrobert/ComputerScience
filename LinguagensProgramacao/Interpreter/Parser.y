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
    if      { TokenIf }
    then    { TokenThen }
    else    { TokenElse }

%left '+'

%% 

Exp     : num           { Num $1 }
        | Exp '+' Exp   { Add $1 $3 }
        | If Exp then Exp else Exp { If $2 $4 $6 }

{
parseError :: [Token] -> a
parseError _ = error "Erro sintático!"
}