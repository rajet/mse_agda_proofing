data Nat : Set where
    zero    : Nat
    suc     : Nat -> Nat

data Vec (A : Set) : Nat -> Set where
  [] : Vec A zero
  _::_ : {n : Nat} -> A -> Vec A n -> Vec A (suc n)
infixr 5 _::_

_+_ : Nat -> Nat -> Nat
zero + x = x
suc y + x = suc (y + x)
infixr 4 _+_

_*_ : Nat -> Nat -> Nat
zero * x = zero
suc y * x = x + (y * x)
infixr 4 _*_

{- Exercise 2.1 -}
downFrom : (n : Nat) -> Vec Nat n
downFrom zero       = []
downFrom (suc n)    = n :: downFrom n

{- Exercise 2.2 -}
tail : {A : Set}{n : Nat} -> Vec A (suc n) -> Vec A n
tail (x :: xs) = xs

{-{}-} 

{- Exercise 2.3 -}
dotProduct : {n : Nat} → Vec Nat n → Vec Nat n → Nat
dotProduct [] _ = zero
dotProduct (x :: xs) (y :: ys) = x * y + dotProduct xs ys

data Fin : Nat → Set where
  zero : {n : Nat} → Fin (suc n)
  suc : {n : Nat} → Fin n → Fin (suc n)

{- Exercise 2.4 -}
putVec : {A : Set}{n : Nat} → Fin n → A → Vec A n → Vec A n
putVec zero a (x :: xs)     = a :: xs
putVec (suc n) a (x :: xs)  = x :: putVec n a xs
