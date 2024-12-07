import UIKit

// # Comparison operators
/*
 let yes: Bool = true
 let no: Bool = false
 */

// type inference
let yes = true
let no = false

// ## Boolean operators
let doesOneEqualTwo = (1 == 2)

let doesOneNotEqualTwo = (1 != 2)

let alsoTrue = !(1 == 2)

let isOneGreaterThanTwo = (1 > 2)

let isOneLessThanTwo = (1 < 2)

// ## Boolean logic
let and = true && true

let or = true || false

let andTrue = 1 < 2 && 4 > 3
let andFalse = 1 < 2 && 3 > 4

let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4

let andOr = (1 < 2 && 3 > 4) || 1 < 4

// ## String equality
let guess = "dog"
let dogEqualsCat = guess == "cat"

let order = "cat" < "dog"

// ## Toggling a Bool
var switchState = true
switchState.toggle() // switchState = false
switchState.toggle() // switchState = true

// # The if statement
if 2 > 1 {
    print("Yes, 2 is greater than 1.")
}

let animal = "Fox"

if animal == "Cat" || animal == "Dog" {
    print("Animal is a house pet.")
} else {
    print("Animal is not a house pet.")
}

let hourOfDay = 12
var timeOfDay = ""

if hourOfDay < 6 {
    timeOfDay = "Early morning"
} else if hourOfDay < 12 {
    timeOfDay = "Morning"
} else if hourOfDay < 17 {
    timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
    timeOfDay = "Evening"
} else if hourOfDay < 24 {
    timeOfDay = "Late evening"
} else {
    timeOfDay = "INVALID HOUR!"
}

print(timeOfDay)

// ## Short-circuiting
let name = "Zhou Huajian"

if 1 > 2 && name == "Ai Xiang Sui" {
    // ...
}

if 1 < 2 || name == "Ai Xiang Sui" {
    // ...
}

// ## Encapsulating variables
// You earn $25 for every hour up to 40 hours and $50 for every after that.
var hoursWorked = 45

var price = 0
if hoursWorked > 40 {
    let hoursOver40 = hoursWorked - 40
    price += hoursOver40 * 50
    hoursWorked -= hoursOver40
}

price += hoursWorked * 25

print(price)
// print(hoursOver40) // out of scope

// ## The ternary conditional operator
/*
let a = 5
let b = 10

let min: Int
if a < b {
    min = a
} else {
    min = b
}

let max: Int
if a > b {
    max = a
} else {
    max = b
}
*/

let a = 5
let b = 10

let min = a < b ? a : b
let max = a > b ? a : b

// # Loops

// ## While loops
/*
 while true { }
 */

var sum = 1
while sum < 1000 {
    sum = sum + (sum + 1)
}

// ## Repeat-while loops
sum = 1

repeat {
    sum = sum + (sum + 1)
} while sum < 1000

// the difference between while loop and repeat-while loop
sum = 1

while sum < 1 {
    sum = sum + (sum + 1)
}

sum = 1

repeat {
    sum = sum + (sum + 1)
} while sum < 1

// ## Breaking out of a loop
sum = 1

while true {
    sum = sum + (sum + 1)
    if sum >= 1000 {
        break
    }
}
