module Main where

import Lexer 
import Interpreter
import Parser
import TypeChecker

main :: IO ()
main = getContents >>= putStrLn . eval . typeof . parser . lexer 
