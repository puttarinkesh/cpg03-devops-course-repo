


Data Types:
There are 7 Types of Data Types

1. string: a sequence of Unicode characters representing some text, like "hello"  --> ""

terraform   --> "terraform"
salman khan --> "salman khan"
surya kumar yadav  --> "surya kumar yadav"
  "Welcome to our DevOps cpg 03 batch"

  "rinkesh"
  "31_03_2026"
  "99+70"


2. number: a numeric value. The number type can represent both whole numbers like 15 and fractional values like 6.283185.

   9044330999
   500018
   107.60
   96.80
   99.70
   99-70


3. bool: a boolean value, either true or false. bool values can be used in conditional logic.

    true 
    false

    did rinkesh teached you azure ?
    false

4. list (or tuple): a sequence of values, like ["us-west-1a", "us-west-1c"]. Identify elements in a list with consecutive whole numbers, starting with zero.

  ["sandeep", "giri", "girish", "bala", "kishore", "neha", "pooja", "bala", "sandeep"]

  ["safari", "harrier", "benz", "polo", "seltos"]
    [15, 12, 18, 20, 10]
    ["safari", 18, "harrier", 12]

5. map (or object): a group of values identified by named labels, liek {name = "Mabel", age = 52}.

    {
    "rahul" = 97393739,
    "haripriya" = 836393,
    "rajesh" = 9869065,
    "balu" = 245654,
    "sukesh" = 443666
    }

    { rahul = 97393739, haripriya = 836393, rajesh = 9869065, balu = 245654, sukesh = 443666}

{"rahul" = "software", "haripriya" = "scientist", "rajesh" = "creator", "balu" = "designer", "sukesh" = "financialinvestor"}


6. set: a collection of unique values that do not have any secondary identifiers or ordering.

    "rahul", "haripriya", "rahul", "creator", "scientist", "financialinvestor", "scientist"
   
"rahul", "haripriya", "creator", "scientist", "financialinvestor",

  ["sandeep", "giri", "girish", "bala", "kishore", "neha", "pooja", "balakrishna"]


7. null: a value that represents absence or omission. If you set an argument of a resource to null, Terraform behaves as though you had completely omitted it — it will use the argument's default value if it has one, or raise an error if the argument is mandatory. null is most useful in conditional expressions, so you can dynamically omit an argument if a condition isn't met.

age : 
   {
    "rahul" = null,
    "haripriya" = 16,
    "rajesh" = null,
    "balu" = null,
    "sukesh" = 18
    }
