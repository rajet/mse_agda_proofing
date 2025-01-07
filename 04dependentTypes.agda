open import Agda.Builtin.Nat
open import Agda.Builtin.Bool

not : Bool -> Bool
not true = false
not false = true

id : {A : Set} -> A -> A
id x = x

data Flavour : Set where
  cheesy : Flavour
  choccolatey : Flavour

data Food : Flavour -> Set where
  pizza : Food cheesy
  cake  : Food choccolatey
  bread : {f : Flavour} -> Food f

amountOfCheese : Food cheesy -> Nat
amountOfCheese pizza = 100
amountOfCheese bread = 20

data Vec (A : Set) : Nat -> Set where
  [] : Vec A zero
  _::_ : {n : Nat} -> A -> Vec A n -> Vec A (suc n)
infixr 5 _::_

myVec1 : Vec Nat 4
myVec1 = 1 :: 2 :: 3 :: 4 :: []

myVec2 : Vec Nat 0
myVec2 = []

myVec3 : Vec (Bool → Bool) 2
myVec3 = not :: id :: []