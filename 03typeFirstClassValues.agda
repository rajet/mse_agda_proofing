open import Agda.Builtin.Nat
open import Agda.Builtin.Bool
open import Agda.Builtin.String

if_then_else_ : {A : Set} -> Bool -> A -> A -> A
if true then x else y   = x
if false then x else y  = y

{-
  Create a List type
-}
data List (A : Set) : Set where
    []      : List A
    _::_    : A -> List A -> List A
infixr 5 _::_

{-
  Create a Tupel type
-}
data _x_ (A B : Set) : Set where
    _,_ : A -> B -> A x B

fst : {A B : Set} -> A x B -> A
fst (x , y) = x

snd : {A B : Set} -> A x B -> B
snd (x , y) = y
{-
    fst ("asd" , "fgh") --> "asd"
-}