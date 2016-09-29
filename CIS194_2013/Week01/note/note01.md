# Week1 Introduction to Haskell

What is Haskell?
---

- Functional  
  Functions are *first-class*.  
  Evaluating expressions

- Pure  
  Everything is *immutable*.  
  Expressions never have *side effect*(like updating gloval variables or printing to the screen).  
  Calling the same function with same arguments results in the same output.
- Lazy  
  Expressions are not evaluated until their results are actually needed.
- Statically typed  
  Every expression has a type, and types are all checked at compile-time.

Theme
---

- Types

- Abstraction

- Wholemeal programming  
  > Wholemeal programming means to think big: work with an entire  
  >list rather than a sequence of elements; develop a solution space,  
  >rather than an individual solution; imagine a graph, rather than  
  >single path.
  > The wholemeal approach often offers new insights or provides new  
  >perspectives on a given problem.


Declarations and variables
---
```Haskell
x :: Int
x = 3
```
The above code declares a variable x with type Int.

Basic Types
---
- Int: $\pm 2^{63}$
- Integer: limited only by the amount of memory on your machine
- Double: floating-point numbers
- Float: single precision floating point numbers
- Boolean
- Character
- String

GHCi
---
- :load(:l). load Haskell files
- :reload(:r). reload Haskell files
- :type(:t). ask for the type of an expression

There are many other things , try :? .

Arithmetic
---
Arithmetics: + , - , * , mod , ^ ,

Operation is only between values of the same numeric type.  
Haskell does not do implicit conversion.

You must explicitly convert with

- fromIntegral: converts from Int or Integer to any other numeric type.
- round, floor, ceiling: convert floating-point numbers to Int or Integer



Boolean logic
---
Ture, False.

- operations:  
  && , || , not , == , /= (not eq) ,  
  < , > , <= , >=


Defining basic functions
---
```haskell
idx :: Double -> Double -- idx takes Double as input and
idx x = x               -- yields another Double as output
```

Pairs
---
```haskell
p :: (Int, Char)
p = (3, 'x')

sumPair :: (Int, Int) -> Int
sumPair (x, y) = x + y
```

Using functions, and multiple arguments
---
```haskell
f :: Int -> Int -> Int -> Int
f x y z = x + y + z
```

List
---
```haskell
nums, range, range2 :: [Integer]
nums = [1,2,3,4,5]
range = [1..100]
range2 = [2,4..100]
```
Haskell (like Python) also has list compreensions.

Strings are jjust lists of characters. That is, String is  
just an abbrevation for [Char].

```haskell
hello1 :: [Char]
hello1 = ['h', 'e', 'l', 'l', 'o']

hello2 :: String
hello2 = "hello"

helloSame = hello1 == hello2 -- => True
```

Constructing lists
---
```haskell
emptyList = []
List1 = 1 : [] -- cons operator (:)
List12 = 2 : List1 -- => [1, 2]
-- ERROR > List1 : 2

[1, 2, 3] == 1 : 2 : 3 : [] -- True
```

*cons* takes an element and a list, and produces a new list with  
the element prepended to the front

Functions on lists
---
We can write functions on lists using pattern matching.

```haskell
-- Compute the length of a list of Integers.
intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x:xs) = 1 + intListLength xs
-- OR
-- intListLength (_:xs) = 1 + intListLength xs
```

Combining functions
---
```haskell
-- Generate the sequence of hailstone iterations from a starting number.
hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x:xs) = 1 + intListLength xs

-- The number of hailstone steps needed to reach 1 from a starting
-- number.
hailstoneLen :: Integer -> Integer
hailstoneLen n = intListLength (hailstoneSeq n) - 1
```
This may seem inefficient to you: it generates the entire hailstone sequence
first and then finds its length, which wastes lots of memory ... doesn't it?
Actually, it doesn't! Because of Haskell's lazy evaluation, each element of
the sequence is only generated as needed, so the sequence generation and list
length calculation are interleaved. The whole computation uses only O(1) memory,
no matter how long the sequence.(Actually, this is a tiny white lie but explaining
why (and how to fix it) will have to wait a few weeks.)


A word about error messages
---
