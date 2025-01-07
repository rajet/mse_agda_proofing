data Either (A B : Set) : Set where
    left  : A -> Either A B
    right : B -> Either A B

data ⊤ : Set where 
    tt : ⊤

data ⊥ : Set where

absurd : {A : Set} → ⊥ → A 
absurd ()

data _x_ (A B : Set) : Set where
    _,_ : A -> B -> A x B

{- Exercise 3.1 -}
cases : {A B C : Set} -> Either A B -> (A -> C) -> (B -> C) -> C
cases (left a)  f g    = f a
cases (right b) f g    = g b

{- Exercise 3.2 -}
ex1 : {A B : Set} -> A -> (B -> A)
ex1 a = \_ -> a

ex2 : {A : Set} -> (A x ⊤) -> (Either A ⊥)
ex2 (a , _) = left a 

ex3 : {A B C : Set} -> (A -> (B -> C)) -> ((A x B) -> C)
ex3 f (a , b) = f a b

ex4 : {A B C : Set} -> (A x (Either B C)) -> Either (A x B) (A x C)
ex4 (a , left b) = left (a , b)
ex4 (a , right c) = right (a , c)

ex5 : {A B C D : Set} -> ((A -> C) x (B -> D)) -> ((A x B) -> (C x D))
ex5 (f , g) (a , b) = (f a , g b)

{- Exercise 3.3 -}
ex6 : {P : Set} → (Either P (P → ⊥) → ⊥) → ⊥
ex6 f = f (right λ p → f (left p))