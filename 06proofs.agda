data Bool : Set where
  true : Bool
  false : Bool

data Nat : Set where
  zero : Nat
  suc : Nat -> Nat
{-# BUILTIN NATURAL Nat #-}

data Either (A B : Set) : Set where
  left  : A -> Either A B
  right : B -> Either A B
  
data _x_ (A B : Set) : Set where
    _,_ : A -> B -> A x B

not : Bool -> Bool
not true = false
not false = true

{-                           ((A => B) and A) proof for B-}
modusPonens : {P Q : Set} -> (P -> Q) x P -> Q
modusPonens (f , x) = f x

cases : {P Q R : Set} -> Either P Q -> (P -> R) x (Q -> R) -> R
cases (left x) (f , g)  = f x
cases (right y) (f , g) = g y

data ⊤ : Set where
    tt : ⊤
    
data ⊥ : Set where

ex1 : {P Q R : Set} -> (P -> Q) x (Q -> R) -> (P -> R)
ex1 (f , g) = \x -> g (f x)

{- ex2 : {P Q R : Set} -> (not P x not Q) -> not (Either P Q)
ex2 (f , g) (Left p) = f p
ex2 (f , g) (Right q) = g q -}

data IsEven : Nat -> Set where
  e-zero : IsEven zero
  e-suc2 : {n : Nat} -> IsEven n → IsEven (suc (suc n))



{-{}-}