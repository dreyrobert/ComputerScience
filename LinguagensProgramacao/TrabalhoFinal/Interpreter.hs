import Lexer

step :: Expr -> Expr
step (Add (Num n1) (Num n2)) = Num (n1 + n2)
step(Add(Num n1) e2) = Add (Num n1) (step e2)
step(Add e1 e2) = Add (step e1) e2

step(And( BFalse e2)) = false
step(And( BTrue e2)) = step(e2)

step(If(BTrue e1 e2)) = e1
step(If(BFalse e1 e2)) = e2
step(If(e1 e2 e3)) = If(step(e1) e2 e3)