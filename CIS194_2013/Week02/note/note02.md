# Algebraic Data Types

Enumeration types
---

Haskell allows programmers to create their own enumeration types.

```haskell
data Thing = Shoe
           | Ship
           | ShealingWax
           | Cabbage
           | King
           deriving Show
```

This declares a new type *Thing* with five data constructors *Shoe*, *Ship*, etc.  which are the (only) values of type Thing.  

```haskell
shoe :: Thing
shoe = Shoe

listO'Things :: [Thing]
listO'Things = [Shoe, SealingWax, King, Cabbage, King]

isSmall :: Thing -> Bool
isSmall Shoe       = True
isSmall Ship       = False
isSmall SealingWax = True
isSmall Cabbage    = True
isSmall King       = False
```



Beyond enumerations
---

Ennumerations are actually only a special case of Haskell's more general algebraic data types.  

This is a first example of a data type which is not just an anumeration.

```haskell
data FailableDouble = Failure
                    | OK Double
                    deriving Show
```

*FailableDouble* type has two data constructors.

1. *Failure*  
   It takes no arguments, so Failure by itself is a value of type *FailableDouble*.

2. *OK*  
   It takes an argument of type Double. So *OK*, byitself is not a value of type *FailableDouble*; we need to give it a *Double*.

Examples
```haskell
example1 = Failure
example2 = OK 3.14

safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv x y = OK (x/y)

failureToZero :: FailableDouble -> Double
failureToZero Failure = 0
failureToZero (OK d) = d
```

Data constructors can have more than one argument.

```haskell
data Person = Person String Int Thing
  deriving Show

john :: Person
john = Person "John" 45 Cabbage

getAge :: Person -> Int
getAge (Person _ a _) = a
```

*Notice how the type constructor and data constructor are both named Person, but they inhabit different namespaces and are different things.*


Algebraic data types in general
---
In general, an algebraic data type has one or more data constructors, and each data constructor can have zero or more arguments.

NOTE
- Type and data constructor names must always start with a capital letter; variables (including names of functions)must start with a lowercase letter.

Pattern-matching
---

1. An underscore ( _ )can be used as a "wildcard pattern" which matches anything.
2. A pattern of the form ***x@pat*** can be used to match a value against the pattern ***pat*** ,but also give the name ***x*** to the entire value begin matched.  For example:  
```haskell
trim :: [Char] -> [Char]
trim str@(c:cs) | c == '0'  = trim cs
                | otherwise = str

main = putStrLn (trim "00123")  -- : 123
````

3. Patterns can be nested.


Case expressions
---
In general, a *case* expression looks like
```haskell
case <exp> of
  pat1 -> exp1
  pat2 -> exp2
 ...
```

Recursive data types
---

Data type can be recursive, like this.
```haskell
data IntList = Empty | Cons Int IntList
```

We often use recursive functions to process recursive data types.

```haskell
intListProd :: IntList -> Int
intListProd Empty = 1
intListProd (Cons x l) = x * intListProd l
```

As another simple example, we can define a type of binary trees with an int values stored at each internal node, and a Char stored at each leaf:
```haskell
data Tree = Leaf Char
          | Node Tree Int Tree
          deriving Show


tree :: Tree
tree = Node (Leaf 'x') 1 (Node (Leaf 'y') 2 (Leaf 'z'))
```
