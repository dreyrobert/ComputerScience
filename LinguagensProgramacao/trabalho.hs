data Nat = Zero | Suc Nat

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

natAdd :: Nat -> Nat -> Nat
natAdd m Zero = m
natAdd m (Suc n) = Suc (natAdd m n)

natSub :: Nat -> Nat -> Nat
natSub m Zero = m
natSub Zero _ = error "Não é possível subtrair de zero"
natSub (Suc m) (Suc n) = natSub m n

natMul :: Nat -> Nat -> Nat
natMul _ Zero = Zero
natMul m (Suc n) = natAdd m (natMul m n)

instance Show Nat where
    show Zero = "Zero"
    show (Suc n) = "Suc (" ++ show n ++ ")"


main :: IO ()
main = do
    -- Teste da representação dos números de 1 a 4
    putStrLn "Representação dos números de 1 a 4:"
    putStrLn $ "Um: " ++ show (nat2integer um)
    putStrLn $ "Dois: " ++ show (nat2integer dois)
    putStrLn $ "Três: " ++ show (nat2integer tres)
    putStrLn $ "Quatro: " ++ show (nat2integer quatro)
    putStrLn ""

    -- Teste da conversão de Nat para Integer
    putStrLn "Teste de conversão de Nat para Integer:"
    let n = integer2nat 5
    putStrLn $ "Nat 5: " ++ show n
    putStrLn ""

    -- Teste da conversão de Integer para Nat
    putStrLn "Teste de conversão de Integer para Nat:"
    let m = nat2integer (Suc (Suc Zero))
    putStrLn $ "Integer (Suc (Suc Zero)): " ++ show m
    putStrLn ""

    -- Teste de adição
    putStrLn "Teste de adição:"
    let soma = natAdd dois tres
    putStrLn $ "Dois + Três: " ++ show (nat2integer soma)
    putStrLn ""

    -- Teste de subtração
    putStrLn "Teste de subtração:"
    let subtracao = natSub tres um
    putStrLn $ "Três - Um: " ++ show (nat2integer subtracao)
    putStrLn ""

    -- Teste de multiplicação
    putStrLn "Teste de multiplicação:"
    let multiplicacao = natMul dois tres
    putStrLn $ "Dois * Três: " ++ show (nat2integer multiplicacao)
