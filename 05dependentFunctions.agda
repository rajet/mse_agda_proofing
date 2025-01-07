open import Agda.Builtin.Nat

data Vec (A : Set) : Nat -> Set where
  [] : Vec A zero
  _::_ : {n : Nat} -> A -> Vec A n -> Vec A (suc n)
infixr 5 _::_

data _x_ (A B : Set) : Set where
    _,_ : A -> B -> A x B

zeroes : (n : Nat) -> Vec Nat n
zeroes zero     = []
zeroes (suc n)  = 0 :: zeroes n

mapVec : {A B : Set} {n : Nat} -> (A -> B) -> Vec A n -> Vec B n
mapVec f []         = []
mapVec f (x :: xs)  = f x :: mapVec f xs
{- mapVec (\f -> f + 1) (zeroes 10) -}

head : {A : Set}{n : Nat} → Vec A (suc n) → A
head (x :: xs) = x

tail : {A : Set} {n : Nat} → Vec A (suc n) → Vec A n
tail (x :: xs) = xs

zipVec : {A B : Set}{n : Nat} -> Vec A n -> Vec B n -> Vec (A x B) n
zipVec [] [] = []
zipVec (x :: xs) (y :: ys) = (x , y) :: zipVec xs ys
{- zipVec (zeroes 10) (mapVec (\f -> f + 1) (zeroes 10))­ -}

-- `Fin n` denotes a finite type that contains exactly n elements,
--  where `n : Nat`, such that
-- `Fin zero` should be empty
-- `Fin 1` should only contain `zeroF`
-- `Fin 2` should only contain `zeroF, sucF zeroF`
-- `Fin 3` should only contain `zeroF, sucF zeroF, sucF (sucF zeroF)`
data Fin : Nat → Set where
    zero : {n : Nat} → Fin (suc n)
    suc : {n : Nat} → Fin n → Fin (suc n)

-- input 1 --> parsed zu (suc zero) --> matching Fin (suc zero) --> zero
-- input 2 --> parsed zu (suc (suc zero)) --> matching Fin -> Fin (suc n) --> suc

lookupVec : {A : Set} {n : Nat} -> Vec A n -> Fin n -> A
lookupVec (x :: xs) zero    = x
lookupVec (x :: xs) (suc i) = lookupVec xs i

{-{}-}