-- Exercício 1
salario :: Double -> Double
salario x = x * 1.1 - x * 0.07

-- Exercício 2
mediaFinal :: Double -> Double -> Double -> Double
mediaFinal a b c = a * 0.2 + b * 0.3 + c * 0.5

conceito :: Double -> Double -> Double -> Char
conceito a b c
    | media >= 8 && media <= 10 = 'A'
    | media >= 7 && media < 8 = 'B'
    | media >= 6 && media < 7 = 'C'
    | media >= 5 && media < 6 = 'D'
    | otherwise = 'F'
    where media = mediaFinal a b c

-- Exercício 3
precoRetrato :: Integer -> String -> Double
precoRetrato a b
    | b == "sabado" || b == "domingo" = custo * 1.2
    | otherwise = custo 
    where custo = custoPessoa a

custoPessoa :: Integer -> Double
custoPessoa a
 | a == 1 = 100.00
 | a == 2 = 130
 | a == 3 = 150
 | a == 4 = 165
 | a == 5 = 175
 | a == 6 = 180
 | otherwise = 185

-- Exercício 4
fatorialDuplo :: Integer -> Integer
fatorialDuplo 1 = 1
fatorialDuplo 0 = 1
fatorialDuplo a = a * fatorialDuplo(a-2)

--Exercício 5
potencia :: Integer -> Integer -> Integer
potencia x 0 = 1
potencia x n = x * (potencia x (n-1))

-- Exercício 7
ultimo :: [a] -> a
ultimo a = head (reverse a)

-- Exercício 8
primeiros :: [a] -> [a]
primeiros a = reverse( tail(reverse a))

-- Exercício 9
multiplicacaoLista :: Num a => [a] -> [a] -> [a]
prod_elem [] [] = []
multiplicacaoLista (a:as) (b:bs) = ( a * b) : multiplicacaoLista as bs 
