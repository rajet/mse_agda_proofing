data Nat : Set where
    zero    : Nat
    suc     : Nat -> Nat

{- Exercise 1.1 -}
halve : Nat -> Nat
halve zero          = zero
halve (suc zero)    = zero
halve (suc (suc n)) = suc (halve n)

{- Exercise 1.2 -}

_+_ : Nat -> Nat -> Nat
zero + x = x
suc y + x = suc (y + x)

_*_ : Nat -> Nat -> Nat
zero * x = zero
suc y * x = x + (y * x)

{- Exercise 1.3 -}

data Bool : Set where
    true : Bool
    false : Bool

not : Bool -> Bool
not true = false
not false = true

_&&_ : Bool -> Bool -> Bool
true    && true = true
_ && _          = false

_||_ : Bool -> Bool -> Bool
false || false = false
_ || _         = true

{- Exercise 1.4 -}
data List (A : Set) : Set where
    []      : List A
    _::_    : A -> List A -> List A

length : {A : Set} -> List A -> Nat
length []       = zero
length (x :: xs)   = suc (length xs)

_++_ : {A : Set} -> List A -> List A -> List A
[] ++ ys        = ys
(x :: xs) ++ ys = x :: (xs ++ ys)

map : {A B : Set} -> (A -> B) -> List A -> List B
map f [] = []
map f (x :: xs) = f x :: map f xs

{- Exercise 1.5 -}
data Maybe A : Set where
    just    : A -> Maybe A
    nothing : Maybe A

lookup : {A : Set} -> List A -> Nat -> Maybe A
lookup [] _                 = nothing
lookup (x :: xs) zero       = just x
lookup (x :: xs) (suc n)    = lookup xs n

{- Exercise 1.6 -}
{-
    Could work, but there are out of bounds exceptions which cannot catched using agda.
    Implementation with something like Maybe could help, if the output type would be
    Maybe A

    funnyLookup : {A : Set} -> List A -> Nat -> A
    funnyLookup [] _ = error "Index out of bounds"
    funnyLookup (x :: xs) zero = x
    funnyLookup (x :: xs) (suc n) = funnyLookup xs n
-}

{-
lookup (zero :: []) (suc zero)
-}