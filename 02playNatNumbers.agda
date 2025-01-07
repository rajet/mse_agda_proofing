open import Agda.Builtin.Nat
open import Agda.Builtin.Bool

pred : Nat -> Nat
pred zero    = zero
pred (suc x) = x

MyNat : Set
MyNat = Nat

myFour : MyNat
myFour = 4

