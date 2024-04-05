data Nat = Zero | Suc Nat deriving Show

um :: Nat
um = Suc Zero

dois :: Nat
dois = Suc um

tres :: Nat
tres = Suc dois

quatro :: Nat
quatro = Suc tres

nat2integer :: Nat -> Integer
nat2integer Zero = 0
nat2integer (Suc n) = 1 + nat2integer n

integer2nat :: Integer -> Nat
integer2nat n
    | n < 0     = error "Número negativo não é natural"
    | n == 0    = Zero
    | otherwise = Suc (integer2nat (n - 1))

-- vou tirando um da segunda variavel e adicionando um suc na primeira ate a segunda variavel zerar
natAdd :: Nat -> Nat -> Nat
natAdd m Zero = m
natAdd m (Suc n) = Suc (natAdd m n)

-- a subtração de 1 de todos ate o segundo ficar zero, sobrando somente a difença em m.
natSub :: Nat -> Nat -> Nat
natSub m Zero = m
natSub Zero _ = error "Não é possível subtrair de zero"
natSub (Suc m) (Suc n) = natSub m n

-- a multiplicação é o mesmo número somado o numéro de vezes que está sendo multiplicado
natMul :: Nat -> Nat -> Nat
natMul _ Zero = Zero
natMul m (Suc n) = natAdd m (natMul m n)
